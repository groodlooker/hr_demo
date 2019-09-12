include: "*.view"
view: input_data {
  derived_table: {
    datagroup_trigger: hr_project_default_datagroup
    explore_source: employee_features {
      column: employee_number {}
      column: department {}
      column: distance_from_home {}
      column: education {}
      column: education_field {}
      column: gender {}
      column: job_level {}
      column: job_role {}
      column: job_satisfaction {}
      column: marital_status {}
      column: monthly_income {}
      column: num_companies_worked {}
      column: over_time {}
      column: over18 {}
      column: performance_rating {}
      column: random {}
      column: stock_option_level {}
      column: total_working_years {}
      column: years_at_company {}
      column: years_in_current_role {}
      column: years_since_last_promotion {}
      column: years_with_curr_manager {}
      column: attrition {}
    }
  }
}

# filters: {
#   field: employee_features.random
#   value: "<.7"
# }

view: employee_churn_regression {
  derived_table: {
    datagroup_trigger: hr_project_default_datagroup
    sql_create:
      CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
      OPTIONS(model_type='logistic_reg'
        , labels=['attrition']
        , min_rel_progress = 0.005
        , max_iteration = 40
        , auto_class_weights = true
        ) AS
      SELECT
         * EXCEPT(employee_number)
      FROM ${input_data.SQL_TABLE_NAME}
      WHERE random < 0.7
      ;;
  }
}

explore: employee_churn_model_eval {}
view: employee_churn_model_eval {
  derived_table: {
    sql: SELECT * FROM ml.EVALUATE(
          MODEL ${employee_churn_regression.SQL_TABLE_NAME},
          (SELECT * FROM ${input_data.SQL_TABLE_NAME} WHERE random >= 0.7));;
  }
  dimension: recall {
    type: number
    value_format_name:percent_2
    description: "True positives over all positives."
  }
  dimension: precision {
    type: number
    value_format_name:percent_2
    description: "True positives over true positives + false negatives."
  }


  dimension: accuracy {type: number value_format_name:percent_2}
  ### Accuracy of the model evaluations ###


  dimension: f1_score {type: number value_format_name:percent_3}
  dimension: log_loss {type: number}
  dimension: roc_auc {type: number}
}

explore: employee_churn_prediction {
  join: predicted_attrition_probs {
    sql:  LEFT JOIN UNNEST(employee_churn_prediction.predicted_attrition_probs) as predicted_attrition_probs ;;
    relationship: one_to_many
  }
  join: employee_features {
    relationship: one_to_one
    sql_on: ${employee_features.employee_number} = ${employee_churn_prediction.employee_number} ;;
  }
}
view: employee_churn_prediction {
  derived_table: {
    datagroup_trigger: hr_project_default_datagroup
    sql: SELECT * FROM ml.PREDICT(
          MODEL ${employee_churn_regression.SQL_TABLE_NAME},
          (SELECT * EXCEPT(attrition) FROM ${input_data.SQL_TABLE_NAME})) ;;
  }
  dimension: predicted_attrition {
    type: yesno
  }
  dimension: predicted_attrition_probs {
    type: number
    hidden: yes
  }
  dimension: employee_number {
    hidden: yes
  }
}

view: predicted_attrition_probs {
  view_label: "Employee Churn Prediction"
  dimension: id {
    primary_key: yes
    sql: CONCAT(CAST(${employee_churn_prediction.employee_number}),${label}) ;;
  }
  dimension: prob {
    type: number
  }
  measure: average_probability {
    type: average
    sql: ${prob} ;;
  }
  dimension: label {
    hidden: yes
    type: yesno
  }
}

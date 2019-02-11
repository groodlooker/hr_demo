view: bls_absences {
  sql_table_name: ferrovial.bls_absence ;;

  dimension: absence_rate_due_to_illness_or_injury {
    type: number
    sql: ${TABLE}.Absence_rate_due_to_Illness_or_Injury ;;
  }

  dimension: absence_rate_other {
    type: number
    sql: ${TABLE}.Absence_rate_other ;;
  }

  dimension: absence_rate_total {
    type: number
    sql: ${TABLE}.Absence_rate_Total ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: full_time_wage_and_salary_workers {
    type: number
    sql: ${TABLE}.Full_time_wage_and_salary_workers ;;
  }

  dimension: lost_worktime_rate_due_to_illness_or_injury {
    type: number
    sql: ${TABLE}.Lost_worktime_rate_due_to_Illness_or_Injury ;;
  }

  dimension: lost_worktime_rate_other {
    type: number
    sql: ${TABLE}.Lost_worktime_rate_other ;;
  }

  dimension: lost_worktime_rate_total {
    type: number
    sql: ${TABLE}.Lost_worktime_rate_total ;;
  }

  dimension: occupation {
    type: string
    primary_key: yes
    sql: ${TABLE}.OCCUPATION ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

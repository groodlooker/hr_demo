view: employee_features {
  sql_table_name: ferrovial.employee_features ;;

  dimension: age {
    type: number
    sql: ${TABLE}.Age ;;
  }

  dimension: attrition {
    type: yesno
    sql: ${TABLE}.Attrition ;;
  }

  dimension: business_travel {
    type: string
    sql: ${TABLE}.BusinessTravel ;;
  }

  dimension: daily_rate {
    type: number
    sql: ${TABLE}.DailyRate ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.Department ;;
  }

  dimension: distance_from_home {
    type: number
    sql: ${TABLE}.DistanceFromHome ;;
  }

  dimension: education {
    type: number
    sql: ${TABLE}.Education ;;
  }

  dimension: education_field {
    type: string
    sql: ${TABLE}.EducationField ;;
  }

  dimension: employee_count {
    type: number
    sql: ${TABLE}.EmployeeCount ;;
  }

  dimension: employee_number {
    type: number
    sql: ${TABLE}.EmployeeNumber ;;
  }

  dimension: environment_satisfaction {
    type: number
    sql: ${TABLE}.EnvironmentSatisfaction ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

  dimension: hourly_rate {
    type: number
    sql: ${TABLE}.HourlyRate ;;
  }

  dimension: job_involvement {
    type: number
    sql: ${TABLE}.JobInvolvement ;;
  }

  dimension: job_level {
    type: number
    sql: ${TABLE}.JobLevel ;;
  }

  dimension: job_role {
    type: string
    sql: ${TABLE}.JobRole ;;
  }

  dimension: job_satisfaction {
    type: number
    sql: ${TABLE}.JobSatisfaction ;;
  }

  dimension: marital_status {
    type: string
    sql: ${TABLE}.MaritalStatus ;;
  }

  dimension: monthly_income {
    type: number
    sql: ${TABLE}.MonthlyIncome ;;
  }

  dimension: monthly_rate {
    type: number
    sql: ${TABLE}.MonthlyRate ;;
  }

  dimension: num_companies_worked {
    type: number
    sql: ${TABLE}.NumCompaniesWorked ;;
  }

  dimension: over18 {
    type: yesno
    sql: ${TABLE}.Over18 ;;
  }

  dimension: over_time {
    type: yesno
    sql: ${TABLE}.OverTime ;;
  }

  dimension: percent_salary_hike {
    type: number
    sql: ${TABLE}.PercentSalaryHike ;;
  }

  dimension: performance_rating {
    type: number
    sql: ${TABLE}.PerformanceRating ;;
  }

  dimension: relationship_satisfaction {
    type: number
    sql: ${TABLE}.RelationshipSatisfaction ;;
  }

  dimension: standard_hours {
    type: number
    sql: ${TABLE}.StandardHours ;;
  }

  dimension: stock_option_level {
    type: number
    sql: ${TABLE}.StockOptionLevel ;;
  }

  dimension: total_working_years {
    type: number
    sql: ${TABLE}.TotalWorkingYears ;;
  }

  dimension: training_times_last_year {
    type: number
    sql: ${TABLE}.TrainingTimesLastYear ;;
  }

  dimension: work_life_balance {
    type: number
    sql: ${TABLE}.WorkLifeBalance ;;
  }

  dimension: years_at_company {
    type: number
    sql: ${TABLE}.YearsAtCompany ;;
  }

  dimension: years_in_current_role {
    type: number
    sql: ${TABLE}.YearsInCurrentRole ;;
  }

  dimension: years_since_last_promotion {
    type: number
    sql: ${TABLE}.YearsSinceLastPromotion ;;
  }

  dimension: years_with_curr_manager {
    type: number
    sql: ${TABLE}.YearsWithCurrManager ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

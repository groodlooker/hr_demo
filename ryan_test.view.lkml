explore: ryan_test {}
view: ryan_test {
  sql_table_name: ferrovial.ryan_test ;;

  dimension: age {
    type: number
    sql: ${TABLE}.Age ;;
  }

  dimension: annual_salary_ {
    type: number
    sql: ${TABLE}.Annual_Salary_ ;;
  }

  dimension: cost_center {
    type: number
    sql: ${TABLE}.Cost_Center ;;
  }

  dimension_group: date_of_birth {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date_of_Birth ;;
  }

  dimension: employee_group {
    type: string
    sql: ${TABLE}.Employee_Group ;;
  }

  dimension: employee_status {
    type: string
    sql: ${TABLE}.Employee_Status ;;
  }

  dimension: employee_subgroup_desc {
    type: string
    sql: ${TABLE}.Employee_subgroup_Desc ;;
  }

  dimension: ethnic_origin {
    type: string
    sql: ${TABLE}.Ethnic_origin ;;
  }

  dimension: ethnicity {
    type: string
    sql: ${TABLE}.Ethnicity ;;
  }

  dimension: ethnicity_racial_cat_1 {
    type: string
    sql: ${TABLE}.Ethnicity_Racial_Cat_1 ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.First_Name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

  dimension_group: hire {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Hire_Date ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.Last_Name ;;
  }

  dimension: manager_s_name {
    type: string
    sql: ${TABLE}.Manager_s_Name ;;
  }

  dimension: organizational_unit_desc {
    type: string
    sql: ${TABLE}.Organizational_unit_Desc ;;
  }

  dimension: pers_area_desc {
    type: string
    sql: ${TABLE}.Pers_Area_Desc ;;
  }

  dimension: pers_subarea_desc {
    type: string
    sql: ${TABLE}.Pers_Subarea_Desc ;;
  }

  dimension: personnel_number {
    type: number
    sql: ${TABLE}.Personnel_Number ;;
  }

  dimension: position___description {
    type: string
    sql: ${TABLE}.Position___Description ;;
  }

  dimension: termination_date {
    type: string
    sql: ${TABLE}.Termination_Date ;;
  }

  dimension: work_contract {
    type: string
    sql: ${TABLE}.Work_Contract ;;
  }

  measure: count {
    type: count
    drill_fields: [first_name, last_name, manager_s_name]
  }
}

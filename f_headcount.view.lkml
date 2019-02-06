view: f_headcount {
  sql_table_name: ferrovial.f_headcount ;;

  dimension: company_code {
    type: string
    sql: ${TABLE}.Company_Code ;;
  }

  dimension: cost_center_desc {
    type: string
    sql: ${TABLE}.Cost_center_Desc ;;
  }

  dimension: employee_group {
    type: string
    sql: ${TABLE}.Employee_Group ;;
  }

  dimension: employee_sub_group {
    type: string
    sql: ${TABLE}.Employee_Sub_Group ;;
  }

  dimension: employee_sub_group_description {
    type: string
    sql: ${TABLE}.Employee_Sub_Group_Description ;;
  }

  dimension: employment_status {
    type: string
    sql: ${TABLE}.Employment_Status ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.First_Name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.Last_Name ;;
  }

  dimension: organizational_unit_desc {
    type: string
    sql: ${TABLE}.Organizational_unit_Desc ;;
  }

  dimension: personnel_number {
    type: number
    sql: ${TABLE}.Personnel_Number ;;
  }

  dimension: personnel_subarea {
    type: string
    sql: ${TABLE}.Personnel_Subarea ;;
  }

  dimension: position___description {
    type: string
    sql: ${TABLE}.Position___Description ;;
  }

  dimension: work_contract {
    type: string
    sql: ${TABLE}.Work_Contract ;;
  }

  measure: count {
    type: count
    drill_fields: [first_name, last_name]
  }
}

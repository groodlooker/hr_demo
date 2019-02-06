view: f_compliance {
  sql_table_name: ferrovial.f_compliance ;;

  dimension: action_type {
    type: string
    sql: ${TABLE}.Action_Type ;;
  }

  dimension: age {
    type: string
    sql: ${TABLE}.Age ;;
  }

  dimension_group: begin_date__it0000_ {
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
    sql: ${TABLE}.Begin_Date__IT0000_ ;;
  }

  dimension: company_code {
    type: number
    sql: ${TABLE}.Company_Code ;;
  }

  dimension: date_of_birth {
    type: string
    sql: ${TABLE}.Date_of_Birth ;;
  }

  dimension: employee_group {
    type: string
    sql: ${TABLE}.Employee_Group ;;
  }

  dimension: employee_subgroup {
    type: string
    sql: ${TABLE}.Employee_Subgroup ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.First_Name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

  dimension: gender_19 {
    type: string
    sql: ${TABLE}.Gender_19 ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.Last_Name ;;
  }

  dimension: manager_name {
    type: string
    sql: ${TABLE}.Manager_Name ;;
  }

  dimension: organizational_unit {
    type: number
    sql: ${TABLE}.Organizational_Unit ;;
  }

  dimension: organizational_unit_desc {
    type: string
    sql: ${TABLE}.Organizational_unit_Desc ;;
  }

  dimension: pers_subarea_desc {
    type: string
    sql: ${TABLE}.Pers_Subarea_Desc ;;
  }

  dimension: personnel_number {
    type: number
    sql: ${TABLE}.Personnel_Number ;;
  }

  dimension: personnel_subarea {
    type: string
    sql: ${TABLE}.Personnel_Subarea ;;
  }

  dimension: position {
    type: number
    sql: ${TABLE}.Position ;;
  }

  dimension: position___description {
    type: string
    sql: ${TABLE}.Position___Description ;;
  }

  dimension: race {
    type: string
    sql: ${TABLE}.Race ;;
  }

  dimension: reason_for_action {
    type: string
    sql: ${TABLE}.Reason_for_Action ;;
  }

  dimension: vetran_status {
    type: string
    sql: ${TABLE}.Vetran_Status ;;
  }

  dimension: work_contract {
    type: string
    sql: ${TABLE}.Work_Contract ;;
  }

  measure: count {
    type: count
    drill_fields: [first_name, manager_name, last_name]
  }
}

view: us_diversity {
  sql_table_name: ferrovial.f_diversity_u ;;

  dimension: age {
    view_label: "Employee Details"
    type: number
    sql: ${TABLE}.Age ;;
  }

  dimension: age_group {
    type: tier
    view_label: "Employee Details"
    style: integer
    tiers: [18,25,35,45,55,65,75]
    sql: ${age} ;;
  }

  dimension: annual_salary {
    type: number
    view_label: "Employment Information"
    value_format_name: usd_0
    sql: ${TABLE}.Annual_Salary_ ;;
  }

  dimension: salary_difference {
    type: number
    sql: (${pay_by_position.average_salary} - ${annual_salary}) / NULLIF(${annual_salary}) ;;
  }

  measure: total_salary {
    type: sum
    view_label: "Employment Information"
    value_format_name: usd_0
    sql: ${annual_salary} ;;
  }

  dimension: salary_tiers {
    type: tier
    style: integer
    value_format_name: usd_0
    tiers: [25000,55000,85000,100000,165000,250000,325000]
    sql: ${annual_salary} ;;
  }

  measure: average_salary {
    type: average
    view_label: "Employment Information"
    value_format_name: usd_0
    sql: ${annual_salary} ;;
  }

  dimension: cost_center {
    type: number
    view_label: "Employment Information"
    sql: ${TABLE}.Cost_Center ;;
  }

  dimension_group: date_of_birth {
    type: time
    view_label: "Employee Details"
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

  dimension: generation {
    type: string
    view_label: "Employee Details"
    sql: CASE WHEN ${date_of_birth_year} <= 1945 AND ${date_of_birth_year} > 1924
            THEN "Silent Generation"
         WHEN ${date_of_birth_year} >= 1946 AND ${date_of_birth_year} < 1965
            THEN "Baby Boomer"
         WHEN ${date_of_birth_year} >= 1965 AND ${date_of_birth_year} < 1980
            THEN "Gen X"
         WHEN ${date_of_birth_year} >= 1980 AND ${date_of_birth_year} < 1997
            THEN "Millennial"
        ELSE "Gen Z" END
    ;;
  }

  dimension: employee_group {
    type: string
    drill_fields: [employee_sub_group]
    view_label: "Job Information"
    sql: ${TABLE}.Employee_Group ;;
  }

  dimension: employee_status {
    type: string
    view_label: "Employment Information"
    sql: ${TABLE}.Employee_Status ;;
  }

  dimension: employee_sub_group {
    type: string
    drill_fields: [person_area]
    view_label: "Job Information"
    sql: ${TABLE}.Employee_subgroup_Desc ;;
  }

  dimension: ethnic_origin {
    type: string
    view_label: "Employee Details"
    hidden: yes
    sql: ${TABLE}.Ethnic_origin ;;
  }

  dimension: ethnic_origin_group {
    type: string
    view_label: "Employee Details"
    sql: CASE WHEN ${ethnic_origin} IS NULL THEN "Not Stated" ELSE ${ethnic_origin} END ;;
    drill_fields: [generation,full_name,ethnicity_category]
  }

  dimension: ethnicity {
    type: string
    view_label: "Employee Details"
    sql: ${TABLE}.Ethnicity ;;
  }

  dimension: ethnicity_category {
    type: string
    view_label: "Employee Details"
    sql: ${TABLE}.Ethnicity_Racial_Cat_1 ;;
  }

  dimension: first_name {
    type: string
    view_label: "Employee Details"
    sql: ${TABLE}.First_Name ;;
  }

  dimension: gender {
    type: string
    view_label: "Employee Details"
    sql: ${TABLE}.Gender ;;
  }

  dimension_group: hire {
    type: time
    view_label: "Employment Information"
    timeframes: [
      raw,
      date,
      week,
      month_name,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Hire_Date ;;
  }

  dimension: tenure_months {
    type: number
    sql: DATE_DIFF(CURRENT_DATE(),${hire_raw},MONTH) ;;
  }

  measure: average_tenure {
    type: average
    drill_fields: [full_name,manager_name,manager_email,employee_status,position___description]
    value_format_name: decimal_0
    sql: ${tenure_months} ;;
  }

  dimension: last_name {
    view_label: "Employee Details"
    type: string
    sql: ${TABLE}.Last_Name ;;
  }

  dimension: full_name {
    type: string
    view_label: "Employee Details"
    sql: CONCAT(${first_name}, " ", ${last_name}) ;;
  }

  dimension: manager_name {
    type: string
    view_label: "Employment Information"
    sql: ${TABLE}.Manager_s_Name ;;
  }

  dimension: manager_email {
    type: string
    sql: LOWER(CONCAT(REPLACE(${manager_name}," ","."),"@ferrovial.com")) ;;
    action: {
      label: "Email {{ value }}"
      url: "https:mailto:"
      form_param: {
        name: "title"
        type: textarea
        label: "Body"
        required: yes
        default: "{% if us_diversity.full_name._in_query %}
        Hi {{ us_diversity.manager_name._value }} , do you have a few minutes this week to talk about {{ us_diversity.full_name._value }}?
        {% else %}
        Your message here...
        {% endif %}"
    }
  }
  }

  dimension: organizational_unit {
    type: string
    view_label: "Job Information"
    sql: ${TABLE}.Organizational_unit_Desc ;;
  }

  dimension: person_area {
    type: string
    drill_fields: [person_sub_area]
    view_label: "Job Information"
    sql: ${TABLE}.Pers_Area_Desc ;;
  }

  dimension: this_year {
    type: yesno
    hidden: yes
    sql: ${hire_year} = 2018 ;;
  }

  dimension: last_year {
    type: yesno
    hidden: yes
    sql: ${hire_year} = 2017 ;;
  }

  measure: 2018_count {
    type: count_distinct
    label: "Current Year Employee Count"
    view_label: "Employment Information"
    sql: ${personnel_number} ;;
    filters: {
      field: this_year
      value: "yes"
    }
  }

  measure: 2017_count {
    type: count_distinct
    label: "Previous Year Employee Count"
    view_label: "Employment Information"
    sql: ${personnel_number} ;;
    filters: {
      field: last_year
      value: "yes"
    }
  }

  measure: percent_change_hires {
    type: number
    view_label: "Employment Information"
    value_format_name: percent_0
    sql: (${2018_count} - ${2017_count}) / nullif(${2017_count},0) ;;
    html: {% if {{value}} > 0 %}
    <i class="fa fa-3x fa-arrow-circle-o-up" style="color:#4897CE;"></i><p>{{rendered_value}}</p>
    {% elsif {{value}} < 0 %}
    <i class="fa fa-3x fa-arrow-circle-o-down" style="color:#D6782C;"></i><p>{{rendered_value}}</p>
    {% else %}
    <i class="fa fa-3x fa-minus" style="color:lightgray;"></i><p>{{ f_diversity_u.2018_count._value }}</p>
    {% endif %}
    ;;
  }

  dimension: person_sub_area {
    type: string
    view_label: "Job Information"
    sql: ${TABLE}.Pers_Subarea_Desc ;;
  }

  dimension: location {
    type: string
    map_layer_name: us_states
    sql: SUBSTR(REPLACE(${person_sub_area},",",""),-2) ;;
  }

  dimension: personnel_number {
    type: number
    primary_key: yes
    view_label: "Employee Details"
    sql: ${TABLE}.Personnel_Number ;;
  }

  measure: total_employee_count {
    type: count_distinct
    view_label: "Employment Information"
    sql: ${personnel_number} ;;
  }

  dimension: position___description {
    type: string
    view_label: "Job Information"
    sql: ${TABLE}.Position___Description ;;
  }

  dimension: termination_date {
    type: string
    view_label: "Employment Information"
    sql: ${TABLE}.Termination_Date ;;
  }

  dimension: work_contract {
    type: string
    view_label: "Job Information"
    sql: ${TABLE}.Work_Contract ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [first_name, last_name]
  }
}

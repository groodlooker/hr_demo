view: new_titles {
  sql_table_name: ferrovial.new_titles ;;

  dimension: string_field_0 {
    type: string
    label: "Old Title"
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.string_field_0 ;;
  }

  dimension: string_field_1 {
    type: string
    label: "Job Title"
    sql: ${TABLE}.string_field_1 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

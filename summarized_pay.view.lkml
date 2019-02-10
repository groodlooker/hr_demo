view: pay_by_position {
  derived_table: {
    explore_source: us_diversity {
      column: position___description {}
      column: location {}
      column: average_salary {}
      column: average_tenure {}
      column: total_employee_count {}
    }
  }
  dimension: position___description {
    hidden: yes
    label: "Job Information Position Description"
  }
  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${position___description},${location}) ;;
  }
  dimension: location {
    hidden: yes
  }
  dimension: average_salary {
    label: "Average Salary by Position & Location"
    value_format: "$#,##0"
    type: number
  }
  dimension: average_tenure {
    value_format: "#,##0"
    label: "Average Tenure by Position & Location"
    type: number
  }
  dimension: total_employee_count {
    label: "Employment Information Total Employee Count"
    type: number
    hidden: yes
  }
}

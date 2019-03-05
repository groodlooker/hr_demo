connection: "lookerdata"

# include all the views
include: "*.view"

datagroup: hr_project_default_datagroup {
  sql_trigger: SELECT MAX(Hire_Date) FROM ferrovial.f_diversity_u;;
  max_cache_age: "1 hour"
}

persist_with: hr_project_default_datagroup

# explore: f_compliance {}
#
# explore: f_diversity_c {}

explore: us_diversity {
  join: pay_by_position {
    sql_on: ${us_diversity.position___description} = ${pay_by_position.position___description}
    and ${us_diversity.location} = ${pay_by_position.location};;
    type: left_outer
    relationship: many_to_one
  }
}


explore: bls_absences {
  always_filter: {
    filters: {
      field: occupation
      value: "Construction"
    }
    filters: {
      field: us_diversity.personnel_number
      value: "10014909"
    }
  }
  join: us_diversity {
    fields: [us_diversity.absence_rate_employee,us_diversity.days_absent,us_diversity.personnel_number]
    sql_on: 1 = 1 ;;
    type: inner
    relationship: one_to_many
  }
}
#
# explore: f_headcount {}

# explore: f_diversity_comb {}

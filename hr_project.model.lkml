connection: "lookerdata"

# include all the views
include: "*.view"

datagroup: hr_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: hr_project_default_datagroup

explore: f_compliance {}

explore: f_diversity_c {}

explore: us_diversity {}

explore: f_headcount {}

# explore: f_diversity_comb {}

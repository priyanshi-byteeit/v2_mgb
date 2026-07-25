connection: "mgb_motors"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: v2_mgb_motors_dashboard_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: v2_mgb_motors_dashboard_default_datagroup

explore: demo_fact_service_revenue {}

explore: demo_fact_parts_sales {}

explore: demo_fact_vehicle_sales {}

explore: demo_dim_date {}

explore: demo_dim_business {}

explore: demo_dim_part_category {}

explore: demo_dim_vehicle_type {}

explore: demo_dim_branch {}

explore: demo_unified_revenue {}

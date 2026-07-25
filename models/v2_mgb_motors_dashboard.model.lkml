connection: "mgb_motors"

include: "/views/*.view"
include: "/models/*.dashboard.lookml"

# ==========================================================
# CONSOLIDATED explore -- powers the main "all 3 businesses" dashboard
# ==========================================================
explore: demo_unified_revenue {
  label: "Consolidated Revenue - All Businesses"

  join: demo_dim_business {
    type: left_outer
    sql_on: ${demo_unified_revenue.business_id} = ${demo_dim_business.business_id} ;;
    relationship: many_to_one
  }

  join: demo_dim_branch {
    type: left_outer
    sql_on: ${demo_unified_revenue.branch} = ${demo_dim_branch.branch_name}
      and ${demo_unified_revenue.business_id} = ${demo_dim_branch.business_id} ;;
    relationship: many_to_one
  }

  join: demo_dim_date {
    type: left_outer
    sql_on: ${demo_unified_revenue.date_raw} = ${demo_dim_date.date_raw} ;;
    relationship: many_to_one
  }

  join: demo_dim_vehicle_type {
    type: left_outer
    sql_on: ${demo_unified_revenue.vehicle_type_id} = ${demo_dim_vehicle_type.vehicle_type_id} ;;
    relationship: many_to_one
  }

  join: demo_dim_part_category {
    type: left_outer
    sql_on: ${demo_unified_revenue.part_category_id} = ${demo_dim_part_category.part_category_id} ;;
    relationship: many_to_one
  }
}

# ==========================================================
# Vehicle Sales explore -- powers the vehicle-type / two-wheeler filter
# ==========================================================
explore: demo_fact_vehicle_sales {
  label: "Vehicle Sales - JCB / Tata / Eicher"

  join: demo_dim_business {
    type: left_outer
    sql_on: ${demo_fact_vehicle_sales.business_id} = ${demo_dim_business.business_id} ;;
    relationship: many_to_one
  }

  join: demo_dim_vehicle_type {
    type: left_outer
    sql_on: ${demo_fact_vehicle_sales.vehicle_type_id} = ${demo_dim_vehicle_type.vehicle_type_id} ;;
    relationship: many_to_one
  }

  join: demo_dim_branch {
    type: left_outer
    sql_on: ${demo_fact_vehicle_sales.branch} = ${demo_dim_branch.branch_name}
      and ${demo_fact_vehicle_sales.business_id} = ${demo_dim_branch.business_id} ;;
    relationship: many_to_one
  }

  join: demo_dim_date {
    type: left_outer
    sql_on: date(${demo_fact_vehicle_sales.invoice_raw}) = date(${demo_dim_date.date_raw}) ;;
    relationship: many_to_one
  }
}

# ==========================================================
# Parts Sales explore -- powers the parts-category filter
# ==========================================================
explore: demo_fact_parts_sales {
  label: "Parts Sales - JCB / Tata / Eicher"

  join: demo_dim_business {
    type: left_outer
    sql_on: ${demo_fact_parts_sales.business_id} = ${demo_dim_business.business_id} ;;
    relationship: many_to_one
  }

  join: demo_dim_part_category {
    type: left_outer
    sql_on: ${demo_fact_parts_sales.part_category_id} = ${demo_dim_part_category.part_category_id} ;;
    relationship: many_to_one
  }

  join: demo_dim_branch {
    type: left_outer
    sql_on: ${demo_fact_parts_sales.branch} = ${demo_dim_branch.branch_name}
      and ${demo_fact_parts_sales.business_id} = ${demo_dim_branch.business_id} ;;
    relationship: many_to_one
  }

  join: demo_dim_date {
    type: left_outer
    sql_on: date(${demo_fact_parts_sales.invoice_raw}) = date(${demo_dim_date.date_raw}) ;;
    relationship: many_to_one
  }
}

# ==========================================================
# Service Revenue explore
# ==========================================================
explore: demo_fact_service_revenue {
  label: "Service Revenue - JCB / Tata / Eicher"

  join: demo_dim_business {
    type: left_outer
    sql_on: ${demo_fact_service_revenue.business_id} = ${demo_dim_business.business_id} ;;
    relationship: many_to_one
  }

  join: demo_dim_vehicle_type {
    type: left_outer
    sql_on: ${demo_fact_service_revenue.vehicle_type_id} = ${demo_dim_vehicle_type.vehicle_type_id} ;;
    relationship: many_to_one
  }

  join: demo_dim_branch {
    type: left_outer
    sql_on: ${demo_fact_service_revenue.branch} = ${demo_dim_branch.branch_name}
      and ${demo_fact_service_revenue.business_id} = ${demo_dim_branch.business_id} ;;
    relationship: many_to_one
  }

  join: demo_dim_date {
    type: left_outer
    sql_on: date(${demo_fact_service_revenue.doc_raw}) = date(${demo_dim_date.date_raw}) ;;
    relationship: many_to_one
  }
}

view: demo_dim_vehicle_type {
  sql_table_name: `MGB_motors.demo_dim_vehicle_type` ;;

  dimension: business_id {
    type: number
    sql: ${TABLE}.business_id ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: vehicle_type_id {
    type: number
    sql: ${TABLE}.vehicle_type_id ;;
  }
  dimension: vehicle_type_name {
    type: string
    sql: ${TABLE}.vehicle_type_name ;;
  }
  measure: count {
    type: count
    drill_fields: [vehicle_type_name]
  }
}

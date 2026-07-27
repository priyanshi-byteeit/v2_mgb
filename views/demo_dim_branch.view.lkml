view: demo_dim_branch {
  sql_table_name: `MGB_motors.demo_dim_branch` ;;

  dimension: branch_id {
    type: number
    sql: ${TABLE}.branch_id ;;
  }
  dimension: branch_name {
    type: string
    sql: ${TABLE}.branch_name ;;
  }
  dimension: business_id {
    type: number
    sql: ${TABLE}.business_id ;;
  }
  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
    hidden: yes
  }
  measure: count {
    type: count
    drill_fields: [branch_name]
  }
}

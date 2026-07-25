view: demo_dim_part_category {
  sql_table_name: `MGB_motors.demo_dim_part_category` ;;

  dimension: category_name {
    type: string
    sql: ${TABLE}.category_name ;;
  }
  dimension: part_category_id {
    type: number
    sql: ${TABLE}.part_category_id ;;
  }
  measure: count {
    type: count
    drill_fields: [category_name]
  }
}

view: demo_unified_revenue {
  sql_table_name: `MGB_motors.demo_unified_revenue` ;;

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }
  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
  }
  dimension: business_id {
    type: number
    sql: ${TABLE}.business_id ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: revenue_id {
    type: number
    sql: ${TABLE}.revenue_id ;;
  }
  dimension: revenue_stream {
    type: string
    sql: ${TABLE}.revenue_stream ;;
  }
  dimension: vehicle_type_id {
    type: number
    sql: ${TABLE}.vehicle_type_id ;;
  }

  dimension: part_category_id {
    type: number
    sql: ${TABLE}.part_category_id ;;
  }
  measure: count {
    type: count
  }
  measure: total_revenue {
    type: sum
    sql: ${amount} ;;
    value_format: "\"₹\"#,##0"
  }
  measure: transaction_count {
    type: count
  }
}

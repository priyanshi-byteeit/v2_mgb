view: demo_fact_parts_sales {
  sql_table_name: `MGB_motors.demo_fact_parts_sales` ;;

  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
  }
  dimension: business_id {
    type: number
    sql: ${TABLE}.business_id ;;
  }
  dimension: customer {
    type: string
    sql: ${TABLE}.customer ;;
  }
  dimension: discount_amt {
    type: number
    sql: ${TABLE}.discount_amt ;;
  }
  dimension_group: invoice {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.invoice_date ;;
  }
  dimension: invoice_no {
    type: number
    sql: ${TABLE}.invoice_no ;;
  }
  dimension: invoice_total {
    type: number
    sql: ${TABLE}.invoice_total ;;
  }
  dimension: invoice_type {
    type: string
    sql: ${TABLE}.invoice_type ;;
  }
  dimension: mrp_amount {
    type: number
    sql: ${TABLE}.mrp_amount ;;
  }
  dimension: part_category_id {
    type: number
    sql: ${TABLE}.part_category_id ;;
  }
  dimension: part_name {
    type: string
    sql: ${TABLE}.part_name ;;
  }
  dimension: return_total {
    type: number
    sql: ${TABLE}.return_total ;;
  }
  dimension: revenue_stream {
    type: string
    sql: ${TABLE}.revenue_stream ;;
  }
  dimension: sales_employee {
    type: string
    sql: ${TABLE}.sales_employee ;;
  }
  dimension: sp_amount {
    type: number
    sql: ${TABLE}.sp_amount ;;
  }
  dimension: tax_amt {
    type: number
    sql: ${TABLE}.tax_amt ;;
  }
  measure: count {
    type: count
    drill_fields: [part_name]
  }
}

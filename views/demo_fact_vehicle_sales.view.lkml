view: demo_fact_vehicle_sales {
  sql_table_name: `MGB_motors.demo_fact_vehicle_sales` ;;

  dimension: basic_price {
    type: number
    sql: ${TABLE}.basic_price ;;
  }
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
  dimension: financier {
    type: string
    sql: ${TABLE}.financier ;;
  }
  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
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
  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }
  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }
  dimension: revenue_stream {
    type: string
    sql: ${TABLE}.revenue_stream ;;
  }
  dimension: sales_employee {
    type: string
    sql: ${TABLE}.sales_employee ;;
  }
  dimension: tax_amt {
    type: number
    sql: ${TABLE}.tax_amt ;;
  }
  dimension: vehicle_type_id {
    type: number
    sql: ${TABLE}.vehicle_type_id ;;
  }
  measure: count {
    type: count
  }
}

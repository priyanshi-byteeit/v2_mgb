view: demo_dim_date {
  sql_table_name: `MGB_motors.demo_dim_date` ;;

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: day_of_week {
    type: string
    sql: ${TABLE}.day_of_week ;;
  }
  dimension: is_weekend {
    type: yesno
    sql: ${TABLE}.is_weekend ;;
  }
  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }
  dimension: month_name {
    type: string
    sql: ${TABLE}.month_name ;;
  }
  dimension: quarter {
    type: number
    sql: ${TABLE}.quarter ;;
  }
  dimension: week_of_year {
    type: number
    sql: ${TABLE}.week_of_year ;;
  }
  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  measure: count {
    type: count
    drill_fields: [month_name]
  }
}

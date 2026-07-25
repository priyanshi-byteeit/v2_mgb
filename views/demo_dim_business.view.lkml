view: demo_dim_business {
  sql_table_name: `MGB_motors.demo_dim_business` ;;

  dimension: business_id {
    type: number
    sql: ${TABLE}.business_id ;;
  }
  dimension: business_name {
    type: string
    sql: ${TABLE}.business_name ;;
  }
  dimension: mgb_partner_since {
    type: number
    sql: ${TABLE}.mgb_partner_since ;;
  }
  dimension: segment {
    type: string
    sql: ${TABLE}.segment ;;
  }
  measure: count {
    type: count
    drill_fields: [business_name]
  }
}

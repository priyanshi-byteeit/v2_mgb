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
  dimension: business_badge {
    type: string
    sql: ${business_name} ;;
    html:
    {% if value == 'JCB India' %}
      <div style="background:#1A1A1A; color:#F5A900; padding:16px 24px; border-radius:8px; font-size:24px; font-weight:bold; text-align:center; border:3px solid #F5A900; font-family:'Google Sans', Roboto, Arial, sans-serif;">🚧 {{ value }}</div>
    {% elsif value == 'Eicher' %}
      <div style="background:linear-gradient(90deg,#E31E24,#1A1A1A); color:#FFFFFF; padding:16px 24px; border-radius:8px; font-size:24px; font-weight:bold; text-align:center; border:3px solid #FFB800; font-family:'Google Sans', Roboto, Arial, sans-serif;">🚛 {{ value }}</div>
    {% elsif value == 'Tata Motors' %}
      <div style="background:linear-gradient(90deg,#0033A0,#1A1A1A); color:#FFFFFF; padding:16px 24px; border-radius:8px; font-size:24px; font-weight:bold; text-align:center; border:3px solid #F7941D; font-family:'Google Sans', Roboto, Arial, sans-serif;">🚗 {{ value }}</div>
    {% else %}
      <div style="background:#EDEDED; color:#333333; padding:16px 24px; border-radius:8px; font-size:18px; text-align:center;">Select a business above</div>
    {% endif %}
  ;;
  }
  measure: count {
    type: count
    drill_fields: [business_name]
  }
}

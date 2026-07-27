- dashboard: tata_dashboard
  title: "Tata Motors - Business Dashboard"
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100
  filters_bar_collapsed: true
  description: "Deep-dive dashboard for Tata Motors — Commercial Vehicles, Passenger Vehicles, Parts, and Service."

  filters:
  - name: date_filter
    title: Date
    type: field_filter
    default_value: 90 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: popover
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    field: demo_dim_date.date_date

  - name: branch_filter
    title: Branch
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    field: demo_dim_branch.branch_name

  - name: vehicle_type_filter
    title: "Vehicle Type"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    field: demo_dim_vehicle_type.vehicle_type_name

  - name: part_category_filter
    title: "Part Category"
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    field: demo_dim_part_category.category_name

  elements:

  # ================= TITLE BANNER =================
  - title: ""
    name: tata_title_banner
    type: text
    body_text: "<div style=\"background:linear-gradient(90deg, #0033A0 0%, #1A1A1A 100%); padding:10px 14px; text-align:center; display:flex; align-items:center; justify-content:center; height:100%; box-sizing:border-box;\"><span style=\"color:#FFFFFF; font-size:24px; font-weight:bold; letter-spacing:1px;\">TATA MOTORS</span><span style=\"color:#DCE4F2; font-size:14px;\"> &nbsp;|&nbsp; Trucks &middot; Buses &middot; Pickups &middot; Passenger Cars &middot; SUVs &middot; Parts &middot; Service</span></div>"
    row: 0
    col: 0
    width: 24
    height: 2

  # ================= KPI ROW =================
  - title: "Total Tata Revenue"
    name: kpi_total_revenue
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: single_value
    fields: [demo_unified_revenue.total_revenue]
    custom_color_enabled: true
    custom_color: "#0033A0"
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_dim_date.date_date
      branch_filter: demo_dim_branch.branch_name
    row: 2
    col: 0
    width: 8
    height: 2

  - title: "Vehicle Sales Revenue"
    name: kpi_vehicle_revenue
    model: v2_mgb_motors_dashboard
    explore: demo_fact_vehicle_sales
    type: single_value
    fields: [demo_fact_vehicle_sales.total_invoice_amount]
    custom_color_enabled: true
    custom_color: "#0057B8"
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
      vehicle_type_filter: demo_dim_vehicle_type.vehicle_type_name
    row: 2
    col: 8
    width: 5
    height: 2

  - title: "Parts Sales Revenue"
    name: kpi_parts_revenue
    model: v2_mgb_motors_dashboard
    explore: demo_fact_parts_sales
    type: single_value
    fields: [demo_fact_parts_sales.total_sales_amount]
    custom_color_enabled: true
    custom_color: "#4A4A4A"
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_parts_sales.invoice_date
      branch_filter: demo_fact_parts_sales.branch
      part_category_filter: demo_dim_part_category.category_name
    row: 2
    col: 13
    width: 5
    height: 2

  - title: "Service Revenue"
    name: kpi_service_revenue
    model: v2_mgb_motors_dashboard
    explore: demo_fact_service_revenue
    type: single_value
    fields: [demo_fact_service_revenue.total_sale_amount]
    custom_color_enabled: true
    custom_color: "#F7941D"
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 2
    col: 18
    width: 6
    height: 2

  # ================= COMBINED WEEKLY TREND =================
  - title: "Weekly Revenue by Stream"
    name: weekly_trend
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_column
    fields: [demo_dim_date.date_week, demo_unified_revenue.revenue_stream, demo_unified_revenue.total_revenue]
    pivots: [demo_unified_revenue.revenue_stream]
    stacking: normal
    series_colors:
      "Vehicle Sales": "#0033A0"
      "Parts Sales (Dealer/Counter)": "#1A1A1A"
      "Service Revenue": "#F7941D"
    show_value_labels: false
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_dim_date.date_date
      branch_filter: demo_dim_branch.branch_name
    row: 4
    col: 0
    width: 24
    height: 5

  # ================= WOW: SEGMENT SPOTLIGHT =================
  - title: ""
    name: segment_spotlight_banner
    type: text
    body_text: "<div style=\"background-color:#F7941D; padding:8px 14px; display:flex; align-items:center; height:100%; box-sizing:border-box; font-family:'Google Sans', Roboto, Arial, sans-serif;\"><span style=\"color:#1A1A1A; font-size:17px; font-weight:bold;\">🚚 COMMERCIAL FLEET vs. PASSENGER VEHICLES — SEGMENT SPOTLIGHT</span><span style=\"color:#1A1A1A; font-size:13px;\"> &nbsp;— the only MGB business selling a ₹42L truck and a ₹7L hatchback under one roof</span></div>"
    row: 9
    col: 0
    width: 24
    height: 2

  - title: "Commercial Fleet Revenue"
    name: kpi_commercial_revenue
    model: v2_mgb_motors_dashboard
    explore: demo_fact_vehicle_sales
    type: single_value
    fields: [demo_fact_vehicle_sales.total_invoice_amount]
    custom_color_enabled: true
    custom_color: "#0033A0"
    filters:
      demo_dim_business.business_name: "Tata Motors"
      demo_dim_vehicle_type.category: "-Passenger Vehicle"
    listen:
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
    row: 11
    col: 0
    width: 6
    height: 2

  - title: "Commercial Fleet Units Sold"
    name: kpi_commercial_units
    model: v2_mgb_motors_dashboard
    explore: demo_fact_vehicle_sales
    type: single_value
    fields: [demo_fact_vehicle_sales.total_quantity_sold]
    custom_color_enabled: true
    custom_color: "#1A1A1A"
    filters:
      demo_dim_business.business_name: "Tata Motors"
      demo_dim_vehicle_type.category: "-Passenger Vehicle"
    listen:
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
    row: 11
    col: 6
    width: 6
    height: 2

  - title: "Passenger Vehicle Revenue"
    name: kpi_passenger_revenue
    model: v2_mgb_motors_dashboard
    explore: demo_fact_vehicle_sales
    type: single_value
    fields: [demo_fact_vehicle_sales.total_invoice_amount]
    custom_color_enabled: true
    custom_color: "#0057B8"
    filters:
      demo_dim_business.business_name: "Tata Motors"
      demo_dim_vehicle_type.category: "Passenger Vehicle"
    listen:
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
    row: 11
    col: 12
    width: 6
    height: 2

  - title: "Passenger Vehicle Units Sold"
    name: kpi_passenger_units
    model: v2_mgb_motors_dashboard
    explore: demo_fact_vehicle_sales
    type: single_value
    fields: [demo_fact_vehicle_sales.total_quantity_sold]
    custom_color_enabled: true
    custom_color: "#F7941D"
    filters:
      demo_dim_business.business_name: "Tata Motors"
      demo_dim_vehicle_type.category: "Passenger Vehicle"
    listen:
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
    row: 11
    col: 18
    width: 6
    height: 2

  - title: "Model Performance: Volume vs. Price (colored by segment)"
    name: segment_scatter
    model: v2_mgb_motors_dashboard
    explore: demo_fact_vehicle_sales
    type: looker_scatter
    fields: [demo_fact_vehicle_sales.model, demo_fact_vehicle_sales.total_quantity_sold, demo_fact_vehicle_sales.average_price_per_machine]
    pivots: [demo_dim_vehicle_type.category]
    series_colors:
      "Passenger Vehicle": "#F7941D"
      "Commercial Vehicle - LCV": "#0033A0"
      "Commercial Vehicle - HCV": "#1A1A1A"
      "Bus": "#4A4A4A"
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
    row: 13
    col: 0
    width: 16
    height: 6

  - title: "Top-Selling Passenger Models"
    name: top_passenger_models
    model: v2_mgb_motors_dashboard
    explore: demo_fact_vehicle_sales
    type: looker_bar
    fields: [demo_fact_vehicle_sales.model, demo_fact_vehicle_sales.total_invoice_amount]
    sorts: [demo_fact_vehicle_sales.total_invoice_amount desc]
    limit: 6
    colors: ["#F7941D", "#0033A0", "#1A1A1A", "#0057B8", "#8C8C8C", "#4A4A4A"]
    show_value_labels: true
    filters:
      demo_dim_business.business_name: "Tata Motors"
      demo_dim_vehicle_type.category: "Passenger Vehicle"
    listen:
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
    row: 13
    col: 16
    width: 8
    height: 6

  # ================= VEHICLE SALES BANNER =================
  - title: ""
    name: vehicle_sales_banner
    type: text
    body_text: "<div style=\"background-color:#0033A0; padding:8px 14px; display:flex; align-items:center; height:100%; box-sizing:border-box; font-family:'Google Sans', Roboto, Arial, sans-serif;\"><span style=\"color:#FFFFFF; font-size:16px; font-weight:bold;\">VEHICLE SALES</span></div>"
    row: 19
    col: 0
    width: 24
    height: 2

  - title: "Revenue by Branch"
    name: vehicle_revenue_by_branch
    model: v2_mgb_motors_dashboard
    explore: demo_fact_vehicle_sales
    type: looker_column
    fields: [demo_fact_vehicle_sales.branch, demo_fact_vehicle_sales.total_invoice_amount]
    sorts: [demo_fact_vehicle_sales.total_invoice_amount desc]
    limit: 12
    colors: ["#0033A0"]
    show_value_labels: true
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
      vehicle_type_filter: demo_dim_vehicle_type.vehicle_type_name
    row: 21
    col: 0
    width: 8
    height: 5

  - title: "Revenue Mix by Vehicle Type"
    name: vehicle_mix_type
    model: v2_mgb_motors_dashboard
    explore: demo_fact_vehicle_sales
    type: looker_pie
    fields: [demo_dim_vehicle_type.vehicle_type_name, demo_fact_vehicle_sales.total_invoice_amount]
    value_labels: legend
    label_type: labPer
    donut: true
    colors: ["#0033A0", "#F7941D", "#1A1A1A", "#0057B8", "#4A4A4A", "#8C8C8C"]
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
    row: 21
    col: 8
    width: 8
    height: 5

  - title: "Revenue Mix by Industry"
    name: vehicle_mix_industry
    model: v2_mgb_motors_dashboard
    explore: demo_fact_vehicle_sales
    type: looker_pie
    fields: [demo_fact_vehicle_sales.industry, demo_fact_vehicle_sales.total_invoice_amount]
    value_labels: legend
    label_type: labPer
    donut: true
    colors: ["#0033A0", "#F7941D", "#1A1A1A", "#0057B8", "#4A4A4A", "#8C8C8C", "#C9C9C9"]
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
      vehicle_type_filter: demo_dim_vehicle_type.vehicle_type_name
    row: 21
    col: 16
    width: 8
    height: 5

  - title: "Revenue Mix by Financier"
    name: vehicle_mix_financier
    model: v2_mgb_motors_dashboard
    explore: demo_fact_vehicle_sales
    type: looker_pie
    fields: [demo_fact_vehicle_sales.financier, demo_fact_vehicle_sales.total_invoice_amount]
    value_labels: legend
    label_type: labPer
    donut: true
    colors: ["#1A1A1A", "#0033A0", "#F7941D", "#0057B8", "#8C8C8C", "#4A4A4A"]
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
      vehicle_type_filter: demo_dim_vehicle_type.vehicle_type_name
    row: 26
    col: 0
    width: 8
    height: 5

  - title: "Sales Employee Performance"
    name: vehicle_sales_employee_table
    model: v2_mgb_motors_dashboard
    explore: demo_fact_vehicle_sales
    type: looker_grid
    fields: [demo_fact_vehicle_sales.sales_employee, demo_fact_vehicle_sales.count, demo_fact_vehicle_sales.total_invoice_amount]
    sorts: [demo_fact_vehicle_sales.total_invoice_amount desc]
    limit: 10
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
      vehicle_type_filter: demo_dim_vehicle_type.vehicle_type_name
    row: 26
    col: 8
    width: 16
    height: 5

  # ================= PARTS SALES BANNER =================
  - title: ""
    name: parts_sales_banner
    type: text
    body_text: "<div style=\"background-color:#1A1A1A; padding:8px 14px; display:flex; align-items:center; height:100%; box-sizing:border-box; font-family:'Google Sans', Roboto, Arial, sans-serif;\"><span style=\"color:#0057B8; font-size:16px; font-weight:bold;\">PARTS SALES</span></div>"
    row: 31
    col: 0
    width: 24
    height: 2

  - title: "Revenue by Branch"
    name: parts_revenue_by_branch
    model: v2_mgb_motors_dashboard
    explore: demo_fact_parts_sales
    type: looker_column
    fields: [demo_fact_parts_sales.branch, demo_fact_parts_sales.total_sales_amount]
    sorts: [demo_fact_parts_sales.total_sales_amount desc]
    limit: 12
    colors: ["#4A4A4A"]
    show_value_labels: true
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_parts_sales.invoice_date
      branch_filter: demo_fact_parts_sales.branch
      part_category_filter: demo_dim_part_category.category_name
    row: 33
    col: 0
    width: 8
    height: 5

  - title: "Revenue Mix by Part Category"
    name: parts_mix_category
    model: v2_mgb_motors_dashboard
    explore: demo_fact_parts_sales
    type: looker_pie
    fields: [demo_dim_part_category.category_name, demo_fact_parts_sales.total_sales_amount]
    value_labels: legend
    label_type: labPer
    donut: true
    colors: ["#0033A0", "#F7941D", "#1A1A1A", "#0057B8", "#4A4A4A", "#8C8C8C", "#C9C9C9", "#003D7C", "#FFA94D", "#5C5C5C"]
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_parts_sales.invoice_date
      branch_filter: demo_fact_parts_sales.branch
    row: 33
    col: 8
    width: 8
    height: 5

  - title: "Sales Mix by Invoice Type"
    name: parts_mix_invoice_type
    model: v2_mgb_motors_dashboard
    explore: demo_fact_parts_sales
    type: looker_pie
    fields: [demo_fact_parts_sales.invoice_type, demo_fact_parts_sales.total_sales_amount]
    value_labels: legend
    label_type: labPer
    donut: true
    colors: ["#0033A0", "#F7941D"]
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_parts_sales.invoice_date
      branch_filter: demo_fact_parts_sales.branch
      part_category_filter: demo_dim_part_category.category_name
    row: 33
    col: 16
    width: 8
    height: 5

  - title: "Top Parts by Revenue"
    name: top_parts_table
    model: v2_mgb_motors_dashboard
    explore: demo_fact_parts_sales
    type: looker_grid
    fields: [demo_fact_parts_sales.part_name, demo_dim_part_category.category_name, demo_fact_parts_sales.count, demo_fact_parts_sales.total_sales_amount]
    sorts: [demo_fact_parts_sales.total_sales_amount desc]
    limit: 15
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_parts_sales.invoice_date
      branch_filter: demo_fact_parts_sales.branch
      part_category_filter: demo_dim_part_category.category_name
    row: 38
    col: 0
    width: 12
    height: 6

  - title: "Top Sales Employees"
    name: top_parts_employees
    model: v2_mgb_motors_dashboard
    explore: demo_fact_parts_sales
    type: looker_grid
    fields: [demo_fact_parts_sales.sales_employee, demo_fact_parts_sales.count, demo_fact_parts_sales.total_sales_amount, demo_fact_parts_sales.total_discount_amount]
    sorts: [demo_fact_parts_sales.total_sales_amount desc]
    limit: 15
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_parts_sales.invoice_date
      branch_filter: demo_fact_parts_sales.branch
      part_category_filter: demo_dim_part_category.category_name
    row: 38
    col: 12
    width: 12
    height: 6

  # ================= SERVICE REVENUE BANNER =================
  - title: ""
    name: service_revenue_banner
    type: text
    body_text: "<div style=\"background-color:#4A4A4A; padding:8px 14px; display:flex; align-items:center; height:100%; box-sizing:border-box; font-family:'Google Sans', Roboto, Arial, sans-serif;\"><span style=\"color:#FFFFFF; font-size:16px; font-weight:bold;\">SERVICE REVENUE</span></div>"
    row: 44
    col: 0
    width: 24
    height: 2

  - title: "Revenue by Branch"
    name: service_revenue_by_branch
    model: v2_mgb_motors_dashboard
    explore: demo_fact_service_revenue
    type: looker_column
    fields: [demo_fact_service_revenue.branch, demo_fact_service_revenue.total_sale_amount]
    sorts: [demo_fact_service_revenue.total_sale_amount desc]
    limit: 12
    colors: ["#F7941D"]
    show_value_labels: true
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 46
    col: 0
    width: 8
    height: 5

  - title: "Calls by Type"
    name: calls_by_type
    model: v2_mgb_motors_dashboard
    explore: demo_fact_service_revenue
    type: looker_bar
    fields: [demo_fact_service_revenue.call_type, demo_fact_service_revenue.total_service_calls]
    sorts: [demo_fact_service_revenue.total_service_calls desc]
    limit: 10
    colors: ["#0033A0"]
    show_value_labels: true
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 46
    col: 8
    width: 8
    height: 5

  - title: "Revenue Mix by Service Type"
    name: service_mix_type
    model: v2_mgb_motors_dashboard
    explore: demo_fact_service_revenue
    type: looker_pie
    fields: [demo_fact_service_revenue.service_type, demo_fact_service_revenue.total_sale_amount]
    value_labels: legend
    label_type: labPer
    donut: true
    colors: ["#1A1A1A", "#0033A0"]
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 46
    col: 16
    width: 8
    height: 5

  - title: "Revenue by Item Group"
    name: revenue_by_item_group
    model: v2_mgb_motors_dashboard
    explore: demo_fact_service_revenue
    type: looker_bar
    fields: [demo_fact_service_revenue.item_group, demo_fact_service_revenue.total_sale_amount]
    sorts: [demo_fact_service_revenue.total_sale_amount desc]
    limit: 8
    colors: ["#4A4A4A"]
    show_value_labels: true
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 51
    col: 0
    width: 8
    height: 5

  - title: "Revenue by Sub Type"
    name: revenue_by_sub_type
    model: v2_mgb_motors_dashboard
    explore: demo_fact_service_revenue
    type: looker_bar
    fields: [demo_fact_service_revenue.sub_type, demo_fact_service_revenue.total_sale_amount]
    sorts: [demo_fact_service_revenue.total_sale_amount desc]
    limit: 8
    colors: ["#F7941D"]
    show_value_labels: true
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 51
    col: 8
    width: 8
    height: 5

  - title: "Top Engineers by Revenue"
    name: top_engineers
    model: v2_mgb_motors_dashboard
    explore: demo_fact_service_revenue
    type: looker_grid
    fields: [demo_fact_service_revenue.engineer, demo_fact_service_revenue.total_service_calls, demo_fact_service_revenue.total_sale_amount]
    sorts: [demo_fact_service_revenue.total_sale_amount desc]
    limit: 8
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 51
    col: 16
    width: 8
    height: 5

  # ================= BRANCH OVERVIEW =================
  - title: ""
    name: branch_overview_banner
    type: text
    body_text: "<div style=\"background-color:#1A1A1A; padding:8px 14px; display:flex; align-items:center; height:100%; box-sizing:border-box; font-family:'Google Sans', Roboto, Arial, sans-serif;\"><span style=\"color:#0057B8; font-size:16px; font-weight:bold;\">BRANCH OVERVIEW</span></div>"
    row: 56
    col: 0
    width: 24
    height: 2

  - title: "Revenue by Branch Location"
    name: tata_branch_map
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_map
    fields: [demo_dim_branch.branch_name, demo_dim_branch.location, demo_unified_revenue.total_revenue]
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_dim_date.date_date
    row: 58
    col: 0
    width: 12
    height: 6

  - title: "Revenue by Branch & Stream"
    name: tata_detail_table
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_grid
    fields: [demo_dim_branch.branch_name, demo_unified_revenue.revenue_stream, demo_unified_revenue.total_revenue, demo_unified_revenue.transaction_count]
    sorts: [demo_unified_revenue.total_revenue desc]
    limit: 20
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_dim_date.date_date
      branch_filter: demo_dim_branch.branch_name
    row: 58
    col: 12
    width: 12
    height: 6

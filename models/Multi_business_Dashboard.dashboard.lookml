- dashboard: multi_business_dashboard

  title: "MGB Motors - Businesses"
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100
  filters_bar_collapsed: false
  description: "Pick a business to instantly filter every chart on the page."

  filters:
  - name: business_filter
    title: "Choose a Business"
    type: field_filter
    default_value: "JCB India"
    allow_multiple_values: false
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    field: demo_dim_business.business_name

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
    name: switcher_title_banner
    type: text
    body_text: "<div style=\"background:linear-gradient(90deg, #2C3E70 0%, #1A1A1A 100%); padding:10px 14px; text-align:center; display:flex; align-items:center; justify-content:center; height:100%; box-sizing:border-box; font-family:'Google Sans', Roboto, Arial, sans-serif;\"><span style=\"color:#FFFFFF; font-size:22px; font-weight:bold; letter-spacing:1px;\">MGB MOTORS — BUSINESS DEEP DIVE</span><span style=\"color:#D0D5E0; font-size:13px;\"> &nbsp;|&nbsp; Click a business above to explore its numbers</span></div>"
    row: 0
    col: 0
    width: 24
    height: 2

  # ================= HERO ROW =================
  - title: "Selected Business"
    name: business_badge_hero
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: single_value
    fields: [demo_dim_business.business_badge]
    listen:
      business_filter: demo_dim_business.business_name
    row: 2
    col: 0
    width: 8
    height: 3

  - title: "Total Revenue"
    name: kpi_total_revenue
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: single_value
    fields: [demo_unified_revenue.total_revenue]
    custom_color_enabled: true
    custom_color: "#2C3E70"
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_dim_date.date_date
      branch_filter: demo_dim_branch.branch_name
    row: 2
    col: 8
    width: 8
    height: 3

  - title: "Total Transactions"
    name: kpi_total_txn
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: single_value
    fields: [demo_unified_revenue.transaction_count]
    custom_color_enabled: true
    custom_color: "#5D6D7E"
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_dim_date.date_date
      branch_filter: demo_dim_branch.branch_name
    row: 2
    col: 16
    width: 8
    height: 3

  # ================= KPI ROW 2 =================
  - title: "Vehicle Sales Revenue"
    name: kpi_vehicle_revenue
    model: v2_mgb_motors_dashboard
    explore: demo_fact_vehicle_sales
    type: single_value
    fields: [demo_fact_vehicle_sales.total_invoice_amount]
    custom_color_enabled: true
    custom_color: "#16A085"
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
      vehicle_type_filter: demo_dim_vehicle_type.vehicle_type_name
    row: 5
    col: 0
    width: 8
    height: 2

  - title: "Parts Sales Revenue"
    name: kpi_parts_revenue
    model: v2_mgb_motors_dashboard
    explore: demo_fact_parts_sales
    type: single_value
    fields: [demo_fact_parts_sales.total_sales_amount]
    custom_color_enabled: true
    custom_color: "#5D6D7E"
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_parts_sales.invoice_date
      branch_filter: demo_fact_parts_sales.branch
      part_category_filter: demo_dim_part_category.category_name
    row: 5
    col: 8
    width: 8
    height: 2

  - title: "Service Revenue"
    name: kpi_service_revenue
    model: v2_mgb_motors_dashboard
    explore: demo_fact_service_revenue
    type: single_value
    fields: [demo_fact_service_revenue.total_sale_amount]
    custom_color_enabled: true
    custom_color: "#D68910"
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 5
    col: 16
    width: 8
    height: 2

  # ================= WEEKLY TREND =================
  - title: "Weekly Revenue by Stream"
    name: weekly_trend
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_column
    fields: [demo_dim_date.date_week, demo_unified_revenue.revenue_stream, demo_unified_revenue.total_revenue]
    pivots: [demo_unified_revenue.revenue_stream]
    stacking: normal
    series_colors:
      "Vehicle Sales": "#16A085"
      "Parts Sales (Dealer/Counter)": "#2C3E70"
      "Service Revenue": "#D68910"
    show_value_labels: false
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_dim_date.date_date
      branch_filter: demo_dim_branch.branch_name
    row: 7
    col: 0
    width: 24
    height: 5

  # ================= VEHICLE SALES BANNER =================
  - title: ""
    name: vehicle_sales_banner
    type: text
    body_text: "<div style=\"background-color:#16A085; padding:8px 14px; display:flex; align-items:center; height:100%; box-sizing:border-box; font-family:'Google Sans', Roboto, Arial, sans-serif;\"><span style=\"color:#FFFFFF; font-size:16px; font-weight:bold;\">VEHICLE SALES</span></div>"
    row: 12
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
    colors: ["#16A085"]
    show_value_labels: true
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
      vehicle_type_filter: demo_dim_vehicle_type.vehicle_type_name
    row: 14
    col: 0
    width: 8
    height: 5

  - title: "Model Performance: Volume vs. Price"
    name: model_scatter
    model: v2_mgb_motors_dashboard
    explore: demo_fact_vehicle_sales
    type: looker_scatter
    fields: [demo_fact_vehicle_sales.model, demo_fact_vehicle_sales.total_quantity_sold, demo_fact_vehicle_sales.average_price_per_machine]
    colors: ["#2C3E70", "#16A085"]
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
      vehicle_type_filter: demo_dim_vehicle_type.vehicle_type_name
    row: 14
    col: 8
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
    colors: ["#16A085", "#2C3E70", "#5D6D7E", "#D68910", "#8C8C8C", "#7A7A7A", "#4A4A4A", "#B38600"]
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
    row: 14
    col: 16
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
    colors: ["#2C3E70", "#16A085", "#5D6D7E", "#D68910", "#8C8C8C", "#7A7A7A", "#4A4A4A"]
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
      vehicle_type_filter: demo_dim_vehicle_type.vehicle_type_name
    row: 19
    col: 0
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
    colors: ["#5D6D7E", "#16A085", "#2C3E70", "#D68910", "#8C8C8C", "#4A4A4A"]
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
      vehicle_type_filter: demo_dim_vehicle_type.vehicle_type_name
    row: 19
    col: 8
    width: 8
    height: 5

  - title: "Sales Employee Performance"
    name: vehicle_sales_employee_table
    model: v2_mgb_motors_dashboard
    explore: demo_fact_vehicle_sales
    type: looker_grid
    fields: [demo_fact_vehicle_sales.sales_employee, demo_fact_vehicle_sales.count, demo_fact_vehicle_sales.total_invoice_amount]
    sorts: [demo_fact_vehicle_sales.total_invoice_amount desc]
    limit: 8
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
      vehicle_type_filter: demo_dim_vehicle_type.vehicle_type_name
    row: 19
    col: 16
    width: 8
    height: 5

  # ================= PARTS SALES BANNER =================
  - title: ""
    name: parts_sales_banner
    type: text
    body_text: "<div style=\"background-color:#2C3E70; padding:8px 14px; display:flex; align-items:center; height:100%; box-sizing:border-box; font-family:'Google Sans', Roboto, Arial, sans-serif;\"><span style=\"color:#FFFFFF; font-size:16px; font-weight:bold;\">PARTS SALES</span></div>"
    row: 24
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
    colors: ["#5D6D7E"]
    show_value_labels: true
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_parts_sales.invoice_date
      branch_filter: demo_fact_parts_sales.branch
      part_category_filter: demo_dim_part_category.category_name
    row: 26
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
    colors: ["#2C3E70", "#16A085", "#5D6D7E", "#D68910", "#8C8C8C", "#7A7A7A", "#4A4A4A", "#B38600", "#C9C9C9", "#3E5C8A"]
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_parts_sales.invoice_date
      branch_filter: demo_fact_parts_sales.branch
    row: 26
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
    colors: ["#2C3E70", "#16A085"]
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_parts_sales.invoice_date
      branch_filter: demo_fact_parts_sales.branch
      part_category_filter: demo_dim_part_category.category_name
    row: 26
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
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_parts_sales.invoice_date
      branch_filter: demo_fact_parts_sales.branch
      part_category_filter: demo_dim_part_category.category_name
    row: 31
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
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_parts_sales.invoice_date
      branch_filter: demo_fact_parts_sales.branch
      part_category_filter: demo_dim_part_category.category_name
    row: 31
    col: 12
    width: 12
    height: 6

  # ================= SERVICE REVENUE BANNER =================
  - title: ""
    name: service_revenue_banner
    type: text
    body_text: "<div style=\"background-color:#D68910; padding:8px 14px; display:flex; align-items:center; height:100%; box-sizing:border-box; font-family:'Google Sans', Roboto, Arial, sans-serif;\"><span style=\"color:#FFFFFF; font-size:16px; font-weight:bold;\">SERVICE REVENUE</span></div>"
    row: 37
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
    colors: ["#D68910"]
    show_value_labels: true
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 39
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
    colors: ["#2C3E70"]
    show_value_labels: true
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 39
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
    colors: ["#16A085", "#D68910"]
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 39
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
    colors: ["#5D6D7E"]
    show_value_labels: true
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 44
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
    colors: ["#D68910"]
    show_value_labels: true
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 44
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
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 44
    col: 16
    width: 8
    height: 5

  # ================= BRANCH OVERVIEW =================
  - title: ""
    name: branch_overview_banner
    type: text
    body_text: "<div style=\"background-color:#1A1A1A; padding:8px 14px; display:flex; align-items:center; height:100%; box-sizing:border-box; font-family:'Google Sans', Roboto, Arial, sans-serif;\"><span style=\"color:#FFFFFF; font-size:16px; font-weight:bold;\">BRANCH OVERVIEW</span></div>"
    row: 49
    col: 0
    width: 24
    height: 2

  - title: "Revenue by Branch Location"
    name: switcher_branch_map
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_map
    fields: [demo_dim_branch.branch_name, demo_dim_branch.location, demo_unified_revenue.total_revenue]
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_dim_date.date_date
    row: 51
    col: 0
    width: 12
    height: 6

  - title: "Revenue by Branch & Stream"
    name: switcher_detail_table
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_grid
    fields: [demo_dim_branch.branch_name, demo_unified_revenue.revenue_stream, demo_unified_revenue.total_revenue, demo_unified_revenue.transaction_count]
    sorts: [demo_unified_revenue.total_revenue desc]
    limit: 20
    listen:
      business_filter: demo_dim_business.business_name
      date_filter: demo_dim_date.date_date
      branch_filter: demo_dim_branch.branch_name
    row: 51
    col: 12
    width: 12
    height: 6

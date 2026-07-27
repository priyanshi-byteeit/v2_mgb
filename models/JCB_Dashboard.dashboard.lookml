- dashboard: jcb_dashboard
  title: "JCB India - Business Dashboard"
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100
  filters_bar_collapsed: true
  description: "Deep-dive dashboard for JCB India — Vehicle Sales, Parts Sales, and Service Revenue."

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
    title: "Product Family"
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
    name: jcb_title_banner
    type: text
    body_text: "<div style=\"background-color:#1A1A1A; padding:14px; text-align:center; border-left:10px solid #F5A900;\"><span style=\"color:#F5A900; font-size:24px; font-weight:bold; letter-spacing:1px;\">JCB INDIA</span><span style=\"color:#FFFFFF; font-size:14px;\"> &nbsp;|&nbsp; Backhoe Loaders &middot; Excavators &middot; Wheel Loading Shovels &middot; Compactors &middot; Loadall/Telehandlers &middot; Generator Sets</span></div>"
    row: 0
    col: 0
    width: 24
    height: 1

  # ================= KPI ROW =================
  - title: "Total JCB Revenue"
    name: kpi_total_revenue
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: single_value
    fields: [demo_unified_revenue.total_revenue]
    custom_color_enabled: true
    custom_color: "#1A1A1A"
    filters:
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_dim_date.date_date
      branch_filter: demo_dim_branch.branch_name
    row: 1
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
    custom_color: "#F5A900"
    filters:
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
      vehicle_type_filter: demo_dim_vehicle_type.vehicle_type_name
    row: 1
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
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_parts_sales.invoice_date
      branch_filter: demo_fact_parts_sales.branch
      part_category_filter: demo_dim_part_category.category_name
    row: 1
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
    custom_color: "#8A6D00"
    filters:
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 1
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
      "Vehicle Sales": "#F5A900"
      "Parts Sales (Dealer/Counter)": "#1A1A1A"
      "Service Revenue": "#4A4A4A"
    show_value_labels: false
    filters:
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_dim_date.date_date
      branch_filter: demo_dim_branch.branch_name
    row: 3
    col: 0
    width: 24
    height: 5

  # ================= VEHICLE SALES BANNER =================
  - title: ""
    name: vehicle_sales_banner
    type: text
    body_text: "<div style=\"background-color:#F5A900; padding:8px 14px;\"><span style=\"color:#1A1A1A; font-size:16px; font-weight:bold;\">VEHICLE SALES</span></div>"
    row: 8
    col: 0
    width: 24
    height: 1

  - title: "Revenue by Branch"
    name: vehicle_revenue_by_branch
    model: v2_mgb_motors_dashboard
    explore: demo_fact_vehicle_sales
    type: looker_column
    fields: [demo_fact_vehicle_sales.branch, demo_fact_vehicle_sales.total_invoice_amount]
    sorts: [demo_fact_vehicle_sales.total_invoice_amount desc]
    limit: 12
    colors: ["#F5A900"]
    show_value_labels: true
    filters:
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
      vehicle_type_filter: demo_dim_vehicle_type.vehicle_type_name
    row: 9
    col: 0
    width: 8
    height: 5

  - title: "Model Performance: Volume vs. Price"
    name: model_scatter
    model: v2_mgb_motors_dashboard
    explore: demo_fact_vehicle_sales
    type: looker_scatter
    fields: [demo_fact_vehicle_sales.model, demo_fact_vehicle_sales.total_quantity_sold, demo_fact_vehicle_sales.average_price_per_machine]
    colors: ["#1A1A1A", "#F5A900"]
    filters:
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
      vehicle_type_filter: demo_dim_vehicle_type.vehicle_type_name
    row: 9
    col: 8
    width: 8
    height: 5

  - title: "Revenue by Product Family"
    name: vehicle_mix_by_family
    model: v2_mgb_motors_dashboard
    explore: demo_fact_vehicle_sales
    type: looker_pie
    fields: [demo_dim_vehicle_type.vehicle_type_name, demo_fact_vehicle_sales.total_invoice_amount]
    value_labels: legend
    label_type: labPer
    donut: true
    colors: ["#F5A900", "#1A1A1A", "#4A4A4A", "#C98A00", "#7A7A7A", "#8A6D00", "#D4AF37", "#2E2E2E"]
    filters:
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
    row: 9
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
    colors: ["#F5A900", "#1A1A1A", "#4A4A4A", "#C98A00", "#7A7A7A", "#8A6D00", "#D4AF37", "#2E2E2E"]
    filters:
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
      vehicle_type_filter: demo_dim_vehicle_type.vehicle_type_name
    row: 14
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
    colors: ["#1A1A1A", "#F5A900", "#4A4A4A", "#8A6D00", "#7A7A7A", "#D4AF37"]
    filters:
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
      vehicle_type_filter: demo_dim_vehicle_type.vehicle_type_name
    row: 14
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
    filters:
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_vehicle_sales.invoice_date
      branch_filter: demo_fact_vehicle_sales.branch
      vehicle_type_filter: demo_dim_vehicle_type.vehicle_type_name
    row: 14
    col: 16
    width: 8
    height: 5

  # ================= PARTS SALES BANNER =================
  - title: ""
    name: parts_sales_banner
    type: text
    body_text: "<div style=\"background-color:#1A1A1A; padding:8px 14px;\"><span style=\"color:#F5A900; font-size:16px; font-weight:bold;\">PARTS SALES</span></div>"
    row: 19
    col: 0
    width: 24
    height: 1

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
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_parts_sales.invoice_date
      branch_filter: demo_fact_parts_sales.branch
      part_category_filter: demo_dim_part_category.category_name
    row: 20
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
    colors: ["#F5A900", "#1A1A1A", "#4A4A4A", "#C98A00", "#7A7A7A", "#8A6D00", "#D4AF37", "#2E2E2E", "#B38600", "#5C5C5C"]
    filters:
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_parts_sales.invoice_date
      branch_filter: demo_fact_parts_sales.branch
    row: 20
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
    colors: ["#F5A900", "#1A1A1A"]
    filters:
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_parts_sales.invoice_date
      branch_filter: demo_fact_parts_sales.branch
      part_category_filter: demo_dim_part_category.category_name
    row: 20
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
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_parts_sales.invoice_date
      branch_filter: demo_fact_parts_sales.branch
      part_category_filter: demo_dim_part_category.category_name
    row: 25
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
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_parts_sales.invoice_date
      branch_filter: demo_fact_parts_sales.branch
      part_category_filter: demo_dim_part_category.category_name
    row: 25
    col: 12
    width: 12
    height: 6

  # ================= SERVICE REVENUE BANNER =================
  - title: ""
    name: service_revenue_banner
    type: text
    body_text: "<div style=\"background-color:#4A4A4A; padding:8px 14px;\"><span style=\"color:#FFFFFF; font-size:16px; font-weight:bold;\">SERVICE REVENUE</span></div>"
    row: 31
    col: 0
    width: 24
    height: 1

  - title: "Revenue by Branch"
    name: service_revenue_by_branch
    model: v2_mgb_motors_dashboard
    explore: demo_fact_service_revenue
    type: looker_column
    fields: [demo_fact_service_revenue.branch, demo_fact_service_revenue.total_sale_amount]
    sorts: [demo_fact_service_revenue.total_sale_amount desc]
    limit: 12
    colors: ["#8A6D00"]
    show_value_labels: true
    filters:
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 32
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
    colors: ["#F5A900"]
    show_value_labels: true
    filters:
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 32
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
    colors: ["#1A1A1A", "#F5A900"]
    filters:
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 32
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
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 37
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
    colors: ["#F5A900"]
    show_value_labels: true
    filters:
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 37
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
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_fact_service_revenue.doc_date
      branch_filter: demo_fact_service_revenue.branch
    row: 37
    col: 16
    width: 8
    height: 5

  # ================= BRANCH OVERVIEW =================
  - title: ""
    name: branch_overview_banner
    type: text
    body_text: "<div style=\"background-color:#1A1A1A; padding:8px 14px;\"><span style=\"color:#F5A900; font-size:16px; font-weight:bold;\">BRANCH OVERVIEW</span></div>"
    row: 43
    col: 0
    width: 24
    height: 1

  - title: "Revenue by Branch Location"
    name: jcb_branch_map
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_map
    fields: [demo_dim_branch.branch_name, demo_dim_branch.location, demo_unified_revenue.total_revenue]
    filters:
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_dim_date.date_date
    row: 44
    col: 0
    width: 12
    height: 6

  - title: "Revenue by Branch & Stream"
    name: jcb_detail_table
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_grid
    fields: [demo_dim_branch.branch_name, demo_unified_revenue.revenue_stream, demo_unified_revenue.total_revenue, demo_unified_revenue.transaction_count]
    sorts: [demo_unified_revenue.total_revenue desc]
    limit: 20
    filters:
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_dim_date.date_date
      branch_filter: demo_dim_branch.branch_name
    row: 44
    col: 12
    width: 12
    height: 6

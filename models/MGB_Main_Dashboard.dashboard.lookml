- dashboard: main_mgb_dashboard
  title: MGB Motors - Consolidated Dashboard (JCB India, Tata, Eicher)
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100
  filters_bar_collapsed: true
  description: "Central executive rollup across all 3 businesses — Vehicle Sales, Parts Sales, and Service Revenue."

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

  - name: business_filter
    title: Business
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    field: demo_dim_business.business_name

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

  - name: revenue_stream_filter
    title: Revenue Stream
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    field: demo_unified_revenue.revenue_stream

  - name: vehicle_type_filter
    title: Vehicle Type
    type: field_filter
    default_value: ""
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    field: demo_dim_vehicle_type.category

  - name: part_category_filter
    title: Part Category
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

  - name: part_search_filter
    title: "Search a Specific Part (e.g. 'clutch plate')"
    type: field_filter
    default_value: ""
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
    model: v2_mgb_motors_dashboard
    explore: demo_fact_parts_sales
    field: demo_fact_parts_sales.part_name

  elements:

  # ================= KPI ROW - color-coded per business =================
  - title: Total Revenue (All Businesses)
    name: kpi_total_revenue
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: single_value
    fields: [demo_unified_revenue.total_revenue]
    value_format: "₹0.00,,\"Cr\""
    custom_color_enabled: true
    custom_color: "#3A3A3A"
    listen:
      date_filter: demo_dim_date.date_date
      business_filter: demo_dim_business.business_name
      branch_filter: demo_dim_branch.branch_name
      revenue_stream_filter: demo_unified_revenue.revenue_stream
      vehicle_type_filter: demo_dim_vehicle_type.category
      part_category_filter: demo_dim_part_category.category_name
    row: 0
    col: 0
    width: 6
    height: 2

  - title: JCB India Revenue
    name: kpi_jcb_revenue
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: single_value
    fields: [demo_unified_revenue.total_revenue]
    value_format: "₹0.00,,\"Cr\""
    custom_color_enabled: true
    custom_color: "#8B1E3F"
    filters:
      demo_dim_business.business_name: "JCB India"
    listen:
      date_filter: demo_dim_date.date_date
      branch_filter: demo_dim_branch.branch_name
      revenue_stream_filter: demo_unified_revenue.revenue_stream
    row: 0
    col: 6
    width: 6
    height: 2

  - title: Eicher Revenue
    name: kpi_eicher_revenue
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: single_value
    fields: [demo_unified_revenue.total_revenue]
    value_format: "₹0.00,,\"Cr\""
    custom_color_enabled: true
    custom_color: "#F2C230"
    filters:
      demo_dim_business.business_name: "Eicher"
    listen:
      date_filter: demo_dim_date.date_date
      branch_filter: demo_dim_branch.branch_name
      revenue_stream_filter: demo_unified_revenue.revenue_stream
    row: 0
    col: 12
    width: 6
    height: 2

  - title: Tata Motors Revenue
    name: kpi_tata_revenue
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: single_value
    fields: [demo_unified_revenue.total_revenue]
    value_format: "₹0.00,,\"Cr\""
    custom_color_enabled: true
    custom_color: "#1B4F72"
    filters:
      demo_dim_business.business_name: "Tata Motors"
    listen:
      date_filter: demo_dim_date.date_date
      branch_filter: demo_dim_branch.branch_name
      revenue_stream_filter: demo_unified_revenue.revenue_stream
    row: 0
    col: 18
    width: 6
    height: 2

  # ================= TREND (stacked by business, color-coded) + NAV BUTTONS =================
  - title: Weekly Revenue Trend by Business
    name: revenue_trend_by_business
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_column
    fields: [demo_dim_date.date_week, demo_dim_business.business_name, demo_unified_revenue.total_revenue]
    pivots: [demo_dim_business.business_name]
    stacking: normal
    series_colors:
      "JCB India": "#8B1E3F"
      "Eicher": "#F2C230"
      "Tata Motors": "#1B4F72"
    show_value_labels: false
    listen:
      date_filter: demo_dim_date.date_date
      business_filter: demo_dim_business.business_name
      branch_filter: demo_dim_branch.branch_name
      revenue_stream_filter: demo_unified_revenue.revenue_stream
      vehicle_type_filter: demo_dim_vehicle_type.category
      part_category_filter: demo_dim_part_category.category_name
    row: 2
    col: 0
    width: 15
    height: 5

  - title: ""
    name: quick_links_heading
    type: text
    body_text: "<div style=\"text-align:center\"><strong>Explore each business in detail:</strong></div>"
    row: 2
    col: 15
    width: 9
    height: 1

  - name: btn_jcb
    type: button
    rich_content_json: '{ "text": "JCB India Dashboard", "newTab": true, "alignment": "center", "size": "medium", "style": "FILLED", "color": "#8B1E3F", "href": "https://byteeit.cloud.looker.com/dashboards/v2_mgb_motors_dashboard::jcb_dashboard" }'
    row: 3
    col: 15
    width: 9
    height: 1

  - name: btn_eicher
    type: button
    rich_content_json: '{ "text": "Eicher Dashboard", "newTab": true, "alignment": "center", "size": "medium", "style": "FILLED", "color": "#F2C230", "href": "https://byteeit.cloud.looker.com/dashboards/v2_mgb_motors_dashboard::eicher_dashboard" }'
    row: 4
    col: 15
    width: 9
    height: 1

  - name: btn_tata
    type: button
    rich_content_json: '{ "text": "Tata Motors Dashboard", "newTab": true, "alignment": "center", "size": "medium", "style": "FILLED", "color": "#1B4F72", "href": "https://byteeit.cloud.looker.com/dashboards/v2_mgb_motors_dashboard::tata_dashboard" }'
    row: 5
    col: 15
    width: 9
    height: 1

  - title: ""
    name: quick_links_spacer
    type: text
    body_text: " "
    row: 6
    col: 15
    width: 9
    height: 1

  # ================= MIX (business + stream) + BRANCH =================
  - title: Revenue Mix by Business
    name: revenue_mix_business
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_pie
    fields: [demo_dim_business.business_name, demo_unified_revenue.total_revenue]
    value_labels: legend
    label_type: labPer
    donut: true
    series_colors:
      "JCB India": "#8B1E3F"
      "Eicher": "#F2C230"
      "Tata Motors": "#1B4F72"
    listen:
      date_filter: demo_dim_date.date_date
      branch_filter: demo_dim_branch.branch_name
      revenue_stream_filter: demo_unified_revenue.revenue_stream
      vehicle_type_filter: demo_dim_vehicle_type.category
      part_category_filter: demo_dim_part_category.category_name
    row: 9
    col: 0
    width: 8
    height: 5

  - title: Revenue Mix by Stream
    name: revenue_mix_stream
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_pie
    fields: [demo_unified_revenue.revenue_stream, demo_unified_revenue.total_revenue]
    value_labels: legend
    label_type: labPer
    donut: true
    colors: ["#8B1E3F", "#C9A227", "#1B2A4A"]
    listen:
      date_filter: demo_dim_date.date_date
      business_filter: demo_dim_business.business_name
      branch_filter: demo_dim_branch.branch_name
    row: 9
    col: 8
    width: 8
    height: 5

  - title: Revenue by Branch
    name: revenue_by_branch
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_column
    fields: [demo_dim_branch.branch_name, demo_dim_business.business_name, demo_unified_revenue.total_revenue]
    pivots: [demo_dim_business.business_name]
    stacking: normal
    sorts: [demo_unified_revenue.total_revenue desc]
    limit: 15
    series_colors:
      "JCB India": "#8B1E3F"
      "Eicher": "#F2C230"
      "Tata Motors": "#1B4F72"
    listen:
      date_filter: demo_dim_date.date_date
      business_filter: demo_dim_business.business_name
      revenue_stream_filter: demo_unified_revenue.revenue_stream
    row: 9
    col: 16
    width: 8
    height: 5

  # ================= BRANCH MAP =================
  - title: Revenue by Branch Location
    name: branch_location_map
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_map
    fields: [demo_dim_branch.branch_name, demo_dim_branch.location, demo_unified_revenue.total_revenue]
    listen:
      date_filter: demo_dim_date.date_date
      business_filter: demo_dim_business.business_name
      revenue_stream_filter: demo_unified_revenue.revenue_stream
    row: 14
    col: 0
    width: 12
    height: 6

  # ================= DETAIL CROSSTAB =================
  - title: Revenue by Business, Branch & Stream
    name: revenue_detail_table
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_grid
    fields: [demo_dim_business.business_name, demo_dim_branch.branch_name, demo_unified_revenue.revenue_stream, demo_unified_revenue.total_revenue, demo_unified_revenue.transaction_count]
    sorts: [demo_unified_revenue.total_revenue desc]
    limit: 20
    listen:
      date_filter: demo_dim_date.date_date
      business_filter: demo_dim_business.business_name
      branch_filter: demo_dim_branch.branch_name
      revenue_stream_filter: demo_unified_revenue.revenue_stream
    row: 14
    col: 12
    width: 12
    height: 6

  # ================= BONUS: LIVE PART SEARCH ACROSS ALL 3 BUSINESSES =================
  - title: "Part Search Across All Businesses (e.g. search 'clutch plate')"
    name: part_search_grid
    model: v2_mgb_motors_dashboard
    explore: demo_fact_parts_sales
    type: looker_grid
    fields: [demo_dim_business.business_name, demo_fact_parts_sales.part_name, demo_dim_part_category.category_name, demo_fact_parts_sales.branch, demo_fact_parts_sales.invoice_date, demo_fact_parts_sales.sp_amount, demo_fact_parts_sales.invoice_total]
    sorts: [demo_fact_parts_sales.invoice_date desc]
    limit: 50
    listen:
      date_filter: demo_dim_date.date_date
      business_filter: demo_dim_business.business_name
      branch_filter: demo_dim_branch.branch_name
      part_category_filter: demo_dim_part_category.category_name
      part_search_filter: demo_fact_parts_sales.part_name
    row: 20
    col: 0
    width: 24
    height: 6

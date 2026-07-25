- dashboard: mgb_main_dashboard
  title: "Consolidated Revenue Dashboard - JCB India, Tata, Eicher"
  layout: newspaper
  preferred_viewer: dashboards-next

  filters:
  - name: Business
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

  - name: Branch
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

  - name: Revenue Stream
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

  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: "2026/06/01 to 2026/08/30"
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    field: demo_dim_date.date

  elements:

  # ---- KPI row ----
  - title: "Total Revenue (All Businesses)"
    name: total_revenue_all
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: single_value
    fields: [demo_unified_revenue.total_revenue]
    listen:
      Business: demo_dim_business.business_name
      Branch: demo_dim_branch.branch_name
      Revenue Stream: demo_unified_revenue.revenue_stream
      Date Range: demo_dim_date.date
    row: 0
    col: 0
    width: 6
    height: 4

  - title: "Total Transactions"
    name: total_txn_all
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: single_value
    fields: [demo_unified_revenue.transaction_count]
    listen:
      Business: demo_dim_business.business_name
      Branch: demo_dim_branch.branch_name
      Revenue Stream: demo_unified_revenue.revenue_stream
      Date Range: demo_dim_date.date
    row: 0
    col: 6
    width: 6
    height: 4

  - title: "Revenue by Business"
    name: revenue_by_business_kpi
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_grid
    fields: [demo_dim_business.business_name, demo_unified_revenue.total_revenue]
    sorts: [demo_unified_revenue.total_revenue desc]
    listen:
      Branch: demo_dim_branch.branch_name
      Revenue Stream: demo_unified_revenue.revenue_stream
      Date Range: demo_dim_date.date
    row: 0
    col: 12
    width: 12
    height: 4

  # ---- Weekly trend by business ----
  - title: "Weekly Revenue Trend by Business"
    name: weekly_trend_by_business
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_column
    fields: [demo_dim_date.date_week, demo_dim_business.business_name, demo_unified_revenue.total_revenue]
    pivots: [demo_dim_business.business_name]
    stacking: normal
    listen:
      Business: demo_dim_business.business_name
      Branch: demo_dim_branch.branch_name
      Revenue Stream: demo_unified_revenue.revenue_stream
      Date Range: demo_dim_date.date
    row: 4
    col: 0
    width: 24
    height: 8

  # ---- Mix + branch breakdown ----
  - title: "Revenue Mix by Business"
    name: revenue_mix_business
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_pie
    fields: [demo_dim_business.business_name, demo_unified_revenue.total_revenue]
    listen:
      Branch: demo_dim_branch.branch_name
      Revenue Stream: demo_unified_revenue.revenue_stream
      Date Range: demo_dim_date.date
    row: 12
    col: 0
    width: 8
    height: 8

  - title: "Revenue Mix by Stream"
    name: revenue_mix_stream
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_pie
    fields: [demo_unified_revenue.revenue_stream, demo_unified_revenue.total_revenue]
    listen:
      Business: demo_dim_business.business_name
      Branch: demo_dim_branch.branch_name
      Date Range: demo_dim_date.date
    row: 12
    col: 8
    width: 8
    height: 8

  - title: "Top Branches by Revenue"
    name: top_branches
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_bar
    fields: [demo_dim_branch.branch_name, demo_unified_revenue.total_revenue]
    sorts: [demo_unified_revenue.total_revenue desc]
    limit: 15
    listen:
      Business: demo_dim_business.business_name
      Revenue Stream: demo_unified_revenue.revenue_stream
      Date Range: demo_dim_date.date
    row: 12
    col: 16
    width: 8
    height: 8

  # ---- Branch location map ----
  - title: "Revenue by Branch Location"
    name: branch_location_map
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_map
    fields: [demo_dim_branch.branch_name, demo_dim_branch.latitude, demo_dim_branch.longitude, demo_unified_revenue.total_revenue]
    listen:
      Business: demo_dim_business.business_name
      Revenue Stream: demo_unified_revenue.revenue_stream
      Date Range: demo_dim_date.date
    row: 20
    col: 0
    width: 12
    height: 10

  # ---- Detail table ----
  - title: "Revenue by Business, Branch & Stream"
    name: revenue_detail_table
    model: v2_mgb_motors_dashboard
    explore: demo_unified_revenue
    type: looker_grid
    fields: [demo_dim_business.business_name, demo_dim_branch.branch_name, demo_unified_revenue.revenue_stream, demo_unified_revenue.total_revenue, demo_unified_revenue.transaction_count]
    sorts: [demo_unified_revenue.total_revenue desc]
    listen:
      Business: demo_dim_business.business_name
      Branch: demo_dim_branch.branch_name
      Revenue Stream: demo_unified_revenue.revenue_stream
      Date Range: demo_dim_date.date
    row: 20
    col: 12
    width: 12
    height: 10

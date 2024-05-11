# The name of this view in Looker is "Marketing Campaign"
view: marketing_campaign {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `boostr-396507.zazmic_marketing.marketing_campaign` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Acquisition Cost" in Explore.

  dimension: acquisition_cost {
    type: number
    sql: ${TABLE}.Acquisition_Cost ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.Campaign_ID ;;
  }

  dimension: campaign_type {
    type: string
    sql: ${TABLE}.Campaign_Type ;;
  }

  dimension: channel_used {
    type: string
    sql: ${TABLE}.Channel_Used ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.Clicks ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.Company ;;
  }

  dimension: conversion_rate {
    type: number
    sql: ${TABLE}.Conversion_Rate ;;
  }

  dimension: customer_segment {
    type: string
    sql: ${TABLE}.Customer_Segment ;;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}.Duration ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.End_Date ;;
  }

  dimension: engagement_score {
    type: number
    sql: ${TABLE}.Engagement_Score ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.Impressions ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.Language ;;
  }

  dimension: location {
    type: string
    # map_layer_name: us_states
    sql: ${TABLE}.Location ;;
  }
  dimension: state {
    type: string
    map_layer_name: us_states
    sql: case when ${location}="Miami" then "Florida"
            when ${location}="Chicago" then "Illinois"
            when ${location}="Houston" then "Texas"
            when ${location}="Los Angeles" then "California"
            when ${location}="New York" then "New York"
            end;;
  }
  dimension: roi {
    type: number
    sql: ${TABLE}.ROI ;;
  }

  dimension: sales {
    type: number
    sql: ${TABLE}.Sales ;;
  }

  dimension_group: start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Start_Date ;;
  }

  dimension: target_audience {
    type: string
    sql: ${TABLE}.Target_Audience ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_acquisition_cost {
    type: sum
    sql: ${acquisition_cost} ;;
    value_format: "$#,##0.00,,\" M\""
    }


  measure: average_acquisition_cost {
    type: average
    value_format: "0.00"
    sql: ${acquisition_cost} ;;  }


  measure: Total_sales {
  type: sum
  value_format: "$#,##0.00,,\" M\""
  sql: ${sales} ;;
  html: {{rendered_value}} | Total_spent: {{total_acquisition_cost._rendered_value}}| ROI: {{Total_ROI._rendered_value}};;

  }

  measure: Total_ROI {
  type: number
  sql: (${Total_sales}-${total_acquisition_cost})/${Total_sales} ;;
  value_format: "0.00%"
  }

  measure: count {
    type: count
  }
}

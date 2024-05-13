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
measure: Good_engagement{
  type: sum
  sql: case when ${engagement_score}>4 then 1 else 0 end ;;
  html: {{rendered_value}}| Total count: {{count._rendered_value}} ;;
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

  #-------------------------------------------KPI measures and drill fields-----------------------------------
  measure: Total_sales_KPI {
    type: sum
    value_format: "$[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";"
    sql: ${sales} ;;
    #drill_fields: []
  }

  measure: total_acquisition_cost_KPI {
    type: sum
    sql: ${acquisition_cost} ;;
    value_format: "$[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";"
    }

  #-------------------------------------------MEASURES________________________________________________________

  measure: count {
    type: count
  }
  measure: Total_sales {
    type: sum
    #value_format: "$#,##0.00,,\" M\""
    value_format: "$[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";"

    sql: ${sales} ;;
    html: {{rendered_value}} | Total_spent: {{total_acquisition_cost._rendered_value}}| ROI: {{Total_ROI._rendered_value}};;
  }

  measure: total_acquisition_cost {
    type: sum
    sql: ${acquisition_cost} ;;
    value_format: "$[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";"

  }


  measure: average_acquisition_cost {
    type: average
    value_format: "0.00"
    sql: ${acquisition_cost} ;;  }

  measure: Total_clicks {
    type: sum
    sql: ${clicks} ;;
    html:{{rendered_value}} | Total_Impressions: {{Total_impressions._rendered_value}};;
  }
  measure: Total_impressions {
    type: sum
    sql: ${impressions} ;;
  }

  measure: Total_ROI {
    type: number
    sql: (${Total_sales}-${total_acquisition_cost})/${Total_sales} ;;
    value_format: "0.00%"
  }
  measure: CTR {
    type: number
    sql: ${Total_clicks}/${Total_impressions}  ;;
    value_format: "0.00%"
  html: {{rendered_value}} | {{Total_sales_KPI._rendered_value}} ;;

  }

}

view: marketingcampaign {
  label: "Campaign"

  sql_table_name: `boostr-396507.zazmic_marketing.Marketingcampaign` ;;

  dimension: ad_campaigns {
    type: number
    sql: ${TABLE}.Ad_Campaigns ;;
  }

  dimension: ad_id {
    type: number
    sql: ${TABLE}.ad_id ;;
  }

  dimension: age {
    type: string
    sql: ${TABLE}.age ;;
  }

  dimension: approved_conversion {
    type: number
    sql: ${TABLE}.Approved_Conversion ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.Clicks ;;
  }

  dimension: fb_campaign_id {
    type: number
    sql: ${TABLE}.fb_campaign_id ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: impression {
    type: number
    sql: ${TABLE}.Impression ;;
  }

  dimension: interest {
    type: number
    sql: ${TABLE}.interest ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.Product_Category ;;
  }

  dimension: sales {
    label: "Revenue Generated"
    type: number
    sql: ${TABLE}.Sales ;;
  }

  dimension: spent {
    type: number
    sql: ${TABLE}.Spent ;;
  }

  dimension: inquiry {
    type: number
    sql: ${TABLE}.Total_Conversion ;;
  }

  dimension: xyz_campaign_id {
    type: number
    sql: ${TABLE}.xyz_campaign_id ;;
  }

 #---------------------------------------------MEASURES------------------------------------------------------------
measure: conversion_rate{
  type: number
  sql: ${approved_conversion}/${inquiry} ;;
}

measure: count {
    type: count
    drill_fields: [Total_spent,Saless]
  }
measure: Saless {
  label: "Sales"
  type: sum
  sql: ${sales} ;;
  value_format:  "[>=1001]$#,##0.00,\" K\";$#,##0"
 # drill_fields: [interest,Saless]
}
  measure: Sales {
    label: "Revenue"
    type: sum
    sql: ${sales} ;;
    value_format:  "[>=1001]$#,##0.00,\" K\";$#,##0"
    #drill_fields: [gender,Total_spent,Saless]
  }
measure: total_impressions {
  type: sum
  sql: ${impression} ;;
}
measure: total_clicks {
  type: sum
  sql: ${clicks} ;;
}
 measure: total_approved_conversion {
  type: sum
  sql: ${approved_conversion} ;;  }

measure: average_approved_conversion {
  type: average
  sql: ${approved_conversion} ;;  }

measure: Total_spent{
  type: sum
  sql: ${spent} ;;
  value_format:  "[>=1001]$#,##0.00,\" K\";$#,##0"
}
  set: drill_fields {
    fields: [age,approved_conversion,sales]
  }
}

# The name of this view in Looker is "Marketingcampaign"
view: marketingcampaign {

# The name of this view in Looker is "Zazmic Campaign"

  sql_table_name: `boostr-396507.zazmic_marketing.Marketingcampaign` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Ad Campaigns" in Explore.

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

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_approved_conversion {
    type: sum
    sql: ${approved_conversion} ;;  }
  measure: average_approved_conversion {
    type: average
    sql: ${approved_conversion} ;;  }

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

  dimension: total_conversion {
    type: number
    sql: ${TABLE}.Total_Conversion ;;
  }

  dimension: xyz_campaign_id {
    type: number
    sql: ${TABLE}.xyz_campaign_id ;;
  }
  measure: count {
    type: count
    drill_fields: [drill_fields*]
  }
measure: Saless {
  label: "Sales"
  type: sum
  sql: ${sales} ;;
  value_format:  "[>=1001]$#,##0.00,\" K\";$#,##0"
  drill_fields: [product_category,Saless]

}
measure: Total_spent{
  type: sum
  sql: ${spent} ;;
}
  set: drill_fields {
    fields: [age,approved_conversion,sales]
  }
}

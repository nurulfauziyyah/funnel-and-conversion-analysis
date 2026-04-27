CREATE OR REPLACE TABLE processed.funnel_session AS
SELECT
  visitId,
  ANY_VALUE(fullVisitorId) AS fullVisitorId,
  ANY_VALUE(PARSE_DATE('%Y%m%d', date)) AS visit_date,
  ANY_VALUE(geoNetwork.country) AS country,
  ANY_VALUE(device.deviceCategory) AS device,
  ANY_VALUE(trafficSource.source) AS traffic_source,

  MAX(CASE WHEN hits.eCommerceAction.action_type = '2' THEN 1 ELSE 0 END) AS product_view,
  MAX(CASE WHEN hits.eCommerceAction.action_type = '3' THEN 1 ELSE 0 END) AS add_to_cart,
  MAX(CASE WHEN hits.eCommerceAction.action_type = '5' THEN 1 ELSE 0 END) AS checkout,
  MAX(CASE WHEN hits.eCommerceAction.action_type = '6' THEN 1 ELSE 0 END) AS purchase

FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
UNNEST(hits) AS hits

GROUP BY visitId;
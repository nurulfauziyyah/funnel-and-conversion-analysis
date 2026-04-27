CREATE OR REPLACE TABLE processed.product_funnel AS
SELECT
  visitId,
  ANY_VALUE(fullVisitorId) AS fullVisitorId,
  ANY_VALUE(PARSE_DATE('%Y%m%d', date)) AS visit_date,
  ANY_VALUE(geoNetwork.country) AS country,
  ANY_VALUE(device.deviceCategory) AS device,

  product.v2ProductName AS product_name,

  MAX(CASE WHEN hits.eCommerceAction.action_type = '2' THEN 1 ELSE 0 END) AS product_view,
  MAX(CASE WHEN hits.eCommerceAction.action_type = '3' THEN 1 ELSE 0 END) AS add_to_cart,
  MAX(CASE WHEN hits.eCommerceAction.action_type = '5' THEN 1 ELSE 0 END) AS checkout,
  MAX(CASE WHEN hits.eCommerceAction.action_type = '6' THEN 1 ELSE 0 END) AS purchase

FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
UNNEST(hits) AS hits
LEFT JOIN UNNEST(hits.product) AS product

WHERE product.v2ProductName IS NOT NULL
  AND geoNetwork.country IS NOT NULL
  AND geoNetwork.country != '(not set)'

GROUP BY
  visitId,
  product.v2ProductName
  
ORDER BY visit_date, fullVisitorId;
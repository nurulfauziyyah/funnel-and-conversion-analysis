CREATE OR REPLACE TABLE processed.product_summary AS
SELECT
  product_name,

  -- volume
  COUNT(DISTINCT visitId) AS total_sessions,

  -- funnel counts
  SUM(product_view) AS product_view,
  SUM(add_to_cart) AS add_to_cart,
  SUM(checkout) AS checkout,
  SUM(purchase) AS purchase,

  -- conversion metrics (SAFE_DIVIDE biar ga error)
  SAFE_DIVIDE(SUM(add_to_cart), SUM(product_view)) AS view_to_cart_rate,
  SAFE_DIVIDE(SUM(checkout), SUM(add_to_cart)) AS cart_to_checkout_rate,
  SAFE_DIVIDE(SUM(purchase), SUM(checkout)) AS checkout_to_purchase_rate,

  -- overall conversion
  SAFE_DIVIDE(SUM(purchase), SUM(product_view)) AS overall_conversion_rate

FROM processed.product_funnel

GROUP BY product_name;
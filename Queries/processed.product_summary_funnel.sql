CREATE OR REPLACE TABLE processed.product_summary AS
SELECT
  product_name,

  COUNTIF(product_view = 1) AS product_view,
  COUNTIF(add_to_cart = 1 AND product_view = 1) AS add_to_cart,
  COUNTIF(checkout = 1 AND add_to_cart = 1 AND product_view = 1) AS checkout,
  COUNTIF(purchase = 1 AND checkout = 1 AND add_to_cart = 1 AND product_view = 1) AS purchase,

  SAFE_DIVIDE(
    COUNTIF(add_to_cart = 1 AND product_view = 1),
    COUNTIF(product_view = 1)
  ) AS view_to_cart_rate,

  SAFE_DIVIDE(
    COUNTIF(checkout = 1 AND add_to_cart = 1 AND product_view = 1),
    COUNTIF(add_to_cart = 1 AND product_view = 1)
  ) AS cart_to_checkout_rate,

  SAFE_DIVIDE(
    COUNTIF(purchase = 1 AND checkout = 1 AND add_to_cart = 1 AND product_view = 1),
    COUNTIF(checkout = 1 AND add_to_cart = 1 AND product_view = 1)
  ) AS checkout_to_purchase_rate,

  SAFE_DIVIDE(
    COUNTIF(purchase = 1 AND checkout = 1 AND add_to_cart = 1 AND product_view = 1),
    COUNTIF(product_view = 1)
  ) AS overall_conversion_rate

FROM processed.product_funnel
GROUP BY product_name;
WITH fct_orders AS (
  /* Faktentabelle für Bestellpositionen. */
  SELECT
    ORDER_ID,
    ORDER_DATE,
    CUSTOMER_ID,
    PRODUCT_ID,
    ORDER_STATUS,
    QUANTITY,
    UNIT_PRICE,
    LINE_AMOUNT
  FROM {{ ref('dbt_analytics_cj', 'fct_orders') }}
), aggregate_2 AS (
  SELECT
    PRODUCT_ID,
    MAX(QUANTITY) AS max_QUANTITY,
    MAX(UNIT_PRICE) AS max_UNIT_PRICE
  FROM fct_orders
  GROUP BY
    PRODUCT_ID
), fct_aggregated_sql AS (
  SELECT
    *
  FROM aggregate_2
)
SELECT
  *
FROM fct_aggregated_sql
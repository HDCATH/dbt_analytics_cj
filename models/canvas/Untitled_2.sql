WITH fct_orders AS (
  /* Faktentabelle für Bestellpositionen. */
  SELECT
    *
  FROM {{ ref('dbt_analytics_cj', 'fct_orders') }}
), aggregation AS (
  SELECT
    PRODUCT_ID,
    SUM(QUANTITY) AS sum_QUANTITY,
    SUM(LINE_AMOUNT) AS sum_LINE_AMOUNT
  FROM fct_orders
  GROUP BY
    PRODUCT_ID
), untitled_2_sql AS (
  SELECT
    *
  FROM aggregation
)
SELECT
  *
FROM untitled_2_sql
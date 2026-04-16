WITH stg_customers AS (
  SELECT
    *
  FROM {{ ref('dbt_analytics_cj', 'stg_customers') }}
), stg_orders AS (
  SELECT
    *
  FROM {{ ref('dbt_analytics_cj', 'stg_orders') }}
), join_1 AS (
  SELECT
    *
  FROM stg_orders
  JOIN stg_customers
    USING (CUSTOMER_ID)
), join_orders_customers_sql AS (
  SELECT
    *
  FROM join_1
)
SELECT
  *
FROM join_orders_customers_sql
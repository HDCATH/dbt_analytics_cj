{{ config(materialized='table') }}

select
    order_id,
    order_date,
    customer_id,
    product_id,
    order_status,
    quantity,
    unit_price,
    line_amount

from {{ ref('int_order_enriched') }}
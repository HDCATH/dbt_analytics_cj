{{ config(materialized='view') }}

select
    order_id,
    customer_id,
    order_date,
    upper(status)      as order_status,
    total_amount

from {{ source('raw', 'orders') }}
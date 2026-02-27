{{ config(materialized='table') }}

select
    product_id,
    product_name,
    category,
    price,
    created_at

from {{ ref('stg_products') }}
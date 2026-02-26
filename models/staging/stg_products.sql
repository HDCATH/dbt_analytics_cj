{{ config(materialized='view') }}

select
    product_id,
    product_name,
    category,
    price,
    created_at

from {{ source('raw', 'products') }}
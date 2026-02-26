{{ config(materialized='view') }}

select
    customer_id,
    lower(first_name)      as first_name,
    lower(last_name)       as last_name,
    lower(email)           as email,
    country,
    created_at

from {{ source('raw', 'customers') }}
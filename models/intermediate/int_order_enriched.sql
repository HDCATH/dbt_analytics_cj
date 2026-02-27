{{ config(materialized='view') }}

with orders as (

    select * from {{ ref('stg_orders') }}

),

customers as (

    select * from {{ ref('stg_customers') }}

),

order_items as (

    select * from {{ ref('stg_order_items') }}

),

products as (

    select * from {{ ref('stg_products') }}

)

select
    o.order_id,
    o.order_date,
    o.order_status,
    o.customer_id,
    c.country,

    oi.product_id,
    p.category,

    oi.quantity,
    oi.unit_price,
    oi.line_amount

from orders o
left join customers c
    on o.customer_id = c.customer_id
left join order_items oi
    on o.order_id = oi.order_id
left join products p
    on oi.product_id = p.product_id
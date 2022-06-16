
{{
  config(
    materialized='table'
  )
}}



with base as (
    select 
    p.product_name
    , count(distinct order_id ) product_seen_in_x_orders
    , sum(quantity ) ordered_amount
    FROM {{ ref('greenery', 'stg_order_items') }} o
    left join {{ ref('greenery', 'stg_products') }} p on p.product_id = o.product_id
    group by 1
)


select * from base 
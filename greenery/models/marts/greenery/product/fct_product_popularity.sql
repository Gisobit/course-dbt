{{
  config(
    materialized='table'
  )
}}




select 
product_name
,ordered_amount
,product_seen_in_x_orders
,ordered_amount / product_seen_in_x_orders avg_amount_sold_per_order

from {{ ref('greenery', 'int_order_products') }} iop
order by 2 desc 
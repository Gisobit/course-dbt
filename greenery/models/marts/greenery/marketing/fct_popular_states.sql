{{
  config(
    materialized='table'
  )
}}




select 
state
, count(*) orders_done
, sum(order_total) order_total
, sum(shipping_cost) shipping_costs

from {{ ref('greenery', 'int_orders_extended') }}

group by 1
order by 2 desc 
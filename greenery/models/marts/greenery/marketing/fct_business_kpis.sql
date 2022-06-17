{{
  config(
    materialized='table'
  )
}}




select 
count(
  case when orders_done >= 2 then user_id end ) / (count(user_id))::real as repeat_rate
  , avg(avg_order_cost) avg_order_value_per_customer
  , count(distinct user_id) total_customers
  , sum(orders_done) total_orders_so_far
from {{ ref('greenery', 'int_user_orders') }}
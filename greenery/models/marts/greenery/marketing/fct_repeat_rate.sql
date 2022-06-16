{{
  config(
    materialized='table'
  )
}}




select 
count(
  case when orders_done >= 2 then user_id end ) / (count(user_id))::real as repeat_rate
  , avg(avg_order_cost) avg_order_value_per_customer
from {{ ref('greenery', 'int_user_orders') }}
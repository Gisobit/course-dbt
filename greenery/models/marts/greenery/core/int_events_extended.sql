{{
  config(
    materialized='table'
  )
}}

select 
user_id
, count(distinct order_id) orders_done
, min(created_at) first_order_timestamp_utc
, max(created_at) last_order_timestamp_utc
, avg(order_cost) avg_order_cost
, sum(order_total) lifetime_order_amount

FROM {{ ref('greenery', 'stg_orders') }}

group by 1 
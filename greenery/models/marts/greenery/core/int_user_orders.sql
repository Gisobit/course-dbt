{{
  config(
    materialized='table'
  )
}}

with base as (
  select 
  user_id
  , count(distinct order_id) orders_done
  , min(created_at) first_order_timestamp_utc
  , max(created_at) last_order_timestamp_utc
  , avg(order_cost) avg_order_cost
  , sum(order_total) lifetime_order_amount

  FROM {{ ref('greenery', 'stg_orders') }}

  group by 1 
),

users_with_address as (
  select 
    u.user_id
  , first_name
  , last_name
  , email
  , phone_number
  , u.address_id
  , a.address
  , a.zipcode
  , a.state
  , a.country
  from {{ref('greenery','stg_users')}} u
  left join {{ref('greenery','stg_addresses')}} a on a.address_id = u.address_id
)

select b.* 
  , first_name
  , last_name
  , email
  , phone_number
  , address_id
  , address
  , zipcode
  , state
  , country

from base b
left join users_with_address u on u.user_id = b.user_id


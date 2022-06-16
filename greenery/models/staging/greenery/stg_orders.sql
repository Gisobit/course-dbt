{{
  config(
    materialized='table'
  )
}}

SELECT 
    order_id,
    user_id,
    promo_id,
    address_id,
    created_at,
    order_cost,
    shipping_cost,
    order_total,
    tracking_id,
    case when shipping_service is null then 'unknown' else shipping_service end ,
    estimated_delivery_at,
    delivered_at,
    status
   
FROM {{ source('greenery', 'orders') }}
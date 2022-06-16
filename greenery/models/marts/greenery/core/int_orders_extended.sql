{{
  config(
    materialized='table'
  )
}}

select o.*

,p.discount
,p.promo_status
,a.address
,a.zipcode
,a.state
,a.country
,u.first_name
,u.last_name
,u.email
,u.phone_number

FROM {{ ref('greenery', 'stg_orders') }} o
left join {{ ref('greenery', 'stg_promos') }}p on p.promo_id = o.promo_id
left join {{ ref('greenery', 'stg_addresses') }} a on a.address_id = o.address_id
left join {{ ref('greenery', 'stg_users') }} u on u.user_id = o.user_id
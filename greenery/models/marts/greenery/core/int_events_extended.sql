
{{
  config(
    materialized='table'
  )
}}

select 
e.*
, p.product_name


FROM {{ ref('greenery', 'stg_events') }} e
left join {{ ref('greenery', 'stg_products') }} p on p.product_id = e.product_id
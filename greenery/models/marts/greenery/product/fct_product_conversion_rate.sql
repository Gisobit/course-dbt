{{
  config(
    materialized='table'
  )
}}

with session_data as (
  select product_name, count(distinct session_id) sessions_with_page_views
  from {{ref('greenery','int_sessions_users_products_aggregated')}}
  where product_name is not null and page_view = 1 
  group by 1
)

select 
iop.product_name
,ordered_amount
,product_seen_in_x_orders --each order belongs to 1 sessionid
,ordered_amount / product_seen_in_x_orders avg_amount_sold_per_order
, product_seen_in_x_orders / sessions_with_page_views::real conversion_rate

from {{ ref('greenery', 'int_order_products') }} iop
left join session_data s on s.product_name = iop.product_name

order by 2 desc 
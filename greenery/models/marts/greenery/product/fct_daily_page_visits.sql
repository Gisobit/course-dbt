{{
  config(
    materialized='table'
  )
}}




select 
date(session_start) reportdate
,product_name
, count(distinct session_id) session_page_views
, count(distinct user_id) user_page_views

from {{ ref('greenery', 'int_sessions_users_products_aggregated') }} ee
where page_view = 1 
group by 1, 2
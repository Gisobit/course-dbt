{{
  config(
    materialized='table'
  )
}}




select 
-- date(session_start) reportdate, 
count(distinct user_id) unique_users
, count(distinct session_id) sessions
, count(distinct case when page_view = 1 then session_id end) session_page_views
, count(distinct case when add_to_cart = 1 then session_id end) session_add_to_cart
, count(distinct case when checkout = 1 then session_id end) session_checkout
, count(distinct case when package_shipped = 1 then session_id end) session_package_shipped

from {{ ref('greenery', 'int_sessions_users_aggregated') }}
-- group by 1
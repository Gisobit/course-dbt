{{
  config(
    materialized='table'
  )
}}


select 
count(distinct session_id) sessions 
, count(distinct case when order_id_in_session is not null then session_id end ) purchase_sessions 
, count(distinct case when order_id_in_session is not null then session_id end )  / count(distinct session_id)::real conversion_rate   
from {{ ref('greenery', 'int_sessions_users_aggregated') }}


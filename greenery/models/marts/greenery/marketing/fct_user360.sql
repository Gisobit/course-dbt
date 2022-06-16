{{
  config(
    materialized='table'
  )
}}



with base as (
    select 
    * 
    from {{ref('greenery','int_user_orders' )}}
),


session_stats as (
    select 
    user_id
    , count(distinct session_id) sessions
    , max(session_stop) last_seen_session
    , extract( DAY from (max(session_start) - min(session_stop))) tenure
    from 

    {{ref('greenery','int_sessions_users_aggregated')}}
    group by 1
 )



select b.* 
, s.sessions
, s.last_seen_session
, s.tenure
from base b 
left join session_stats s on s.user_id = b.user_id 
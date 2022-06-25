{{
  config(
    materialized='table'
  )
}}



with sessions_aggregated as (
  select 
  session_id 
  , user_id
  , min(created_at) session_start
  , max(created_at) session_stop
  , count(distinct product_id) products_touched
  , ARRAY_AGG(distinct product_id) products_array
  , min(order_id) order_id_in_session -- hack to get any order_id. Each session has 1 order id max anyway.


  {{ session_event_type_loop() }}

  FROM {{ ref('greenery', 'int_events_extended') }} e
  group by 1,2
)

select *
, session_stop - session_start as session_duration
, case when checkout = 0 then 1 end non_paying_session

 from sessions_aggregated
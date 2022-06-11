# Answers to Weeks 1 SQL Questions

## How many users do we have?

``` SQL 
select count(distinct user_id) from dbt_george_s.stg_users ; 
```

Answer: 130 users

## On average, how many orders do we receive per hour?

``` SQL 
with orders_per_hr as (
  select 
  date_trunc('hour',created_at) reportdate_hourly
  , count(*) orders_seen 
  from dbt_george_s.stg_orders
  group by 1)
select avg(orders_seen) from orders_per_hr ;`
```
Answer: 7.5208333333333333

## On average, how long does an order take from being placed to being delivered?
``` SQL 
with order_timestamps as (
  select 
  order_id
  , created_at
  , delivered_at
  , delivered_at - created_at AS time_to_deliver
  , EXTRACT(DAY from delivered_at - created_at) as time_to_deliver_numeric
  from dbt_george_s.stg_orders
  where delivered_at is not null
)
  select 
  avg(time_to_deliver) time_to_deliver
  , avg(time_to_deliver_numeric) time_to_deliver_numeric
  
  from order_timestamps;
```
Answer:  3 days 21:24:11.803279 or 3.8918032786885246 days

## How many users have only made one purchase? Two purchases? Three+ purchases?
### Note: you should consider a purchase to be a single order. In other words, if a user places one order for 3 products, they are considered to have made 1 purchase.

``` SQL 
with purchases_per_user as (
  select user_id
  , count(*) purchases_made
  from dbt_george_s.stg_orders 
  group by 1
)

select 
case 
  when purchases_made < 3 
  then purchases_made::varchar
  else '3+' 
end purchases_made_grouped
, count(user_id) users_with_x_purchases
from purchases_per_user
group by 1
order by 1;
``` 
Answer: 

| Purchases made |    Users with X purchases| 
| ----------- | ----------- |
|1 |  25 |
|2 |  28 |
|3+ |  71 |




## On average, how many unique sessions do we have per hour?

``` SQL 
with hourly_sessions as (
  select 
  date_trunc('hour',created_at) reportdate_hourly 
  , count(distinct session_id) sessions
  from dbt_george_s.stg_events 
  group by 1 
)

select avg(sessions) from hourly_sessions ;
```

Answer: 16.3275862068965517
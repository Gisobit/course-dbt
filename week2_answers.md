# Answers to Weeks 2 Questions

## What is our user repeat rate?

``` SQL 
select * from dbt_george_s.fct_repeat_rate; 
```

Answer: 
0.7983870967741935


## What are good indicators of a user who will likely purchase again?

Answer: 
Good indicators for another purchase would be multiple purchases, multiple page visits as well as users who add products to their shopping cart.

We can identify those users by looking at a user-level aggregation to capture all their orders. Likewise exploring "incomplete" purchases aka shopping cart without purchases can be a good indicator.


## Explain the marts models you added. Why did you organize the models in the way you did?

Answer:
The data models I've added to the data marts are motivated by the need to enrich existing records.

I'm explicitly only enriching data models when they just add columns to the observations. I want to avoid complications and keep the observations as they are.

The focus of my data models rely on:

- Enriching Orders
- Enriching Sessions
- Enriching Userdata

With those enriched intermediary tables, I go ahead and generate fct_tables which express various business questions such as (funnel, user360, popular states, business kpi's etc...)


## What assumptions are you making about each model? (i.e. why are you adding each test?)

Answer:
The tests I've used the most is to ensure that each record (for their grain) is indeed unique (when expected). If that fails, I will be notified.
On top of that, I also ask for a null statement test. If the grain is suddenly Null, I should be notified.

When I am notified, I will go ahead and clean the staging data table. E.g. suddenly a dimension has null, so I would replace it then with "unknown".

Obviously there are also freshness tests we could conduct, but for this examples we can't ensure "fresh" data hence I did not add them.


## Your stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.

I would follow the best practice of running dbt test after I've executed dbt run.
Potentially I would just use the new feature dbt build to observe this. 

On top of that, I would experiment with various flags to execute only parts of the DBT tree. The idea here is to split the "hierarchy" and add additional bell & whistles with additional orchestration software. This will result in logging/ retries/ and escalation to various other channels.

If per chance bad data does indeed go through, I would send out a slack warning to direct stakeholders, and notify them which data points are affected, with a timewindow for fixing this downtime. 

The DBT graph view will help me to identify dependencies easily, and estimate runtimes (as these should have been logged in the past).

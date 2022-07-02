# Answers to Weeks 4 Questions

## Query to answer questions:
``` SQL 
select 
session_page_views,
session_add_to_cart, 
session_checkout,

session_add_to_cart - session_page_views AS diff_view_to_cart,
session_checkout - session_add_to_cart AS diff_cart_to_checkout,

1 - (session_add_to_cart / session_page_views::float) AS pct_diff_view_to_cart,
1 - (session_checkout / session_add_to_cart::float) AS pct_diff_cart_to_checkout,

(session_add_to_cart / session_page_views::float) AS pct_add_to_cart,
(session_checkout / session_page_views::float) AS pct_checkout


from dbt_george_s.fct_website_funnel
```


## How are our users moving through the product funnel?

Overall the users move through the funnel quite successfully, 62 % conversion rate is quite high. 

## Which steps in the funnel have largest drop off points?

However, the largest drop off can be observed between page_view to add_to_cart. Here we observe an overall conversion of 80 %, translating to 111 sessions dropping off. 

To be honest, not much can be done here, users were not interested to purchase, so left.


The second highest drop with  106 sessions leaving is between add_to_cart and checkout. 

Here the product team could send reminders to users about their wares being still in the shopping cart. 


### Sessions with any event of type page_view
578
### Sessions with any event of type add_to_cart
467
### Sessions with any event of type checkout
361



## 3a) If your organization is using dbt, what are 1-2 things you might do differently / recommend to your organization based on learning from this course?

Not much, my organization moved already to DBT, and I am one of the early adopters (outside the BI-Team) to utilize this new framework.
# Answers to Weeks 3 Questions

## What is our overall conversion rate?

``` SQL 
select 
    * 
from 
    dbt_george_s.fct_conversion_rate
```

Answer: 
0.6245674740484429


## What is our conversion rate by product?

``` SQL 
select 
    '|' || product_name || '|' || ordered_amount  || '|' || conversion_rate || '|' 
from 
    dbt_george_s.fct_product_conversion_rate
order by 
    ordered_amount desc 
```

Answer: 

| product name | ordered amount | conversion rate|
| ----------- | ----------- |----------- |
|String of pearls|107|0.609375|
|Bamboo|95|0.5373134328358209|
|Arrow Head|87|0.5555555555555556|
|Orchid|86|0.4533333333333333|
|ZZ Plant|86|0.5396825396825397|
|Philodendron|86|0.4838709677419355|
|Majesty Palm|83|0.4925373134328358|
|Birds Nest Fern|80|0.4230769230769231|
|Aloe Vera|79|0.49230769230769234|
|Spider Plant|78|0.4745762711864407|
|Ponytail Palm|75|0.4|
|Snake Plant|75|0.3972602739726027|
|Rubber Plant|73|0.5185185185185185|
|Dragon Tree|73|0.46774193548387094|
|Calathea Makoyana|72|0.5094339622641509|
|Bird of Paradise|71|0.45|
|Pink Anthurium|70|0.4189189189189189|
|Fiddle Leaf Fig|69|0.5|
|Ficus|69|0.4264705882352941|
|Money Tree|67|0.4642857142857143|
|Cactus|63|0.5454545454545454|
|Jade Plant|63|0.4782608695652174|
|Pilea Peperomioides|63|0.4745762711864407|
|Boston Fern|62|0.4126984126984127|
|Devil's Ivy|62|0.4888888888888889|
|Monstera|61|0.5102040816326531|
|Pothos|55|0.3442622950819672|
|Peace Lily|53|0.4090909090909091|
|Alocasia Polly|53|0.4117647058823529|
|Angel Wings Begonia|49|0.39344262295081966|
 

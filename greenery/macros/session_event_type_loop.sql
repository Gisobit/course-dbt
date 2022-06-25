
{% macro session_event_type_loop() %}

    {% set event_types = ["page_view", "add_to_cart", "checkout","package_shipped"] %}

    {% for event_type in event_types %}
    ,count(distinct case when event_type = '{{event_type}}' then product_id end) as products_in_{{event_type}}
    ,count(distinct case when event_type = '{{event_type}}' then 1 end ) {{event_type}}
    
    {% endfor %}

{% endmacro %}
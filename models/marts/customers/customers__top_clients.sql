{{ 
    config(
        materialized='table'
        ) 
    
}}

select c.customer_id, sum(o.price) as total_price, sum(o.freight_value) as total_freight_value
    
from {{ ref('src_customers') }} as c
left join {{ ref('src_orders') }} as o on c.customer_id = o.customer_id

group by customer_id
order by total_price desc
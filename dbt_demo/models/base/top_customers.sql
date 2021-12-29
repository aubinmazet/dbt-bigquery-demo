{{ 
    config(
        materialized='view'
        ) 
    
}}

select c.customer_id, sum(i.price) as total_price, sum(i.freight_value) as total_freight_value
    
from {{ source('ecommerce', 'customers') }} as c
left join {{ source('ecommerce', 'orders') }} as o on c.customer_id = o.customer_id
left join {{ source('ecommerce', 'order_items') }} i on o.order_id = i.order_id

group by customer_id
order by total_price desc
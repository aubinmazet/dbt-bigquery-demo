{{ 
    config(
        materialized='table'
        ) 
    
}}

select  
    order_delivered_customer_date,
    order_estimated_delivery_date,
    order_purchase_timestamp,
    (o.order_delivered_customer_date - o.order_purchase_timestamp) as order_delivered_customer_days_delay,
    (o.order_estimated_delivery_date - o.order_purchase_timestamp) as order_estimated_delivery_days_delay,
    EXTRACT(YEAR FROM o.order_estimated_delivery_date) as order_purchase_year,
    EXTRACT(MONTH FROM o.order_estimated_delivery_date) as order_purchase_month,
    EXTRACT(DAY FROM o.order_estimated_delivery_date) as order_purchase_day,
    EXTRACT(DAYOFWEEK FROM o.order_estimated_delivery_date) as order_purchase_dayofweek,    
from {{ ref('ecommerce', 'src_orders') }} as o
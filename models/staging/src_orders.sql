with src_orders as (

    select 
        cast(o.order_delivered_customer_date as timestamp) as order_delivered_customer_date,
        cast(o.order_estimated_delivery_date as timestamp) as order_estimated_delivery_date,
        cast(o.order_purchase_timestamp as timestamp) as order_purchase_timestamp,
        o.customer_id,
        i.*

    from 
        {{ source('ecommerce', 'orders') }} as o 
    left join
        {{ source('ecommerce', 'order_items') }} i on o.order_id = i.order_id
)

select * from src_orders
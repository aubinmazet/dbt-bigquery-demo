select * from {{ source('ecommerce', 'order_payments') }}

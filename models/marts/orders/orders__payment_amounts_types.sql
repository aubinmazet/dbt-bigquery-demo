{{ 
    config(
        materialized='table'
        ) 
    
}}

{% set payment_types = ["boleto", "voucher", "debit_card", "credit_card"] %}

select
    order_id,
    {% for payment_type in payment_types %}
    sum(case when payment_type = '{{payment_type}}' then payment_value end) as {{payment_type}}_amount,
    {% endfor %}
    sum(payment_value) as total_amount
from{{ ref('src_payments') }}
group by 1
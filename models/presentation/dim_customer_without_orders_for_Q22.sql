with customers as (
    select * from {{ ref('dim_customer_country_region') }}
),
orders as (
    select * from {{ ref('stg_orders') }}
)

select
    customer_id,
    customer_phone,
    customer_account,
    region_name,
    country_name

from customers
where customer_id not in (select distinct orders_customer_id from orders)
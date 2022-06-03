with customers as (
    select 
        count(distinct customer_id) as total_customers
    from
        {{ ref('stg_customer')}}
),
orders as (
    select
        count(distinct orders_customer_id) as active_customers,
        count(distinct order_id) as total_orders
    from 
        {{ ref('stg_orders')}}
),
orders_shipped as (
    select  
        count(distinct lineitem_order_id) as shipped_orders
    from
        {{ ref('stg_lineitem')}}
    where 
        lineitem_ship_date is not null
),
orders_returned as (
    select  
        count(distinct lineitem_order_id) as returned_orders
    from
        {{ ref('stg_lineitem')}}
    where 
        lineitem_return_flag = 'R'
),

final as (
    select
        total_customers,
        active_customers,
        cast(active_customers as numeric) / total_customers as active_ratio,
        total_orders,
        shipped_orders,
        returned_orders,
        cast(returned_orders as numeric) / total_orders as return_ratio
    from
        customers,
        orders,
        orders_shipped,
        orders_returned
)

select * from final
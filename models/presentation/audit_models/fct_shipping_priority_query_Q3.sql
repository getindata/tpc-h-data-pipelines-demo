with customers_orders_lineitem as (
    select *
from {{ ref('fct_customer_orders_lineitem_for_Q3') }}
)

select
    order_id as l_orderkey, 
    sum(lineitem_volume) as revenue,
    order_date as o_orderdate, 
    orders_ship_priority as o_shippriority
from 
    customers_orders_lineitem
where 
    customer_market_segment like '%BUILDING%'
    and order_date < '1995-03-15'
    and lineitem_ship_date > '1995-03-15'
group by 
    order_id, 
    order_date, 
    orders_ship_priority
order by 
    revenue desc, 
    order_date
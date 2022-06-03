with orders_lineitem as (
    select 
        lineitem_ship_mode,
        lineitem_ship_date,
        lineitem_commit_date,
        lineitem_receipt_date,
        order_priority
    from 
        {{ ref('fct_customer_orders_lineitem_for_Q3') }}
),
lineitem_orders_cases as (
    select
        *,
        (case 
            when order_priority like '1-URGENT%'
                or order_priority like '2-HIGH%'
            then 1
            else 0
        end) as high_line,
        (case 
            when order_priority not like '1-URGENT%'
                and order_priority not like '2-HIGH%'
            then 1
            else 0
        end) as low_line
    from
        orders_lineitem
)

select * 
from lineitem_orders_cases
order by lineitem_ship_mode
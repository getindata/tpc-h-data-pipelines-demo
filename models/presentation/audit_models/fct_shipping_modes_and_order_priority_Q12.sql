with orders_lineitem_cases as (
    select 
        lineitem_ship_mode,
        lineitem_ship_date,
        lineitem_commit_date,
        lineitem_receipt_date,
        order_priority,
        high_line,
        low_line
    from
        {{ ref('fct_shipping_modes_and_order_priority_general_for_Q12') }}
)

select
    lineitem_ship_mode as l_shipmode, 
    sum(high_line) as high_line_count,
    sum(low_line) as low_line_count
from
    orders_lineitem_cases
where 
    (lineitem_ship_mode like 'MAIL%' or lineitem_ship_mode like 'SHIP%')
    and lineitem_commit_date < lineitem_receipt_date
    and lineitem_ship_date < lineitem_commit_date
    and lineitem_receipt_date >= date '1994-01-01'
    and lineitem_receipt_date < datetime_add(date '1994-01-01', interval '1' year)
group by 
    lineitem_ship_mode
order by 
    lineitem_ship_mode
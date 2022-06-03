with int_top_supplier as (
    select *
    from {{ ref('fct_top_supplier_general_querry_Q15') }}
)

select distinct 
    supplier_id as s_suppkey, 
    supplier_name as s_name, 
    supplier_address as s_address, 
    supplier_phone as s_phone, 
    total_revenue
from 
    int_top_supplier
where
    (shipping_date >= '1996-01-01'
    and shipping_date < DATETIME_ADD(DATETIME '1996-01-01', INTERVAL 1 quarter))
    and total_revenue = max_total_revenue
order by 
    supplier_id


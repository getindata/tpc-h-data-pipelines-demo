with 
shipping as (
    select *
    from {{ ref('fct_shipping_for_Q7') }}
)
select
    supplier_country as supp_nation, 
    customer_country as cust_nation, 
    lineitem_year as l_year, 
    sum(lineitem_volume) as revenue
from shipping
where 
    ((supplier_country LIKE 'FRANCE%' and customer_country LIKE 'GERMANY%')
    or (supplier_country LIKE 'GERMANY%' and customer_country LIKE 'FRANCE%'))
    and lineitem_ship_date between date '1995-01-01' and date '1996-12-31'
group by 
    supplier_country, 
    customer_country, 
    lineitem_year
order by 
    supplier_country, 
    customer_country, 
    lineitem_year

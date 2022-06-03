with 
supplier_country_region as (
    select *
    from {{ ref('dim_supplier_country_region') }}
),
customer_orders_lineitem as (
    select *
    from 
    {{ ref('fct_customer_orders_lineitem_for_Q3') }}
),
shipping as (
    select 
        supplier_country, 
        customer_country, 
        lineitem_year,
        lineitem_ship_date,
        lineitem_volume,
        order_id,
        lineitem_line_id
    from 
        customer_orders_lineitem as l  
        join supplier_country_region as scr on
        l.lineitem_supplier_id = scr.supplier_id
)

select * from shipping

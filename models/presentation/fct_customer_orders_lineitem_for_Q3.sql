{{
    config(
    materialized = 'incremental',
    unique_key='lineitem_row_id',
    partition_by={
      "field": "order_date",
      "data_type": "date",
      "granularity": "month"}  
    )
}}


with customer_country_region as (
    select *
    from {{ ref('dim_customer_country_region') }}
),
customer_orders as (
    select
        o.*,
        ccr.*
    from {{ ref('stg_orders') }} as o
    join customer_country_region as ccr 
    on o.orders_customer_id = ccr.customer_id
),
lineitem as (
    select 
        *
    from {{ ref('stg_lineitem') }}
),
final as (
    select
--------------------------------
        l.lineitem_row_id,
--------------------------------
-- for Q3
        co.order_id,
        lineitem_volume,
        co.order_date,
        orders_ship_priority,
        customer_market_segment,
        lineitem_ship_date,
--------------------------------
-- for_Q12
        lineitem_ship_mode,
        lineitem_commit_date,
        lineitem_receipt_date,
        order_priority,
--------------------------------
-- for_Q7
        lineitem_year,
        lineitem_supplier_id,
        co.customer_country,
        lineitem_line_id

    from lineitem as l
    join customer_orders as co
    on l.lineitem_order_id = co.order_id 
)

select * from final 

{% if is_incremental() %}

-- this filter will only be applied on an incremental run
where lineitem_row_id > (select max(lineitem_row_id) from {{ this }})

{% endif %}

--order by lineitem_row_id

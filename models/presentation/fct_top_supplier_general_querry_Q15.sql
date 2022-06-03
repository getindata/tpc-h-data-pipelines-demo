{{
    config(
    materialized = 'incremental',
    unique_key='lineitem_row_id'
    )
}}


with supplier_details as (
    select *
    from {{ ref('dim_supplier_country_region') }}
),
lineitem as (
    select 
        *,
        sum(lineitem_volume) over (partition by lineitem_supplier_id, l_ship_date_quart) as total_revenue,
    from {{ ref('stg_lineitem') }}
),
max_total_revenue_and_supplier as (
    select
        sd.supplier_id, 
        sd.supplier_name, 
        sd.supplier_address, 
        sd.supplier_phone, 
        l.lineitem_row_id,
        l.l_ship_date_quart as shipping_date,
        l.total_revenue,
        max(l.total_revenue) over (partition by l.l_ship_date_quart) as max_total_revenue
    from lineitem as l 
    join supplier_details as sd
    on l.lineitem_supplier_id = sd.supplier_id
)

select * from max_total_revenue_and_supplier


{% if is_incremental() %}

-- this filter will only be applied on an incremental run
where lineitem_row_id > (select max(lineitem_row_id) from {{ this }})

{% endif %}
{{
  config(
    materialized = 'incremental',
    unique_key = 'lineitem_row_id',
    )
}}

with source as (

    select distinct * from {{ source('tpch', 'lineitem') }} -- the source lineitem table has 13 dupliates, these are filtered here by distinct clause

),
renamed as (

    select
        row_number() over () as lineitem_row_id,  -- lineitem_row_id has been added to act as the unique_key for incremental materialization
        l_orderkey as lineitem_order_id,
        l_partkey as lineitem_part_id,
        l_suppkey as lineitem_supplier_id,
        l_linenumber as lineitem_line_id,
        l_quantity as lineitem_quantity,
        l_extendedprice as lineitem_extended_price,
        l_discount as lineitem_discount,
        l_tax as lineitem_tax,
        l_returnflag as lineitem_return_flag,
        l_linestatus as lineitem_line_status,
        l_shipdate as lineitem_ship_date,
        date_trunc(l_shipdate, quarter) as l_ship_date_quart,
        l_commitdate as lineitem_commit_date,
        l_receiptdate as lineitem_receipt_date,
        l_shipinstruct as lineitem_shipinstruct,
        trim(l_shipmode) as lineitem_ship_mode,
        l_comment as lineitem_comment,
        extract(year from l_shipdate) as lineitem_year,
        l_extendedprice * (1 - l_discount) as lineitem_volume

    from source

)

select * from renamed

{% if is_incremental() %}

-- this filter will only be applied on an incremental run
where lineitem_row_id > (select max(lineitem_row_id) from {{ this }})

{% endif %}

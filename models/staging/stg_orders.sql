with source as (

    select * from {{ source('tpch', 'orders') }}

),

renamed as (

    select
        o_orderkey as order_id,
        o_custkey as orders_customer_id,
        o_orderstatus as order_status,
        o_totalprice as orders_total_price,
        o_orderdate as order_date,
        trim(o_orderpriority) as order_priority,
        o_clerk as orders_clerk,
        o_shippriority as orders_ship_priority,
        o_comment as orders_comment

    from source

)

select * from renamed

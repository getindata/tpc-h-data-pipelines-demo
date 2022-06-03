with source as (

    select * from {{ source('tpch', 'customer') }}

),

renamed as (

    select
        c_custkey as customer_id,
        c_name as customer_name,
        c_address as customer_address,
        c_nationkey as customer_country_id,
        c_phone as customer_phone,
        c_acctbal as customer_account,
        trim(c_mktsegment) as customer_market_segment,
        c_comment as customer_comment

    from source

)

select * from renamed

with source as (

    select * from {{ source('tpch', 'supplier') }}

),

renamed as (

    select
        s_suppkey as supplier_id,
        s_name as supplier_name,
        s_address as supplier_address,
        s_nationkey as supplier_country_id,
        s_phone as supplier_phone,
        s_acctbal as supplier_account_balance,
        s_comment as supplier_comment

    from source

)

select * from renamed

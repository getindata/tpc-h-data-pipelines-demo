with source as (

    select * from {{ source('tpch', 'part') }}

),

renamed as (

    select
        p_partkey as part_id,
        p_name as part_name,
        p_mfgr as part_manufacturer,
        p_brand as part_brand,
        p_type as part_type,
        p_size as part_size,
        p_container as part_container,
        p_retailprice as part_retailprice,
        p_comment as part_comment

    from source

)

select * from renamed

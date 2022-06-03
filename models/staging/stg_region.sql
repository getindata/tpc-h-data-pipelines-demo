with source as (

    select * from {{ source('tpch', 'region') }}

),

renamed as (

    select
        r_regionkey as region_id,
        trim(r_name) as region_name,
        r_comment as region_comment

    from source

)

select * from renamed

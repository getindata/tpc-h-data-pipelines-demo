with source as (

    select * from {{ source('tpch', 'nation') }}

),

renamed as (

    select
        n_nationkey as country_id,
        trim(n_name) as country_name,
        n_regionkey as country_region_id,
        n_comment as country_comment

    from source

)

select * from renamed

with source as (

    select * from {{ source('tpch', 'partsupp') }}

),

renamed as (

    select
        row_number() over () as partsupp_row_id,
        ps_partkey as partsupp_part_id,
        ps_suppkey as partsupp_supply_id,
        ps_availqty as partsupp_available_quantity,
        ps_supplycost as partsupp_supply_cost,
        ps_comment as partsupp_comment

    from source

)

select * from renamed

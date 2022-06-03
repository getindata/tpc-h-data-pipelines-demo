with 
partsupp as (
    select *
    from {{ ref('stg_partsupp') }}
),
part as (
    select *
    from {{ ref('stg_part') }}
),

partsupp_part as (
    select
        ps.*,
        p.*
    from partsupp as ps
    join part as p on
    ps.partsupp_part_id = p.part_id
)

select * from partsupp_part
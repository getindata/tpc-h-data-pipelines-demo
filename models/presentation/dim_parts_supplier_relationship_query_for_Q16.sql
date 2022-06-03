with supplier_with_complaints as (
    select supplier_id
    from {{ ref('stg_supplier') }}
    where supplier_comment like '%Customer%Complaints%'
),

partsupp_part as (
    select
        partsupp_supply_id,
        part_brand,
        part_type,
        part_size
    from
        {{ ref('dim_partsupp_part') }}
),

suppliers_without_complaints_extended as (
    select
        part_brand,
        part_type,
        part_size,
        count(distinct partsupp_supply_id) as supplier_cnt
    from
        partsupp_part
    where
        partsupp_supply_id not in (
            select supplier_id
            from supplier_with_complaints)
    group by
        part_brand,
        part_type,
        part_size
    order by
        supplier_cnt desc,
        part_brand,
        part_type,
        part_size
)

select * from suppliers_without_complaints_extended
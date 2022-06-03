with supplier_not_complaining_parts_partsupp as (
    select *
    from {{ ref('dim_parts_supplier_relationship_query_for_Q16') }}
)

select
    part_brand as p_brand,
    part_type as p_type,
    part_size as p_size,
    supplier_cnt
from
    supplier_not_complaining_parts_partsupp
where
    part_brand <> 'Brand#45'
    and part_type not like 'MEDIUM POLISHED%'
    and part_size in (49, 14, 23, 45, 19, 3, 36, 9)
order by
    supplier_cnt desc,
    part_brand,
    part_type,
    part_size
with supplier_partsupp_nation_cutoff as (
    select
        partsupp_part_id,
        country_name,
        0.0001 * discrete_value as value_cutoff
    from
        {{ ref('dim_supplier_partsupp_nation') }}
    where
        country_name like 'GERMANY%'
),

important_stock_identification as (
    select
        *
    from
        {{ ref('dim_important_stock_identification_for_Q11') }}
    where
    country_name like 'GERMANY%'
)

select
    partsupp_part_id as ps_partkey,
    country_name,
    value
from
    important_stock_identification
where
    value > (
        select
            sum(value_cutoff)
        from
            supplier_partsupp_nation_cutoff
)

order by
value desc
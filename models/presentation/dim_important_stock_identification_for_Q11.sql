with nation_aggregated as (
    select distinct
        partsupp_part_id,
        country_name,
        discrete_value,
        sum(discrete_value) over (partition by partsupp_part_id, country_name) as value
    from
        {{ ref('dim_supplier_partsupp_nation') }}
)

select
    *
from
    nation_aggregated
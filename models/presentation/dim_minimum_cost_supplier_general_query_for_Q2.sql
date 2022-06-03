with
supplier_country_region as (
    select *
    from {{ ref('dim_supplier_country_region') }}
),
partsupp_part as (
    select *
    from {{ ref('dim_partsupp_part') }}
),
final as (
select
    psp.*,
    scr.*,
    min(psp.partsupp_supply_cost) over (partition by psp.part_id, scr.region_name, psp.part_size) as min_supp_cost
from
    partsupp_part as psp
    join supplier_country_region as scr on
    scr.supplier_id = psp.partsupp_supply_id
)

select
    supplier_account_balance,
    supplier_name,
    country_name,
    part_id,
    part_manufacturer,
    supplier_address,
    supplier_phone,
    supplier_comment,
    min_supp_cost,
    part_size,
    part_type,
    region_name,
    partsupp_supply_cost
from final
where
    partsupp_supply_cost = min_supp_cost
order by
    supplier_account_balance desc,
    country_name,
    supplier_name,
    part_id

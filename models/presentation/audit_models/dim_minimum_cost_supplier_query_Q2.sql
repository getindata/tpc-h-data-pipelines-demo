{{ config(materialized='table') }}

with
int_min_cost_supplier_Q2 as (
    select *
    from {{ ref('dim_minimum_cost_supplier_general_query_for_Q2') }}
)

select
    supplier_account_balance as s_acctbal,
    supplier_name as s_name,
    country_name as n_name,
    part_id as p_partkey,
    part_manufacturer as p_mfgr,
    supplier_address as s_address,
    supplier_phone as s_phone,
    supplier_comment s_comment,
from
    int_min_cost_supplier_Q2
where
    part_size = 15
    and part_type like '%BRASS'
    and region_name = 'EUROPE'
    and partsupp_supply_cost = min_supp_cost
order by
    supplier_account_balance desc,
    country_name,
    supplier_name,
    part_id

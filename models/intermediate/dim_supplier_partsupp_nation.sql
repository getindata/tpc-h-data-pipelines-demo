with partsupp as (
    select 
        partsupp_part_id,
        partsupp_supply_id,
        partsupp_supply_cost * partsupp_available_quantity as discrete_value
    from
        {{ ref('stg_partsupp') }}
),

supplier as (
    select
        supplier_id,
        supplier_country_id
    from
        {{ ref('stg_supplier') }}
),

nation as (
    select  
        country_name,
        country_id
    from
        {{ ref('stg_nation') }}
),

supplier_partsupp_nation as (

    select 
        partsupp_part_id,
        discrete_value,
        country_name
    from 
        partsupp,
        supplier,
        nation
    where 
        partsupp_supply_id = supplier_id
        and supplier_country_id = country_id
)

select * from supplier_partsupp_nation
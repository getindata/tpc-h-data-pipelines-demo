with 
country_regions as (
    select *
    from {{ ref('dim_country_region') }}
),
supplier as (
    select *
    from {{ ref('stg_supplier') }}
),
supplier_country_region as (
    select
        s.*,
        cr.*,
        cr.country_name as supplier_country
    from supplier as s 
    join country_regions as cr on
    s.supplier_country_id = cr.country_id
)

select * from supplier_country_region
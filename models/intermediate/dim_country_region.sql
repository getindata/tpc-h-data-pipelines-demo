with
nation as (
    select * from {{ ref('stg_nation') }}
),
region as (
    select * from {{ ref('stg_region') }}
),
nation_region as (
    select 
        r.*,
        n.country_id,
        n.country_name,
        n.country_comment
    from
        nation as n 
        join region as r on
        n.country_region_id = r.region_id      
)

select * from nation_region
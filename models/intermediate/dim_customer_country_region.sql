with 
country_regions as (
    select *
    from {{ ref('dim_country_region') }}
),
customer as (
    select *
    from {{ ref('stg_customer') }}
),
customer_country_region as (
    select
        c.*,
        cr.*,
        cr.country_name as customer_country
    from customer as c 
    join country_regions as cr on
    c.customer_country_id = cr.country_id
)

select * from customer_country_region
{% test country_phone_code_check(model, column_name) %}

-- It is usefull when the tested table has both cutomer country name and customer phone number columns

with 
customer_phone_numbers as (
    select 
        cast(substring({{ column_name }}, 1, 2) as int64) as sub_phone,
        country_name as customer_country
    from {{ model }}

),
phone_table as (
    select *
    from {{ ref('Country_PhoneCodes') }}
),
check_phones as (
    select 
        cast(c.sub_phone as int64) as sub_phone,
        c.customer_country,
        p.country
    from 
        customer_phone_numbers as c
        join phone_table as p
        on c.sub_phone = p.phone_code
    where 
        c.customer_country <> p.country
)

select * from check_phones

{% endtest %}



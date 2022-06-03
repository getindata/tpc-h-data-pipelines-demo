{% test ISO_country_name_check(model, column_name) %}

    select *
    from {{ model }} 
    where lower({{ column_name }}) not in 
    (
        select lower(name) from {{ ref('ISO_countries_with_additions') }}
    )

{% endtest %}
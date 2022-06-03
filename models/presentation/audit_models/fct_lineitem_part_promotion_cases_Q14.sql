with lineitem_part_promotion_cases as (
    select 
        *
    from 
    {{ ref('fct_lineitem_part_promotion_cases_for_Q14') }}
),
final_sum as (
    select
        100 * sum(is_promo)/sum(lineitem_volume) as promo_revenue
    from 
        lineitem_part_promotion_cases
    where 
        lineitem_ship_date >= date '1995-09-01'
        and lineitem_ship_date < date '1995-09-01' + interval '1' month
)
select * from final_sum

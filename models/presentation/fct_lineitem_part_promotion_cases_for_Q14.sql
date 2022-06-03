{{
    config(
    materialized = 'incremental',
    unique_key='lineitem_row_id'
    )
}}


with lineitem_part as (
    select 
        *
    from 
    {{ ref('fct_lineitem_part') }}
),

lineitem_part_promotion_cases as (
select
    *,
    (case 
        when part_type like 'PROMO%'
        then lineitem_volume
        else 0
    end) as is_promo
from 
    lineitem_part
)
select 
lineitem_row_id,
part_type,
lineitem_volume,
is_promo,
lineitem_ship_date

from lineitem_part_promotion_cases

{% if is_incremental() %}

-- this filter will only be applied on an incremental run
where lineitem_row_id > (select max(lineitem_row_id) from {{ this }})

{% endif %}
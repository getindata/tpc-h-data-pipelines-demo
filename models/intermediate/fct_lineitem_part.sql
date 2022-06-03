with part as (
    select * 
    from {{ ref('stg_part') }}
),
lineitem as (
    select *
    from {{ ref('stg_lineitem') }}
),

lineitem_part as (
    select
        p.*,
        l.*,
    from
        lineitem as l 
        join part as p
        on l.lineitem_part_id = p.part_id 
)

select * from lineitem_part

{% if is_incremental() %}

-- this filter will only be applied on an incremental run
where lineitem_row_id > (select max(lineitem_row_id) from {{ this }})

{% endif %}
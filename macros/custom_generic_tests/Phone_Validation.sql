{% test is_phone_number_valid(model, column_name) %}

with 
phone_number_split as (
    select 
        split({{ column_name}}, '-') as splitted_phone
    from {{ model }}

),
investigate_split as (
    select 
        ARRAY_LENGTH(splitted_phone) as total_length,
        cast(splitted_phone[ordinal(1)] as string) as first_code,
        cast(splitted_phone[ordinal(2)] as string) as second_code,
        cast(splitted_phone[ordinal(3)] as string) as third_code,
        cast(splitted_phone[ordinal(4)] as string) as fourth_code
    from
        phone_number_split
),

final_check as (
    select 
        total_length,
        first_code,
        second_code,
        third_code,
        fourth_code
    from 
        investigate_split
    where
        total_length != 4
        or length(first_code) != 2 or safe_cast(first_code as int64) is null
        or length(second_code) != 3 or safe_cast(second_code as int64) is null
        or length(third_code) != 3 or safe_cast(third_code as int64) is null
        or length(fourth_code) != 4 or safe_cast(fourth_code as int64) is null
)

select * from final_check

{% endtest %}



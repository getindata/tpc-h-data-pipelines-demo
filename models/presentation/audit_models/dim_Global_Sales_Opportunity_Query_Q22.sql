with customers_without_orders as (
    select * from
    {{ ref('dim_customer_without_orders_for_Q22') }}
),

average as (
    select
        avg(customer_account) as avg
    from
        {{ ref('stg_customer') }}
    where
        customer_account > 0.00
        and substring (customer_phone, 1, 2) in
        ('13','31','23','29','30','18','17')
),
custsale as (
    select
        substring(customer_phone, 1, 2) as cntrycode,
        customer_account
    from
        customers_without_orders
    where
        substring(customer_phone, 1, 2) in
        ('13','31','23','29','30','18','17')
        and customer_account > (select avg from average)
)

select
    cntrycode,
    count(*) as numcust,
    sum(customer_account) as totacctbal

from custsale
group by
    cntrycode
order by
    cntrycode
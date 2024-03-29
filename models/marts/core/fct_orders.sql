with orders as (
        select * from {{ ref('stg_orders' )}}
    ),

    payments as (
        select * from {{ ref('stg_payments') }}
    ),

    order_payments as (
    select
        order_id,
        sum(case when status = 'success' then amount end) as amount

    from payments
    group by 1
    ),

    fact_orders as (

        select 
            orders.order_id
            , orders.customer_id            
            , orders.order_date,
            coalesce(order_payments.amount, 0) as amount
            from orders orders
            left join order_payments order_payments on orders.order_id = order_payments.order_id
    )

    select * from fact_orders
with monthly_revenue_orders as (
    select
        TO_CHAR(order_date, 'YY-MM') as month,
    count(DISTINCT order_id) as total_order,
    sum(total_price) as total_revenue
    from"d9snqvovhsjpqs"."public"."stg_sales"
    group by month
)

select
    month,
    total_order,
    total_revenue
from monthly_revenue_orders
order by month
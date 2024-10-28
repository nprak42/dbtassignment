with customer_order_frequency as (
    select
        customer_id,
        count(distinct order_id) as total_orders,
        min(order_date) as first_order,
        max(order_date) as last_order,
        (Max(order_date) - Min(order_date)) as total_days_intervals,
        count(distinct order_date) -1 as order_intervals
    from "d9snqvovhsjpqs"."public"."stg_sales"
    group by customer_id
)

Select
    customer_id,
    total_orders,
    first_order,
    last_order,
    case
        when order_intervals > 0 then
        total_days_intervals::FLOAT / order_intervals::FLOAT
        else NULL
    end as avg_days_between_orders
from customer_order_frequency
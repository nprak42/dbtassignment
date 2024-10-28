WITH category_sales AS (
    SELECT
        p.category,
        sum(s.quantity) AS total_sales,
        SUM(s.total_price) AS total_revenue,
        AVG(p.price) AS avg_price
    FROM {{ ref('stg_sales') }} s
    join {{ ref('stg_products') }} p
        on s.product_id= p.product_id
    GROUP BY p.category
)

SELECT
    category,
    total_sales,
    total_revenue,
    avg_price
from category_sales
order by total_revenue desc
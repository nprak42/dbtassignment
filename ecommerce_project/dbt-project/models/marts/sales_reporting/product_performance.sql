SELECT
    product_id,
    COUNT(order_id) AS total_sales,
    SUM(total_price) AS revenue
FROM {{ ref('stg_sales') }}
GROUP BY product_id
ORDER BY revenue DESC

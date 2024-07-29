{{ config(materialized = 'table') }}

SELECT
    date_date,
    COUNT(orders_id) AS nb_transactions,
    SUM(order_revenue) AS revenue,
    ROUND(COUNT(orders_id)/SUM(order_revenue),2) AS avg_basket,
    SUM(order_margin) AS daily_margin,
    SUM(operational_margin) AS daily_operational_margin
FROM {{ref("int_orders_operational") }}
GROUP BY
    date_date
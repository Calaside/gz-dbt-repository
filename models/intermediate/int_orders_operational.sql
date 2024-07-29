SELECT
    date_date,
    orders_id,
    order_qty,
    order_purchase_cost,
    order_revenue,
    order_margin,
    ship_cost,
    shipping_fee,
    log_cost,
    ROUND((order_margin - ship_cost - log_cost + shipping_fee)) AS operational_margin,
FROM {{ref("int_ship_sales_margin") }}
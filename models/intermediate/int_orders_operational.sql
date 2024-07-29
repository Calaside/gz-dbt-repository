SELECT
    orders_id,
    order_quantity,
    order_purchase_cost,
    order_revenue,
    order_margin,
    order_ship_cost,
    shipping_fee,
    logcost,
    ROUND((order_margin - order_ship_cost - logcost + shipping_fee)) AS operational_margin,
FROM {{ref("int_ship_sales_margin") }}
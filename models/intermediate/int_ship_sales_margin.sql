with

    joined as 
    (SELECT 
        orders_id,
        SUM(quantity) AS order_qty,
        SUM(purchase_cost) AS order_purchase_cost,
        SUM(revenue) AS order_revenue,
        SUM(margin) AS order_margin
    FROM {{ref("int_sales_margin") }}
    JOIN {{ ref("ship") }}
    USING (orders_id)
    GROUP BY orders_id),

    transformed as 
    (select 
        orders_id,
        order_quantity,
        order_purchase_cost,
        order_revenue,
        order_margin,
        CAST(ship_cost as FLOAT64) AS order_ship_cost,
        shipping_fee,
        logcost
    from joined)

select *
from transformed
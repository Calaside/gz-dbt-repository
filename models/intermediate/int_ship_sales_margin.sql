with

    joined as 
    (SELECT
        date_date,
        orders_id,
        SUM(quantity) AS order_qty,
        SUM(purchase_cost) AS order_purchase_cost,
        SUM(revenue) AS order_revenue,
        SUM(margin) AS order_margin,
        SUM(ship_cost) AS ship_cost,
        SUM(shipping_fee) AS shipping_fee,
        SUM(log_cost) AS log_cost
    FROM {{ref("int_sales_margin") }}
    JOIN {{ ref("ship") }}
    USING (orders_id)
    GROUP BY 
        date_date,
        orders_id),

    transformed as 
    (select
        date_date, 
        orders_id,
        order_qty,
        order_purchase_cost,
        order_revenue,
        order_margin,
        ship_cost,
        shipping_fee,
        log_cost
    from joined)

select *
from transformed
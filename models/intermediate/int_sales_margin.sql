with

    joined as 
    (SELECT 
        * 
    FROM {{ref("sales") }}
    JOIN {{ ref("product") }}
    USING (products_id)),

    transformed as 
    (select 
        date_date,
        orders_id,
        products_id,
        quantity,
        ROUND(quantity*purchase_price,2) AS purchase_cost,
        revenue,
        ROUND(revenue - (quantity*purchase_price),2) AS margin
    from joined)

select *
from transformed
with

    joined as 
    (SELECT 
        * 
    FROM {{ref("finance_days") }}
    JOIN {{ ref("int_campaigns_days") }}
    USING (date_date)),

    transformed as 
    (select 
        date_date,
        orders_id,
        products_id,
        quantity,
        purchase_cost,
        revenue,
        margin,
        daily_sources,
        daily_campaign,
        daily_costs,
        ROUND(margin - daily_costs, 2) AS net_margin
    from joined)

select *
from transformed
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
        nb_transactions,
        avg_basket,
        daily_operational_margin,
        daily_margin,
        daily_sources,
        daily_campaign,
        daily_costs,
        ROUND(daily_margin - daily_costs, 2) AS net_margin
    from joined)

select *
from transformed
with

    joined as 
    (SELECT
        date_date,
        COUNT(paid_sources) AS daily_sources,
        COUNT(campaign_key) AS daily_campaign,
        ROUND(SUM(ads_cost), 2) AS daily_costs,
        ROUND(SUM(impression), 2) AS daily_impression,
        ROUND(SUM(click), 2) AS daily_click
    FROM {{ref("int_campaigns") }}
    USING (orders_id)
    GROUP BY 
        date_date,)

    transformed as 
    (select
        *
    from joined)

select *
from transformed
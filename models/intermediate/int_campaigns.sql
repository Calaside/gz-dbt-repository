with

    joined as 
    (SELECT 
        * 
    FROM {{ref("adwords") }}
    UNION ALL
    SELECT
    * 
    FROM {{ ref("criteo") }}
    UNION ALL
    SELECT
    * 
    FROM {{ ref("facebook") }}
    UNION ALL
    SELECT
    * 
    FROM {{ ref("bing") }})
    
select *
from transformed
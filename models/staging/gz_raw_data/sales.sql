{{ config(materialized = 'view') }}

with
    source as (select * from {{ source("gz_raw_data", "raw_gz_sales") }}),

    renamed as (
        select 
            date_date, 
            orders_id,
            CONCAT(orders_id,"_",pdt_id) as key,
            pdt_id as products_id, 
            revenue, 
            quantity
        from source
    )

select *
from renamed

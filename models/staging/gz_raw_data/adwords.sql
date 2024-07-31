with 

source as (

    select * from {{ source('gz_raw_data', "raw_gz_adwords") }}

),

renamed as (

    select
        date_date,
        campaign_key,
        paid_source,
        click,
        impression,
        CAST (ads_cost AS FLOAT64) as ads_cost
    from source

)

select * from renamed

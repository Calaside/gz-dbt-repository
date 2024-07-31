with 

source as (

    select * from {{ source('gz_raw_data', "raw_gz_bing") }}

),

renamed as (

    select
        products_id,
        CAST (ads_cost AS FLOAT64) as ads_cost
    from source

)

select * from renamed

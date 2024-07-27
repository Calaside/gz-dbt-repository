with 

source as (

    select * from {{ source('gz_raw_data', 'raw_gz_ship') }}

),

renamed as (

    select
       orders_id,
       shipping_fee,
       logCost,
       Ship_cost
    from source

)

select * from renamed
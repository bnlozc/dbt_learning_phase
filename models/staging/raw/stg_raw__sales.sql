with 
source as (
    select * from {{ source('raw', 'sales') }}
),
renamed as (
    select
        date_date,
        orders_id,
        pdt_id AS product_id,
        cast(revenue as float64) as revenue,
        cast(quantity as int64) as quantity
    from source
)
select * from renamed
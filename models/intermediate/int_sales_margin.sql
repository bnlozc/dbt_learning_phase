select
    sales.product_id,
    sales.date_date,
    sales.orders_id,
    sales.revenue,
    sales.quantity,
    product.purchase_price,
    round(sales.quantity*product.purchase_price,2) as purchase_cost,
    round(sales.revenue-sales.quantity*product.purchase_price,2) as margin
from {{ref("stg_raw__sales")}} sales
left join {{ref("stg_raw__product")}} product 
on sales.product_id=product.products_id
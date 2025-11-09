with orders_per_day as(
    select
        date_date
        ,count(distinct orders_id) as nb_transactions
        ,round(sum(revenue),0) as revenue
        ,round(sum,(margin),0) as margin
        ,ROUND(SUM(operational_margin),0) AS operational_margin
        ,ROUND(SUM(purchase_cost),0) AS purchase_cost
        ,ROUND(SUM(shipping_fee),0) AS shipping_fee
        ,ROUND(SUM(logcost),0) AS log_cost
        ,ROUND(SUM(ship_cost),0) AS ship_cost
        ,SUM(quantity) AS quantity
    from {{ref("int_orders_operational")}}
    group by date_date
)
select
date_date
,revenue
,margin
,operational_cost
,purchase_cost
shipping_fee
,log_cost
,ship_cost
,quantity
, ROUND(revenue/NULLIF(nb_transactions, 0), 2) AS average_basket
from orders_per_day
order by date_date desc
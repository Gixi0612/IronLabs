select order_id, price
from order_items
order by price asc;
select distinct(order_id), price, shipping_limit_date from order_items
where shipping_limit_date = (select max(shipping_limit_date) from order_items)
or shipping_limit_date = (select min(shipping_limit_date) from order_items);
SELECT * FROM customers;
select distinct count(customer_id), customer_state, customer_city
from customers
group by customer_city
order by count(customer_id) desc;
select * from closed_deals;
select distinct business_segment
from closed_deals
where business_segment is not null;
select distinct business_segment, sum(declared_monthly_revenue)
from closed_deals
group by business_segment
order by sum(declared_monthly_revenue) desc
limit 3;
select * from order_reviews;
select review_score, count(review_score) as frequency
from order_reviews
group by review_score
order by couappleapplent(review_score) desc;
select * from order_reviews;
SELECT distinct count(review_score), review_score
from order_reviews;



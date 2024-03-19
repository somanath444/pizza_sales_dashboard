use pizza;
select * from pizza_sales;

select count(order_id) from pizza_sales;

select floor(sum(total_price)) as sum_price from pizza_sales;

select * from pizza_sales;

select avg(total_price) as average_price from pizza_sales;

select sum(total_price)/count(distinct(order_id)) as average_price from pizza_sales;



select * from pizza_sales;
select sum(quantity) as total_quantity_sold from pizza_sales;


select * from pizza_sales;

select count(distinct(order_id)) as count_of_orders from pizza_sales;

select * from pizza_sales;

select round(sum(quantity)/count(distinct(order_id))) as average_pizzaorders from pizza_sales;

select * from pizza_sales;
SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y'));

describe pizza_sales;

select * from pizza_sales;
update pizza_sales
set order_date = str_to_date(order_date,'%d-%m-%Y');

describe pizza_sales;

select dayname(order_date,'%d-%m-%y') from pizza_sales;

select * from pizza_sales;
describe pizza_sales;


select dayname(str_to_date(order_date,'%Y-%m-%d')) as day_name,count(distinct(order_id)) as total_orders from pizza_sales 
group by day_name;

select * from pizza_sales;

select monthname(str_to_date(order_date,'%Y-%m-%d')) as month_name, count(distinct(order_id)) as total_orders from pizza_sales
group by month_name
order by total_orders desc;

-- percentage of sales by pizza category

select * from pizza_sales;
select pizza_category,sum(total_price)/count(total_price)*100 as percentage_of_sales from pizza_sales
group by pizza_category;


select pizza_category,sum(total_price)/(select sum(total_price) from pizza_sales)
as percentage_of_sales from pizza_sales
group by pizza_category;

select * from pizza_sales;



select pizza_category,(sum(total_price)*100/count(total_price)) as percentage_of_sales from pizza_sales
group by pizza_category;


select pizza_category,count(total_price)/sum(total_price)*100 as percentage_of_sales from pizza_sales
group by pizza_category;


select pizza_category, sum(total_price)/(select sum(total_price) from pizza_sales)*100  as percentage_of_sales from pizza_sales
group by pizza_category;


-- percentage of sales by pizza size

select pizza_size,round(sum(total_price)/(select sum(total_price) from pizza_sales)*100,2) as percentage_of_sales from pizza_sales
group by pizza_size
order by percentage_of_sales desc;

--  Total pizzas sold by pizza category
select pizza_category,count(quantity) as total_sold
from pizza_sales
group by pizza_category;

-- 6. Top 5 best sellers by revenue, total quantity, and total orders

select * from pizza_sales;

select pizza_name,sum(total_price) as revenue, sum(quantity) as total_quantity, count(order_id)as total_orders from pizza_sales
group by pizza_name
order by revenue desc,
total_quantity asc,
total_orders asc
limit 5;

use pizza;
-- 7. Bottom 5 best sellers by revenue, total quantity, and total orders.

select * from pizza_sales;
select pizza_name, sum(total_price) as revenue, sum(quantity) as total_quantity, count(order_id) as total_orders from pizza_sales
group by pizza_name
order by revenue asc,
total_quantity asc,
total_orders asc
limit 5;
use pizza;




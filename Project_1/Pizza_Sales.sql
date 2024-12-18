create database PizzaHub;
-- RETERIVE THE TOTAL NUMBER OF ORDERS PLACED
select count(order_id) as total_orders from order_details;

-- Calculate the total revenue generated from pizza sales. 
select
round(sum(order_details.quantity * pizzas.price),2) as total_sales
from order_details join pizzas
on pizzas.pizza_id = order_details.pizza_id;

-- Identify the highest-priced pizza.
select pizza_types.name, pizzas.price
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc limit 1;

-- Identify the most common pizza size ordered.
select pizzas.size, count(order_details.order_details_id) as order_count
from pizzas join order_details on pizzas.pizza_id = order_details.pizza_id
group by pizzas.size
order by order_count desc;

-- List the top 5 most ordered pizza types along with their quantities.
select pizza_types.name, sum(order_details.quantity) quantity
from pizza_types
join pizzas 
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name
order by quantity desc
limit 5;
 
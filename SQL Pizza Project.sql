create database pizzadominos;
--Question 1 - Retrieve the total number of orders placed?--
select * from dbo.orders
select count(order_id) as total_orders from dbo.orders

--ANS 1- The total number of orders are 21350.--

--Question 2 - Calculate the total revenue generated from pizza sales?
select * from dbo.pizzas
select* from dbo.order_details
select count(price) as total_sale_of_pizza from dbo.pizzas
select sum(dbo.order_details.quantity * dbo.pizzas.price) as total_revenue
from dbo.order_details join dbo.pizzas
on dbo.pizzas.pizza_id = dbo.order_details.pizza_id

--ANS 2 - Total revenue for pizza sale is 817860.050838447.

-- Question 3 -- Identify the highest-priced pizza?

select * from dbo.pizzas
select max(price) as Highest_priced_pizza from dbo.pizzas 
select * from dbo.pizza_types
select dbo.pizza_types.name, dbo.pizzas.price
from dbo.pizza_types join dbo.pizzas
on dbo.pizza_types.pizza_type_id = dbo.pizzas.pizza_type_id
order by dbo.pizzas.price desc 

--ANS 3 - The highest priced pizza is The Greek Pizza which costs 35.95000

--Question 4 - Identify the most common pizza size ordered?

select * from dbo.pizzas
select * from dbo.order_details
select dbo.pizzas.size, count(dbo.order_details.order_details_id) as most_common_Size_ordered
from dbo.pizzas join dbo.order_details
on dbo.pizzas.pizza_id = dbo.order_details.pizza_id
group by dbo.pizzas.size

--ANS - The most common pizza size orderd is Large.

-- Question 5 - List the top 5 most ordered pizza types along with their quantities?

select * from dbo.pizza_types
select * from dbo.pizzas
select * from dbo.order_details

select top 5 dbo.pizza_types.name, sum(dbo.order_details.quantity) as quantity
from dbo.pizza_types join dbo.pizzas
on dbo.pizza_types.pizza_type_id = dbo.pizzas.pizza_type_id
join dbo.order_details
on dbo.order_details.pizza_id = dbo.pizzas.pizza_id
group by dbo.pizza_types.name order by quantity desc 

-- ANS - The Top 5 most ordered pizza are The classic deluxe pizza followed by Barbecue chicken pizza,
--       hawaiian pizza,pepperoni pizza and thai chicken pizza with the highest quantity of 2453.
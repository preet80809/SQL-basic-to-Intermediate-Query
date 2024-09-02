-- Question 11 - Calculate the percentage contribution of each pizza type to total revenue?
select * from dbo.pizza_types
select dbo.pizza_types.category,
sum(dbo.order_details.quantity*dbo.pizzas.price)/ (select round(sum(dbo.order_details.quantity*dbo.pizzas.price),2) as total_sales
from dbo.order_details
join dbo.pizzas on dbo.order_details.pizza_id = dbo.pizzas.pizza_id)*100 as revenue
from dbo.pizza_types join dbo.pizzas
on dbo.pizza_types.pizza_type_id = dbo.pizzas.pizza_type_id
join dbo.order_details
on dbo.order_details.pizza_id = dbo.pizzas.pizza_id
group by dbo.pizza_types.category order by revenue desc

-- ANS - The highest percentage contribution was by classic pizza which was 26.90%.

--Question 12 - Analyze the revenue generated over time?
select * from dbo.orders
select dbo.orders.date,
sum(dbo.order_details.quantity* dbo.pizzas.price) as revenue
from dbo.order_details join dbo.pizzas
on dbo.order_details.pizza_id = dbo.pizzas.pizza_id
join dbo.orders
on dbo.orders.order_id = dbo.order_details.order_id
group by dbo.orders.date

-- ANS - The reveune generated over time is as follows with the highest as 2319.

--Question 13 - Determine the top 3 most ordered pizza types based on revenue for each pizza category?
select * from dbo.order_details
select * from dbo.orders
select * from dbo.pizza_types

select top 3 dbo.pizza_types.category,
sum(dbo.order_details.quantity * dbo.pizzas.price) as revenue
from dbo.pizza_types join dbo.pizzas
on dbo.pizza_types.pizza_type_id = dbo.pizzas.pizza_type_id
join dbo.order_details
on dbo.order_details.pizza_id = dbo.pizzas.pizza_id
group by dbo.pizza_types.category

--ANS - Above are the top 3 most ordered pizzas based on revenue for each pizza category.
-- Question 6 - Join the necessary tables to find the total quantity of each pizza category ordered?
select * from dbo.pizzas
select * from dbo.order_details
select * from dbo.pizza_types

select top 5 dbo.pizza_types.category,
sum(dbo.order_details.quantity) as quantity
from dbo.pizza_types join dbo.pizzas
on dbo.pizza_types.pizza_type_id = dbo.pizzas.pizza_type_id
join dbo.order_details
on dbo.order_details.pizza_id = dbo.pizzas.pizza_id
group by dbo.pizza_types.category order by quantity desc

--ANS - The Category mentioned are Classic followed by supreme, Veggie and Chicken--

-- Question 7 - Determine the distribution of orders by hour of the day?

select * from dbo.orders
select (time), count(order_id) as orders from dbo.orders
group by (time)

--ANS - Above is time and order per hour or day--

-- Question 8 - Join relevant tables to find the category-wise distribution of pizzas?

select * from dbo.pizza_types
select * from dbo.pizzas

select category, count(name) as count_name from dbo.pizza_types
group by category

-- ANS - The distribution of pizzas are as follows Chicken - 6, Classic - 8, Supreme - 9 and Veggie - 9

-- Question 9 - Group the orders by date and calculate the average number of pizzas ordered per day?

select * from dbo.orders
select * from dbo.order_details

select avg(quantity) as avg_pizzas_ordered_per_day from
(select dbo.orders.date, sum(dbo.order_details.quantity) as quantity
from dbo.orders join dbo.order_details
on dbo.orders.order_id = dbo.order_details.order_id
group by dbo.orders.date) as overall_quantity

-- ANS -- The Average Number of pizza ordered per day is 138.

-- Question 10 - Determine the top 3 most ordered pizza types based on revenue?

select * from dbo.pizza_types
select * from dbo.pizzas

select top 3 dbo.pizza_types.name, 
sum(dbo.order_details.quantity * dbo.pizzas.price) as revenue
from dbo.pizza_types join dbo.pizzas
on dbo.pizza_types.pizza_type_id = dbo.pizzas.pizza_type_id
join dbo.order_details
on dbo.order_details.pizza_id = dbo.pizzas.pizza_id
group by dbo.pizza_types.name order by revenue desc

-- ANS - The top 3 most ordered pizza by revenue are Thai Chicken pizza, The Barbecue Chicken pizza and 
--        The california chicken pizza.

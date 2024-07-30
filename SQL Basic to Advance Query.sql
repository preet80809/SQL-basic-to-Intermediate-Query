/***** Qusetion 1 - Who is the most Senior Employee based on the job title  *****/

select * from dbo.employee
order by levels desc

/*****  filtering the data for better results  *****/

select employee_id, first_name, last_name, title, levels from dbo.employee order by levels desc 
select max(levels) as senior_most_employee  from dbo.employee 
select * from dbo.employee where levels = 7

/***** Ans - The Senior Most Employee According to the below table is Mohan Madan employee_id - 9 and level - 7  *****/
/************************************************************************************************************************/


/***** Question 2 - which country has the most Invoice *****/

select * from dbo.invoice

/***** filtering the countries with group by function to ge the most invoice of a country  *****/

select count(*) as most_invoice, billing_country from [dbo].[invoice]
group by billing_country
order by most_invoice desc

-- ANS - USA WITH 131 INVOICE!
/****************************************************************************************************************************************/



/***** What are the top 3 values of total invoice ? *****/

select * from dbo.invoice

select max(total) as max_invoice from dbo.invoice
select total from dbo.invoice
order by total desc 

select top 3 total from dbo.invoice order by total desc

-- ANS - TOP 3 values of total invoice are 23 , 19 and 19

/*****************************************************************************************************************************************/


/***** Question 3 -  Which city has the best customer ?, we would like to throw a party in the city wehre we made the most profit, Write a query returning the one 
city which has the highest amount of invoice. Return  both the city names and sum of both the invoice totals? *****/

select * from dbo.invoice

select sum(total) as total_invoice, billing_city, customer_id from dbo.invoice
group by billing_city, customer_id
order by total_invoice desc

-- ANS - Prague with the most Contibution and Customer_id as 5 


/******************************************************************************************************************************************/

/***** Question 4 - Return Email firstname last name of all the listeners who listen to rock music *****/
select * from dbo.track
select* from dbo.genre
select distinct email, first_name, last_name
from dbo.customer
join dbo.invoice on dbo.customer.customer_id = dbo.invoice.customer_id
join dbo.invoice_line on dbo.invoice.invoice_id = invoice_line.invoice_id
where track_id in (
select track_id from dbo.track
join dbo.genre on track.genre_id = genre.genre_id
where genre.name like 'Rock'
)
order by email;
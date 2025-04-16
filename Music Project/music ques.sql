Q1. Who is the  senior most employee based on job title?

select *From employee
order by levels desc
limit 1

Q2.which contry have the most invoces?

select count(*),billing_country from invoice
group by billing_country
order by count(*) desc
limit 1
Q3.what are 3 top values of total invoice?

select total from invoice
order by total desc
limit 3


Q4.which city has the best customers ? we would like to throw 
a Promotional Music  Festival in the city made the most money .
Write a query returns one city that has the highest
sum of invoice totals. Return both the city name 
& sum of all invoice totals.

select  sum(total) as invoice_total , billing_city
from invoice
group by billing_city
order by invoice_total desc






Q5.who is the best customer? The customer who has spent the most money
will be declared the best customer. Write the query that returns the person
who has spent most money.

select customer.customer_id, customer.first_name, customer.last_name, 
sum(invoice.total) as total from customer 
join invoice on customer.customer_id =invoice.customer_id
group by customer.customer_id 
order by total desc
limit 1

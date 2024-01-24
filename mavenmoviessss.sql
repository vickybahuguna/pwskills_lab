--------------------------------- Assignment 2 ------------------------------

use mavenmovies;

-- Question 1:
-- retrieve the total number of rentals made in the sakila db

select count(rental_id) as count_rental from rental;                                                   

-- find the average rental duration (in days) of movies rented from the sakila database

select avg(rental_duration) as rental_duration from film;

-- display the first name and last name of customers in uppercase

select upper(first_name),(last_name) as first_name , last_name from customer;

-- extract the month from the rental date and display it alongside the rental ID

select rental_id, month(rental_date) from rental;

-- retrieve the count of rentals for each customer (display customer id and the count of rentals)

select customer_id, count(rental_id) as rental_id from rental group by customer_id;

-- find the total revenue generated by each store

select store, sum(total_sales) as total_sales from sales_by_store group by store;

-- display the title of the movie, customer's first name, and last name who rented it 
select * from film;
select * from inventory;
select * from rental;
select * from customer;
SELECT 
    title, first_name, last_name
FROM
    film
        INNER JOIN
    inventory ON film.film_id = inventory.film_id
        inner join 
	rental on inventory.inventory_id = rental.inventory_id
        inner join 
    customer on rental.customer_id = customer.customer_id;   
    
-- retrieve the names of all actors who have appeared in the film "Gone with the Wind"
select * from film;
select * from film_actor;
select * from actor;
SELECT
    a.first_name,
    a.last_name
FROM
    actor a
JOIN
    film_actor fa ON a.actor_id = fa.actor_id
JOIN
    film f ON fa.film_id = f.film_id
WHERE
    f.title = 'gangs pride';
		
-- determine the total number of rentals for each category of movies
-- JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.
select * from film_category; -- common connection
select * from film; -- rentals
select * from rental;
select * from inventory;

SELECT
    fc.category_id,
    c.name AS category_name,
    COUNT(*) AS total_rentals
FROM
    film_category fc
JOIN
    film f ON fc.film_id = f.film_id
JOIN
    inventory i ON f.film_id = i.film_id
JOIN
    rental r ON i.inventory_id = r.inventory_id
JOIN
    category c ON fc.category_id = c.category_id
GROUP BY
    fc.category_id, c.name
ORDER BY
    total_rentals DESC;

-- find the average rental rate of movies in each language.
-- Hint: JOIN film and language tables, then use AVG () and GROUP BY.

select * from film;
select * from language;

select name, avg(rental_rate) 
from film
inner join language
on film.language_id = language.language_id
group by name;


-- Retrieve the customer names along with the total amount they've spent on rentals.
-- Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.
select * from customer;
select * from payment;
select * from rental; 
	
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_amount_spent
FROM
    customer c
JOIN
    payment p ON c.customer_id = p.customer_id
JOIN
    rental r ON c.customer_id = r.customer_id
GROUP BY
    c.customer_id, c.first_name, c.last_name
ORDER BY
    total_amount_spent DESC;



-- List the titles of movies rented by each customer in a particular city (e.g., 'London').
-- Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.
select * from customer;
select * from address;
select * from city;
select * from rental;
select * from inventory;
select * from film;

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    f.title AS movie_title
FROM
    customer c
JOIN
    address a ON c.address_id = a.address_id
JOIN
    city ct ON a.city_id = ct.city_id
JOIN
    rental r ON c.customer_id = r.customer_id
JOIN
    inventory i ON r.inventory_id = i.inventory_id
JOIN
    film f ON i.film_id = f.film_id
WHERE
    ct.city = 'London'
ORDER BY
    c.customer_id, f.title;



-- Display the top 5 rented movies along with the number of times they've been rented.
-- Hint: JOIN film, inventory, and rental tables, then use cOUNT() and GROUP BY, and limit the results.
select * from film;
select * from inventory;
select * from rental;

SELECT
    f.film_id,
    f.title AS movie_title,
    COUNT(*) AS rental_count
FROM
    film f
JOIN
    inventory i ON f.film_id = i.film_id
JOIN
    rental r ON i.inventory_id = r.inventory_id
GROUP BY
    f.film_id, f.title
ORDER BY
    rental_count DESC
LIMIT 5;



-- Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
-- Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.

select * from customer;
select * from rental;
select * from inventory;

SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM
    customer c
JOIN
    rental r ON c.customer_id = r.customer_id
JOIN
    inventory i ON r.inventory_id = i.inventory_id
WHERE
    i.store_id IN (1, 2)
GROUP BY
    c.customer_id, c.first_name, c.last_name
HAVING
    COUNT(DISTINCT i.store_id) = 2;











































































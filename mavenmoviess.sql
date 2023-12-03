-- Identify the primary keys and foreign keys in maven movies db. Discuss the differences
use mavenmovies;

select * from actor;
select * from actor_award;

describe actor;
describe actor_award;

-- in actor_award table (actor_award_id) is the primary key but on the otherhand actor_id or Last_name will be foreign key because they refereing from the (actor)
   -- table. 
   
-- last_name in both the table are the foreign keys 

-- As we can see in actor table, actor_id is unique this is the sign of primary key in any table it should be unique and not null

-- As we can see in actor_award table, actor_award_id is primary key in this table but actor_id in this table is null it shows that its a 
   -- foreign key 
   
----------------------------------------------------------------------------------------------------------------------------------------

-- List all details of actors

select * from actor;
select * from actor_award;
select * from film_actor;	
   
-- List all details of customer

select * from customer;

-- list all different countries

select * from country;

-- display all active customers

select active from customer;

-- list all rental IDs for customer with ID 1 

select rental_id from rental where customer_id = 1;

-- display all the films whose rental duration is greater than 5 

select * from film where rental_duration > 5;

-- list the total number of films whose replacement cost is greater than $15 and less than $20

select * from film where replacement_cost > 15 and replacement_cost < 20;

-- display the count of unique first names of actors

select distinct first_name from actor;

-- display the first 10 records from the customer table

select * from customer limit 10;

-- display the first 3 records from the customer table whose first name starts with 'b'

select * from customer where first_name like 'b%' limit 3;

-- display the names of the first 5 movies which are rated as 'G'

select * from film where rating = 'G' limit 5;

-- find all customers whose first name starts with "a"

select * from customer where first_name like "a%";

-- find all customer whose first name ends with "a"

select * from customer where first_name like "%a";

-- display the list of first 4 cities which start and end with "a"

SELECT * FROM City WHERE city LIKE 'a%' and city LIKE '%a' limit 4;

-- find all customers whose first name have "NI" in any position

select first_name from customer where first_name like "%NI%"; 

-- find all customers whose first name have "r" in the second position

select first_name from customer where first_name like "_r%";

-- find all customer whose first name starts with "a" and are at least 5 character in length 

select first_name from customer where first_name like 'a%' and length (first_name)=5;

-- find all customers whose first name starts with "a" and ends with "o"

select first_name from customer where first_name like "a%o";

-- get the films with pg and pg-13 rating using IN operator

select * from film where rating in ('pg', 'pg-13');

-- get the films with length between 50 to 100 using between operator

select * from film where length between 50 and 100;

-- get the top 50 actors using limit operator

select * from actor limit 50;

-- get the distinct film ids from inventory table

select distinct film_id from inventory;

































































































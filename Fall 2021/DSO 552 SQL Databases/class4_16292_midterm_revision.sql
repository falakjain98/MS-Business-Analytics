-- Class 2 DSO 552 (16292)
-- drop table table_name;


-- (1) Create a database called movie_sample;
-- CREATE DATABASE movie_sample;

-- (2) Write the SQL needed to create an actors, directors, movies table from the ERD.

-- CREATE TABLE actors (
-- 	actor_id SERIAL PRIMARY KEY,
-- 	first_name VARCHAR(150),
-- 	last_name VARCHAR(150)
-- );

-- CREATE TABLE directors (
-- 	director_id SERIAL PRIMARY KEY,
-- 	first_name VARCHAR(150),
-- 	last_name VARCHAR(150)
-- );


-- CREATE TABLE movies (
-- 	movie_id SERIAL PRIMARY KEY,
-- 	movie_name VARCHAR(150),
-- 	movie_length INT,
-- 	release_year DATE,
-- 	director_id INT REFERENCES directors(director_id)
-- );


-- CREATE TABLE movies_actors (
-- 	movie_id INT REFERENCES movies(movie_id),
-- 	actor_id INT REFERENCES actors(actor_id)
-- );

-- CREATE TABLE movies_actors (
-- 	movie_id INT,
-- 	actor_id INT,
-- 	CONSTRAINT movie_actor_pkey PRIMARY KEY(movie_id, actor_id),
-- 	FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
-- 	FOREIGN KEY (actor_id) REFERENCES actor(actor_id)
-- );





-- (3) ALTER movies table to add a column called language
-- ALTER TABLE movies ADD COLUMN language varchar(30);


-- alter table movies add constraint mlength check(movie_length>0);
-- alter table movies drop constraint mlength;

-- alter table movies
-- add column reviews Int,
-- add check(movie_name IS NOT NULL);


-- (4) From the directors, SELECT all the records and columns.
SELECT * 
FROM directors;


-- (5) From the directors, SELECT specific columns
SELECT
	first_name || ' ' || last_name as fullname,
	AGE(date_of_birth) age,
	nationality
FROM
	directors;


-- (6) From the directors, SELECT the first_name and last_name and combine them to return FullName column 
SELECT 
	first_name || ' ' || last_name Fullname
FROM
	directors;




-- (7) Select first_name and last_name as fullname from actors table and sort
-- by last_name descending and first_name ascending.
SELECT
	first_name || ' ' || last_name fullname
FROM 
	actors
ORDER BY
	last_name DESC, first_name ASC;
	


	
	
-- table name with double quote is equivalent to without it but may need to use double quote in the join	
SELECT
	first_name || ' ' || last_name "fullname"
FROM
	actors
ORDER BY
	last_name DESC, first_name ASC





-- (8) Return the revenues_domestic and revenues_international from 
-- the movies_revenues table ordered by revenues_domestic 
-- descending and revenues_international ascending
SELECT
	revenues_domestic,
	revenues_international
FROM
	movies_revenues
ORDER BY
	revenues_domestic DESC, revenues_international ASC NULLS LAST



-- (9) Return all the distinct movie_lang values from the movies table
-- ordered by movie_lang ascending and limit to 3 results.

SELECT
	DISTINCT movie_lang
FROM
	movies
ORDER BY
	movie_lang ASC
LIMIT 3;


-- distinct on showing top unique grouping of movie_lang and length desc
SELECT
	DISTINCT ON (movie_lang) 
		movie_lang, movie_length
FROM
	movies
ORDER BY
	movie_lang, movie_length DESC


-- compare against the distinct to see how distinct on (above) adjusts the results
SELECT
	DISTINCT movie_lang, movie_length
FROM
	movies
ORDER BY
	movie_lang, movie_length DESC


-- Movie lang and age certificate

SELECT
	DISTINCT movie_lang, age_certificate
FROM
	movies
ORDER BY
	movie_lang, age_certificate DESC
	


-- Movie lang and age certificate & Distinct ON
SELECT
	DISTINCT ON (movie_lang) 
		movie_lang, age_certificate
FROM
	movies
ORDER BY
	movie_lang, age_certificate DESC


-- (10) Find all the unique nationality values from the directors table 
-- ordered by nationality ascending.

SELECT
	DISTINCT nationality
FROM 
	directors
ORDER BY
	nationality



-- (11) Return the 3 movies from movies table where the movie_length is not between 90 and 120 and the
-- age_certificate is equal to 'PG' or 'U'. Sort by movie_name descending, movie_length ascending,
-- released date ascending and limit to 3 results.
SELECT
	movie_name, movie_length, release_date
FROM
	movies
WHERE
	movie_length NOT BETWEEN 90 AND 120 AND age_certificate IN ('PG', 'U')
ORDER BY
	movie_name DESC, movie_length ASC, release_date ASC
LIMIT 3;






-- (12) Return 1 movie where the age_certificate is either equal to '12' or 
-- equal to 'PG', and the movie_lang is either "Spanish" or "German".
-- Sort by movie_name ascending.

SELECT 
	DISTINCT ON (movie_name) movie_name
FROM
	movies
WHERE
	age_certificate IN ('12', 'PG') AND movie_lang IN ('Spanish', 'German')
ORDER BY
	movie_name ASC

 
 
 
 
 
--  13) In the actors table, return the youngest actor (using the date_of_birth field) and that actor's
-- first_name, last_name, date_of_birth dob, the age of the actor as "age". Sort by last_name descending.
-- ** AGE calculates the difference in years, months, days between field and current date
SELECT
	first_name, 
	last_name, 
	date_of_birth dob,
	AGE(date_of_birth) age
FROM
	actors
ORDER BY
	age, last_name DESC
LIMIT 1;








-- 14) For each actor's age by their age in years (e.g. 20, 21, 23 years old...),
-- return the first actor in each year grouping sorted by the year, 
-- the age and the last_name ascending. Return the actors age as years, first_name,
-- last_name, and age() given the actor's date_of_birth as age. Filter out for any age
-- that is equal to 22, 26, 28, and 32. To extract year from the actor's age,
-- use the age() function on the actor's date_of_birth.
-- Then, use the DATE_PART(field,source) operator where the field
-- is "year" and the source is the the result of the age() function.

-- DATE_PART(field,source)
-- i.e. what field to extract

SELECT
	DISTINCT ON (DATE_PART('year', AGE(date_of_birth))) 
		DATE_PART('year', AGE(date_of_birth)) as years,
		first_name,
		last_name,
		AGE(date_of_birth) age
FROM
	actors
ORDER BY
	years, age, last_name



-- OR use EXTRACT( field FROM source	)

SELECT
	DISTINCT ON (EXTRACT('year' FROM AGE(date_of_birth))) 
		EXTRACT('year' FROM AGE(date_of_birth)) as years,
		first_name,
		last_name,
		AGE(date_of_birth) age
FROM
	actors
ORDER BY
	years, age, last_name
 







-- 15) From the movies_revenues table, return the rows where the floor of the revenues_domestic 
-- is equal to the ceiling of the revenues_international

SELECT
	*
FROM 
	movies_revenues
WHERE
	FLOOR(revenues_domestic) = CEIL(revenues_international)






-- 16) From the movies table, return the following fields:
-- 1. round the result of calculating the movie_length in hours as "hours" to 0 decimal places. Use the 
-- 		round(value/field, # of decimal places) operator. Call the field "~ # of hours"
-- 2. movie_name as name 
-- 3. concatenate the movie_length in hours with ' hours and ' 
-- 	  and leftover minutes of the movie_length followed by the phrase
-- 	  ' minutes' . Call this field movie_time
-- 4. movie_length as minutes
-- 5. return how old the movie is in terms of years, months, and days given the release_date
-- call this field "years old"
-- 6. Sort by "~ # of hours" descending and movie_name ascending

SELECT
	ROUND(movie_length/60, 0) "~ # of hours",
	movie_name "name",
	ROUND(movie_length/60, 0) || ' hours and ' || movie_length % 60 || ' minutes' movie_time,
	AGE(release_date) "years old"
FROM
	movies
ORDER BY
	1 DESC, 2 ASC
	






-- 17) From the movies table, select the first row of each grouping of movies based on the first letter that the 
-- movie_name begins with using the SUBSTRING(field/value,string position, # of characters to extract) 
-- operator and call the field alphabetical. Return the movie_name, movie_length and 
-- release_date fields. Filter out any movies where the alphabetical field does 
-- not have a value in 'E' or 'F'. Order by alphabetical ascending,
-- release_date descending and movie_length descending. Limit to 13 results.

SELECT
	DISTINCT ON(SUBSTRING(movie_name, 1, 1))
		SUBSTRING(movie_name, 1, 1) alphabetical,
		movie_name,
		movie_length,
		release_date
FROM
	movies
WHERE
	SUBSTRING(movie_name, 1, 1) NOT IN ('E', 'F')
ORDER BY
	alphabetical ASC, release_date DESC, movie_length DESC
LIMIT 13;







-- 18) Return movies from movies table where movie_length is either 139 or 150 and the movie_name contains the
-- word "Star" in it. Sort by movie_length desc.

SELECT
	*
FROM
	movies
WHERE
	movie_length IN (139, 150) AND movie_name LIKE '%Star%'
ORDER BY
	movie_length DESC








-- NORTHWIND DATASET ---



-- 19) From the suppliers table, return the
-- contact_name, contact_title, company_name, length of company_name as cname_length, country 
-- fields in the results where the following are true:
-- contact_title does not contain the word 'Manager' anywhere in it OR 
-- the country is in either 'Canada' or 'Denmark' AND the length of the company_name
-- is between 9 and 18
-- Sort by length of the company_name, contact_name, and country. Limit to 2 results.

-- LENGTH(field)
 
SELECT
	contact_name,
	contact_title,
	company_name,
	LENGTH(company_name) cname_length,
	country
FROM
	suppliers
WHERE
	contact_title NOT LIKE '%Manager%' OR
	(country IN ('Canada', 'Denmark') AND
	LENGTH(company_name) BETWEEN 9 AND 18)
ORDER BY
	cname_length, contact_title, country
LIMIT 2




-- 20) From suppliers table, return the company_name and 
-- length of the company_name as complength where the
-- company name is exactly 9 letters long. Sort by complength 
-- and company_name ascending. What are the different ways of
-- writing this?

SELECT
	company_name,
	LENGTH(company_name) complength
FROM
	suppliers
WHERE
	LENGTH(company_name) = 9
ORDER BY
	complength, company_name 





 



 

-- AGGREGATE Functions ---

-- (21) From the movies_revenues, SELECT and find the difference between the average (AVG()) 
-- of the revenues_domestic subtracted from the renuves_international as Diff,
-- and the individual average of all the domestic and international as Domestic and International respectively
 
SELECT
	AVG(revenues_international) - AVG(revenues_domestic) Diff,
	AVG(revenues_domestic) Domestic,
	AVG(revenues_international) International
FROM
	movies_revenues



 



 

-- 22) From the orders table, group by employee_id where the shipped_date is not null 
-- and return the count as number_of_orders, the maximum freight as m_freight.
-- Only return results where the maximum freight is larger than 800 and order
-- by the maximum freight descending

-- CHECK not null use "field IS NOT NULL"
 
SELECT
	COUNT(*) number_of_orders,
	MAX(freight) m_freight
FROM
	orders
WHERE 
	shipped_date IS NOT NULL
GROUP BY
	employee_id
HAVING
	MAX(freight) > 800
ORDER BY
	m_freight DESC


 



-- 23) From the products table, group by category_id and discontinued and 
-- return the sum of the unit_price mulitiplied by the units_in_stock of each
-- item as inventory_value and round it, round the average unit_price of each grouping
-- as avg_price, and count the number of items per grouping as total. Only 
-- return results with a category_id either equal to 1 or 2. Sort by category_id and discontinued
-- ascending

SELECT
	ROUND(SUM(unit_price*units_in_stock)) inventory_value,
	ROUND(AVG(unit_price)) avg_price,
	COUNT(*) total
FROM
	products
WHERE
	category_id IN (1,2)
GROUP BY
	category_id, discontinued
ORDER BY
	category_id, discontinued

 



 




-- 24) From the order_details table, group on order_id, and return the total
-- quantity as total_units, round the sum of each item's quantity 
-- multiplied by the unit price multiplied by 1 - the discount field and call it
-- total_spending, and the total count of each grouping as total_orders. 
-- Only include in your calculation where the discount is greater than 0 and the
-- count of the order_id is equal to 3. Sort by total_spending descending.

SELECT
	SUM(quantity) total_units,
	ROUND(SUM(quantity*unit_price*(1-discount))) total_spending,
	COUNT(*) total_orders
FROM
	order_details
WHERE
	discount > 0
GROUP BY
	order_id
HAVING
	COUNT(*) = 3
ORDER BY
	total_spending DESC


 



 



-- 25) From customers table, group by job_title and return the count per grouping as total. 
-- To compute job_title, consider the following cases:
-- (a) when contact_title contains the word 'Sale' in it and does not contain the word 'Manager' or 'Owner' label it as "Sales"
-- (b) when the contact_title contains the word "Owner" or "Manager" then label it as 'Upper Management'
-- (c) otherwise return the contact_title
-- Sort the results by total and job_title desc

SELECT
	COUNT(*) total,
	CASE
		WHEN contact_title LIKE '%Sale%' AND contact_title NOT LIKE ANY(ARRAY('%Manager%', '%Owner%')) THEN 'Sales'
		WHEN contact_title LIKE ANY(ARRAY('%Owner%', '%Manager%')) THEN 'Upper Management'
	ELSE
		contact_title
	END job_title
FROM
	customers
GROUP BY
	job_title
ORDER BY
	total, job_title DESC
	





 



 



-- 26) From the products table, group by supplier_id and reutrn the count of supplier_id as total and
-- if groupings of supplier_id only have a single distinct category_id, label it "Single", otherwise if it is
-- greater than label it as "Mixed" and these set of labels have the alias of cat_type. Sort by
-- cat_type and total	

SELECT
	COUNT(*) total,
	CASE 
		WHEN COUNT(DISTINCT(category_id)) = 1 THEN 'Single'
		ELSE 'Mixed'
	END as cat_type
FROM
	products
GROUP BY
	supplier_id
ORDER BY
	cat_type, total
	
 
 
 
---------- Sample Problems ------
--  27) Find the oldest and most recent hire date (hire_date) in the employees table. ----
 
SELECT
	*
FROM
	employees
WHERE hire_date = (SELECT MAX(hire_date) FROM employees) OR hire_date = (SELECT MIN(hire_date) FROM employees)

-- OR use group by and having
 
 
--  28) In the order_detils table, group by order_id and find the lowest line item total as min_price, 
-- the highest line item total as max_price, the difference between these two totals as diff
-- and the count per grouping as total. 

-- Note - deriving the value is computed as so: quantity * unit price * (1-discount). Use round() on all
-- computed values to display an integer.
 
SELECT
	order_id,
	ROUND(MIN(quantity*unit_price*(1-discount))) min_price,
	ROUND(MAX(quantity*unit_price*(1-discount))) max_price,
	ROUND(MAX(quantity*unit_price*(1-discount)) - MIN(quantity*unit_price*(1-discount))) diff,
	COUNT(*) total
FROM
	order_details
GROUP BY
	order_id

	
 
--  29) From the products table, return the product_name field,
-- the price field which is computed by multiplying the unit_price by the 
-- units_in_stock field, the units_in_stock field, and the 
-- unit_price field. Sort by the price field descending and limit to 
-- 2 results. 

-- ** NOTE - this problem is a bit of a challenge. But try separating it out.
-- First, we need to compute the average price of the entire table, and then 
-- compare the average price of the product's table to the price of each individual 
-- product in the WHERE clause and filter out those price field values 
-- that exceed the average price. Here's a hint:
-- SELECT fields_to_include
-- FROM table 
-- WHERE some_value <= ( query_to_compute_average_price  ) <--- 
 
SELECT 
	product_name,
	unit_price*units_in_stock price,
	units_in_stock,
	unit_price
FROM
	products
WHERE
	unit_price*units_in_stock <= (SELECT AVG(unit_price*units_in_stock) FROM products)
ORDER BY
	price DESC
LIMIT 2

 



 
 
----------- Sample Problems END -----------



-- 30) In the orders table, group by employee_id and shipped_date fields where the shipped_date is
-- the maximum shipped_date of the order's table. For each grouping, return the count of rows where
-- the shipped_date field is not null as number_orders_shipped and the total sum of the freight as sum_freight.
-- Order by this total descending.

SELECT
	employee_id,
	shipped_date,
	COUNT(*) number_orders_shipped,
	SUM(freight) sum_freight
FROM
	orders
WHERE
	shipped_date = (SELECT MAX(shipped_date) FROM orders)
GROUP BY
	employee_id, shipped_date
HAVING
	shipped_date IS NOT NULL
ORDER BY
	sum_freight desc



 



 
 
 
--  31) From the customer's table, return the company_name and contact_title field where the 
-- contact_title is not in the top two most frequent contact_title field values in the
-- customer's table
SELECT
	company_name,
	contact_title
FROM
	customers
WHERE
	contact_title NOT IN (SELECT 
								contact_title
							FROM
								customers
							GROUP BY
								contact_title
							ORDER BY
								COUNT(contact_title) DESC
							LIMIT 2
						 )

	

 
 
 
 
 
 ----------------------------------------------------------
 ----------------------------------------------------------
 ----------------- JOINS - Merging Tables -----------------
 ----------------------------------------------------------
 ----------------------------------------------------------

-- -Inner joins are the SQL Server default. You can abbreviate the INNER JOIN clause to JOIN.
-- -Specify the columns that you want to display in your result set by including the column names in the select list.
-- -Include a WHERE clause to restrict the rows that are returned in the result set.
-- -Do not use a null value as a join condition, because null values do not evaluate equally with one another.
-- -SQL Server does not guarantee an order in the result set unless one is specified with an ORDER BY clause.
-- -You can use multiple JOIN clauses and join more than two tables in the same query.





-- 32) In the products table, return the product_name field (products) and company_name field (suppliers) 
-- by joining on the suppliers table primary key. Sort by company_name field ascending.

SELECT
	product_name, company_name
FROM
	products p
	JOIN suppliers s ON p.product_id = s.supplier_id
ORDER BY
	company_name ASC




 



 


-- 33) Return the company_name (customers), order_date (orders),  contact_title (customers) for all orders placed
-- after '1998-01-01', Sort by order_date, company_name, contact_title fields all ascending.

SELECT
	company_name,
	order_date,
	contact_title
FROM
	orders o
	JOIN customers "c" ON o.customer_id = c.customer_id
WHERE
	o.order_date > '1998-01-01'
ORDER BY
	order_date, company_name, contact_title


-- NOTE: JOIN and LEFT JOIN gave same results, implying no nulls present


 



 

-- 34)Concantenate the first_name and last_name fields as fullname (employee), the city (employee),
-- the order_id (orders), the status which is calculated conditionally to evaluate to 'LATE' when shipped_date
-- is greater than the required_date (orders) or else evaluate to 'OK', the interval between the
-- shipped_date and required_date as 'days', and the shipped_date and required_date. Join the employee and 
-- orders table on the employees table primary key where the shipped_date is not null. Sort by status 
-- ascending and days descending. Limit to 5 results.

SELECT
	e.first_name || ' ' || e.last_name fullname,
	e.city,
	o.order_id,
	CASE
		WHEN o.shipped_date > o.required_date THEN 'LATE'
		ELSE 'OK'
	END status,
	ABS(o.shipped_date - o.required_date) days,
	o.shipped_date,
	o.required_date
FROM
	employees e
	JOIN orders o ON e.employee_id = o.employee_id
WHERE
	o.shipped_date IS NOT NULL
ORDER BY
	status, days DESC
LIMIT 5
 
-- DOUBT: use abs or not???


 
	
	
	
-- 35) Return the top 5 employees grouped by employee_id and fullname which is the first_name and last_name 
-- concatenated (all in employees table). In these groupings, sum the difference between the shipped_date and
-- required_date in cases where the shipped_date is greater than the required_date field value and name this field
-- days_late. Sort by days_late descending and fullname ascending. Limit to 5 results.

SELECT
	e.employee_id,
	e.first_name || ' ' || e.last_name fullname,
	SUM(o.shipped_date - o.required_date) days_late
FROM
	employees e
	JOIN (SELECT 
		  	*
		  FROM
		  	orders
		 	WHERE 
		  		shipped_date > required_date
		  ) as o
		ON e.employee_id = o.employee_id
GROUP BY
	e.employee_id
ORDER BY
	days_late DESC, fullname ASC
LIMIT 5



 

































































































 


















---------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- CORR(x,y) correlation ebtween two columns
--  VARIANCE(x),
--     STDDEV(x)



-- (8)  SELECT the movie_name from the record sorted by the newest release_date and longest movie_length
select movie_name, release_date, movie_length
from movies
order by release_date DESC, movie_length DESC 













-- https://learning.oreilly.com/library/view/mastering-postgresql-13/9781800567498/73b9a174-ab02-4b34-ae58-de924b8be181.xhtml#uuid-73b77359-f6a1-4b2e-b625-15de276f9e1a
-- CREATE TABLE if not exists t_oil ( 
--  region      text, 
--   country     text, 
--   year        int, 
--   production  int, 
--   consumption int 
-- ); 
-- (3) Importing data:

-- (3.1) Copy data from a text file
COPY t_oil FROM PROGRAM 'curl https://www.cybertec-postgresql.com/secret/oil_ext.txt '


-- (3.2) Import from SQL file


-- (3.3) INSERT data into table






-- (8) SELECT top performing movies
SELECT PERCENTILE_CONT(0.5)
WITHIN GROUP (ORDER BY revenues_domestic) 
FROM movies_revenues;


-------- BEFORE DROP, MAKE A COPY OF DATABASE AND TABLE? -----------
create database new_database_here template database_to_copy;
-- (4) 


-- DROP DATABASE dso552;

-- CREATE DATABASE dso552
--     WITH 
--     OWNER = arsamesqajar
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'C'
--     LC_CTYPE = 'C'
--     TABLESPACE = pg_default
--     CONNECTION LIMIT = -1;










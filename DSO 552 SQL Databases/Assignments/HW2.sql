-- Question 1
select country, contact_title, count(*) total
from customers
where contact_title not ilike '%sales%'
group by country,contact_title
having count(*) > 2
order by country desc, contact_title desc;

-- Question 2
select order_id,discount,round(avg(quantity),2) avg_quantity,sum(unit_price) sum_price,count(*) total
from order_details
where discount>0
group by order_id, discount
having count(*) > 4
order by total desc, discount desc;

-- Question 3
select contact_title,
	count(*) total, 
	max(city) mx_city, 
	min(city) mn_city,
	length(max(city))-length(min(city)) city_diff
from customers
where contact_title ilike '%owner%' or contact_title ilike '%representative%'
group by contact_title
order by total desc, mx_city desc;

-- Question 4
select product_id,
	category_id,
	product_name,
	units_in_stock
from products
where (product_id = category_id
or product_id = product_id*category_id)
and (product_name ilike 's%' or product_name ilike 'u%')
order by product_id = category_id desc, product_name desc;

-- Question 5
select ship_country,
	ship_via,
	employee_id,
	count(*) total,
	avg(freight) avg_fr
from orders
where ship_via<employee_id
and ((ship_country not ilike '%y'
	and ship_country not ilike '%l')
	or (employee_id = 4))
group by ship_via, employee_id, ship_country
having avg(freight) > 30 and count(*) > 7
order by total desc;
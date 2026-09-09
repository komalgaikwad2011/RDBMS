


--inspect and explore data

select * from customer;  --view data
select count(*) from customer; --count total records
DESCRIBE customer;  --check column structure and data types


--find missing values

select * 
from customer
where customer_id=null;

--remove buplicate

select customer_id,count(*)
from customer
group by customer_id
having count(*)>1;

--standardize data

select 
trim(customer_name) as customers,
upper(country) as countries,
lower(city) as cities
from customer;

--standardize data/time data

select str_to_date(order_date,'%d-%m-%y') as new_date
from customer;

--handling missing values

select coalesce(customer_name,'unknown') as columna
from customer;

--remove unwanted charecters

select replace(customer_name,'-','') as new_column
from customer;

--validate and check data

select count(*) from customer;
select distinct customer_name from customer;
select customer_name from customer where

--finalize clean data

create table cleaned_data as
select * from table
where 



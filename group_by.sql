create table customer(
customer_id int primary key,
customer_name varchar(50),
country varchar(30),
city varchar(30),
age int,
category varchar(30),
purchase_amount decimal(10,2),
order_date date
);



insert into customer values
(1,'aarav','india','delhi',28,'electronics',15000,'2024-01-12'),
(2,'diya','india','mumbai',34,'fashion',8000,'2024-01-15'),
(3,'john','usa','new york',45,'electronics',22000,'2024-02-2'),
(4,'emma','usa','chicago',29,'grocery',5000,'2024-02-10'),
(5,'rohan','india','pune',22,'electronics',12000,'2024-02-18'),
(6,'sophia','uk','london',38,'fashion',18000,'2024-03-05'),
(7,'liam','uk','manchester',41,'grocery',6000,'2024-03-11')
;


select * from customer;


--q_1]find the total number of customers in the table

select  count(*) as totalcustomer 
from customer;

--q_2]find the total purchaseamount of all customers combine

select sum(purchase_amount) as total
from customer;

--q_3]find the highest and the lowest purchase amount int a single query

select min(purchase_amount) as minamount,
	   max(purchase_amount) as maxamount
from customer;

--q_4]find the average purchase amount,rounded to 2 decimal places

select round(avg(purchase_amount),2) as avgamount
from customer;

--q_5]show all customers from india and uk, sorted by purchase amount(highest first)

select * 
from customer 
where country IN ('india', 'uk')
order by purchase_amount desc;

--q_6]find how many customers are older than 30

select count(*) as olderage
from customer
where age>30;

--q_7]find the total purchase amount of all electronics orders

select sum(purchase_amount) as totalpurchase
from customer
where category='electronics';

--q_8]how many distinct countries appers in the table

select count(distinct country) as uniquecount
from customer;

--q_9]find the number of customers in each country

select country,count(*) as no_of_customer
from customer
group by country;

--q_10]find the total purchase amount for each country,highest first

select country,sum(purchase_amount) as total_purchase
from customer
group by country
order by total_purchase desc;

--q_11]find the total purchase amount for each country,lowest first

select country,sum(purchase_amount) as total_purchase
from customer
group by country
order by total_purchase asc;

--q_12]find the total and average purchaseamount for each category 

select category,
round(avg(purchase_amount),2) as avgamount,
sum(purchase_amount) as totalpurchase
from customer
group by category;

--q_13]find the maximum purchase amount in each category

select category,max(purchase_amount) as maxpurchase
from customer
group by category;

--q_14]find the average age of customers in each country

select country,round(avg(age),2) as avgage
from customer
group by country;

--q_15]find the number of customers in each city.which city has more than one?

select city,count(*) as no_of_customer
from customer
group by city
having count(*)>1;

--q_16]find month-wise total sales(use the orderdate column),in month order

select sum(purchase_amount) as totalsale,extract(month from order_date) as monthdate
from customer
group by monthdate
order by extract(month from order_date) asc;

--q_17]find the total purchaseamount per country,but only for customers older than 30

select country,sum(purchase_amount)as totalpurchase
from customer
where age>30
group by country;

--q_18]show total orders and total sales for every country+category combination,sorted by country a->z and then sales high->low

select country,category,
sum(purchase_amount) as totalsale,
count(*) as totalorder
from customer
group by country,category
order by country asc,totalsale desc;

--q_19]which country has the highest average order value?(return only that one row)

select country,
avg(purchase_amount) as avgamount
from customer
group by country
order by avgamount desc
limit 1;


--q_20]show only those countries that have more than 2 customers

select country,count(*) as customercount
from customer
group by country
having count(*)>2;

--q_21]show only those categories whose average purchaseamount is below 12000

select category,round(avg(purchase_amount),2) as avgpurchase
from customer
group by category
having round(avg(purchase_amount),2)<12000;

--q_22]show only those countries whose largest single order crossed 20000

select country,max(purchase_amount) as maxpurchase
from customer
group by country
having  max(purchase_amount)>2000;


--q_23]show each country's revenue along with its percentage contribution to total revenue

select country,sum(purchase_amount) as totalrevenue,
round(sum(purchase_amount)*100.0/(select sum(purchase_amount) from customer),2) as perrevenue
from customer
group by country;


--q_24]group customers into age bands-'under 30','30 to 40','above 40'-and show the count and total sales for each band.
         
select 
case
when age<30 then 'under_30'
when age between 30 and 40 then '30_to_40'
else 'above_40'
end as ageband,
count(*) as customers,
sum(purchase_amount) as totalsales
from customer
group by 
case
when age<30 then 'under_30'
when age between 30 and 40 then '30_to_40'
else 'above_40'
end
order by totalsales desc;







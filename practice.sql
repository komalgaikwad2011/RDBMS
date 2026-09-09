select * from customer;

--find second highest purchase amount

select max(purchase_amount) as maxpurchase
from customer
where purchase_amount<(select max(purchase_amount) from customer)
limit 1;

--find all customers purchase amount more than avg purchase amount in there city


select customer_name,city,round(avg(purchase_amount),2) as avgamount
from customer
where purchase_amount>(select round(avg(purchase_amount),2)from customer)
group by city,customer_name;



--count how maany have same purchase amount

select count(*)
from customer
where (select count(*) from customer)>1;





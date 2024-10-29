
             #slip_3

create table hospital(h_no int primary key,h_name varchar(20),city varchar(20));

create table docter(d_no int primary key,d_name varchar(20),specialization varchar(20),charges int,h_no int references hospital);


create or replace function fun1()returns trigger as
$$
declare
begin
     if new.charges<='0'then
     raise exception 'charges can not be zero';
     end if;
     return new;
end;
$$
language 'plpgsql';

create trigger t1
before insert or update on doctor
for each row
execute procedure fun1();

insert into doctor values('21','abc','xyz','500');
insert into doctor values('111','abc','xyz','0');

===================================================================

             #slip_5
             
create table customer(cno int primary key,cname varchar(20),city varchar(20));

create table account(a_no int primary key,a_type varchar(20),opening_date date,balance money,cno int references customer);

create or replace function fun2()returns trigger as
$$
declare
begin
     if new.balance<='1000'then
     raise exception 'balance can not be less than 1000';
     end if;
     return new;
end;
$$
language 'plpgsql';

create trigger t2
before insert or update on account
for each row
execute procedure fun2();

insert into account values('111','abc','12-3-2000','500');




==============================================================================

           #slip_6

create table movie(m_name varchar(20) primary key,release_year int,budget money);

create table producer(p_id int primary key,pname varchar(20),p_address varchar(20));

create table movie_producer(m_name varchar(20) references movie,p_id int references producer);

select * from movie;
select * from producer;

create or replace function fun3()returns trigger as
$$
declare
begin
     if new.budget<='100000'then
     raise exception 'budget can not be less than 100000';
     end if;
     return new;
end;
$$
language 'plpgsql';

create trigger t11
before insert or update on movie
for each row
execute procedure fun3();

insert into movie values('aaa',20-12-2000,'500');

========================================================

              #slip_11

create table customer(cno int primary key,cname varchar(20),city varchar(20));

create table account(accno int primary key,acc_type varchar(20),opening_date date,balance money,cno int references customer);
              
select * from customer;
select * from account;


create or replace function fun3()returns trigger as
$$
declare
begin
     raise exception 'account record is being deleted';
end;
$$
language 'plpgsql';

create trigger t13
before delete on account
for each row
execute procedure fun3();

insert into account values('1','abc','20-12-2013','500000');

drop table account;

==============================================================================

             #slip_12
             
create table department(dno int primary key,dname varchar(20),city varchar(20));

create table employee(eno int primary key,ename varchar(20),salary money,dno int references department);


create or replace function fun3()returns trigger as
$$
declare
begin
     if new.salary<='0'then
     raise exception 'salary can not be less than 0';
     end if;
     return new;
end;
$$
language 'plpgsql';

create trigger t14
before insert on employee
for each row
execute procedure fun3();

insert into employee values('112','abc','100');

=========================================================================================

             #slip_14
  
create table customer(cno int primary key,cname varchar(20),city varchar(20));

create table account(accno int primary key,acc_type varchar(20),opening_date date,balance money,cno int references customer);
                  
select * from customer;
select * from account;

create or replace function fun1()returns trigger as
$$
declare
begin
	if new.balance<='500' then
	raise exception 'balance can not be < 500';
	end if;
	return new;
end;
$$
language 'plpgsql';

create trigger t31
before insert on account
for each row
execute procedure fun1();

insert into account values('80','abc','20-12-2000','400');


=============================================================================
                  
               #slip_15

create table department(dno int primary key,dname varchar(20),city varchar(20));

create table employee(eno int primary key,ename varchar(20),salary money,dno int references department);

select * from department;
select * from employee;


create or replace function fun1()returns trigger as
$$
declare
begin
	raise notice 'employee record is being updated';
end;
$$
language 'plpgsql';


create trigger t32
before update on employee
for each row
execute procedure fun1();

update employee set ename='mr.abc' where eno=1;


=============================================================================

            #slip_16
         
create table item(itemno int primary key,itemname varchar(20));
create table supplier(supplier_no int primary key,supplier_name varchar(20),city varchar(20));

create table item_supplier(itemno int references item,supplier_no int references supplier,rate money,quantity int);


create or replace function fun1()returns trigger as
$$
declare
begin
	if new.rate<='50' then
	raise exception 'rate can not be < 50';
	end if;
	return new;
end;
$$
language 'plpgsql';


create trigger t34
before insert or update on item_supplier
for each row
execute procedure fun1();

insert into item values('1','abc');
insert into supplier values('2','xyz','pune');

insert into item_supplier values('1','2','40','10');

===============================================================================

          #slip_17 
         
create table student(roll_no int primary key,snama varchar(20),sclass varchar(20));

create table teacher(t_no int primary key,tname varchar(20),experience int);

create table student_teacher(roll_no int references student,t_no int references teacher,subject varchar(20));

insert into student values('1','rai','fy');
insert into student values('2','om','sy');

insert into teacher values('10','mr.rai','3');
insert into teacher values('20','mr.om','2');

insert into student_teacher values('1','20','rdbms');

select * from student;
select * from teacher;
select * from student_teacher;

create or replace function fun1()returns trigger as
$$
declare
begin
	if new.roll_no<='0' then
	raise exception 'invalid roll no';
	end if;
	return new;
end;
$$
language 'plpgsql';


create trigger t36
before insert on student
for each row
execute procedure fun1();

insert into student values('0','sham','ty');

========================================================================

         #slip_18

create table student(roll_no int primary key,snama varchar(20),sclass varchar(20));

create table teacher(t_no int primary key,tname varchar(20),experience int);

create table student_teacher(roll_no int references student,t_no int references teacher,subject varchar(20));

select * from student;
select * from teacher;
select * from student_teacher;


create or replace function fun1()returns trigger as
$$
declare
begin
	if new.experience<'4' then
	raise exception 'experience year can be less than 4 year';
	end if;
	return new;
end;
$$
language 'plpgsql';


create trigger t37
before insert on teacher
for each row
execute procedure fun1();

insert into teacher values('12','mr.abc','3');

=====================================================================================

          #slip_19

create table project(pno int primary key,pname varchar(20),ptype varchar(20),duration int);

create table employee(eno int primary key,ename varchar(20),salary float,joining_date date);

create table project_employee(pno int references project,eno int references employee,start_date date);



create or replace function fun1()returns trigger as
$$
declare
begin
	if new.salary<'0' then
	raise exception 'salary can not be less than zero';
	end if;
	return new;
end;
$$
language 'plpgsql';


create trigger t38
before insert on employee
for each row
execute procedure fun1();

insert into employee values('3','ram','-1','20-12-2000');

=====================================================================================

          #slip_22

create table area(aid int primary key,aname varchar(20),area_type varchar(20));

create table person(pno int primary key,pname varchar(20),birthdate date,income money);

select * from person;
select * from area;


create or replace function fun1()returns trigger as
$$
declare
begin
	raise exception 'person record is begin deleted';
end;
$$
language 'plpgsql';


create trigger t39
before delete on person
for each row
execute procedure fun1();

delete from person;


===========================================================================

            #slip_26

create table car(c_no int primary key,owner varchar(20),model varchar(20),color varchar(20));

create table driver(driver_no int primary key,driver_name varchar(20),license_no int,d_age int,salary float);

create table car_driver(c_no int references car,driver_no int references driver);


create or replace function fun1()returns trigger as
$$
declare
begin
	if new.salary<='0' then
	raise exception 'salary can not be negative or zero';
	end if;
	return new;
end;
$$
language 'plpgsql';


create trigger t40
before insert or update on driver
for each row
execute procedure fun1();

insert into driver values('2','abc','345','30','0');
insert into driver values('3','xyz','34785','20','-1');

=============================================================================

           #slip_30

create table customer(cno int primary key,cname varchar(20),city varchar(20));

create table account(a_no int primary key,a_type varchar(20),opening_date date,balance money,cno int references customer);
                  

create or replace function fun1()returns trigger as
$$
declare
begin
	if a_type='abc' then
	raise exception 'do not delete this record';
	end if;
	return new;
end;
$$
language 'plpgsql';


create trigger t41
before delete on account
for each row
execute procedure fun1();

delete from account where a_no=1;

================================================================================

          #slip_31
  
create table department(dno int primary key,dname varchar(20),city varchar(20));

create table employee(eno int primary key,ename varchar(20),salary money,dno int references department);
      
create or replace function fun1()returns trigger as
$$
declare
begin
	raise notice 'record is inserted';
	return new;
end;
$$
language 'plpgsql';


create trigger t43
after insert on employee
for each row
execute procedure fun1();

insert into employee values('123','ram','5000','3-12-1200');

=======================================================================================

           #slip_32

create table area(aname varchar(20) primary key,area_type varchar(20));

create table person(pnumber int primary key,pname varchar(20),birthdate date,income money,aname varchar(20) references area);


create or replace function fun1()returns trigger as
$$
declare
begin
	if aname='abc' then
	raise exception 'person record are deleted';
	end if;
	return new;
end;
$$
language 'plpgsql';


create trigger t44
before delete on person
for each row
execute procedure fun1();


====================================================================================

         #slip_33

create table car(c_no int primary key,owner varchar(20),model varchar(20),color varchar(20));

create table driver(driver_no int primary key,driver_name varchar(20),licence_no int d_age int,salary float);

create table car_driver(c_no int references car,driver_no int references driver);


create or replace function fun1()returns trigger as
$$
declare
begin
	if new.d_age<'21' then
	raise exception 'driver age can not be less than 21';
	end if;
	return new;
end;
$$
language 'plpgsql';


create trigger t45
before insert or update on driver
for each row
execute procedure fun1();


================================================================================

           #slip_35

create table project(pno int primary key,pname varchar(20),ptype varchar(20),duration int);

create table employee(empno int primary key,ename varchar(20),joining_date date);

create table project_employee(pno int references project,empno int employee,start_date date);

create or replace function fun1()returns trigger as
$$
declare
begin
	if new.d_age>'0' then
	raise exception 'duration is greater than zero';
	end if;
	return new;
end;
$$
language 'plpgsql';


create trigger t46
before insert or update on project
for each row
execute procedure fun1();



create or replace function disp_account()returns text as
$$
declare
c1 cursor for select * from customer;
c2 cursor for select * from account;
r1 customer%rowtype;
r2 account%rowtype;
begin
open c1;
 loop
   fetch c1 into r1;
   exit when not found;
   if r1.city='pune' then
   open c2;
   loop
   fetch c2 into r2;
   exit when not found;
    raise notice '% % % %',r2.accno,r2.acc_type,r2.opening_date,r2.balance;
    end loop;
   close c2;
   end if;
 end loop;
close c1;
end;
$$
language 'plpgsql';

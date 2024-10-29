create or replace function disp_account()returns int as
$$
declare 
c1 cursor for select * from customer;
c2 cursor for select * from account;
r1 record;
r2 record;
cnt int:=0;
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
        if  r1.cno=r2.cno then
        raise notice '% % % % %',r2.accno,r2.acc_type,r2.opening_date,r2.balance,r1.city;
      cnt:=cnt+1;
      end if;
      end loop;
      close c2;
   end if;
   end loop;
 close c1;
 return cnt;
end;
$$
language 'plpgsql';




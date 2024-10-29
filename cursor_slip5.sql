create or replace function disp_customer() returns int as
$$
declare
c1 cursor for select * from customer;
r1 customer%rowtype;
cnt int:=0;
begin
 open c1;
 loop
   fetch c1 into r1;
   exit when not found;
   if r1.cname='abc' then
       raise notice '% % %',r1.cno,r1.cname,r1.city;
    end if;
    cnt:=cnt+1;
 end loop;
 close c1;
 return cnt;
end;
$$
language 'plpgsql';

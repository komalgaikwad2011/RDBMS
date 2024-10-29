create or replace function disp_customer() returns int as
$$
declare
c1 cursor for select * from customer;
r1 record;
cnt int:=0;
begin
 open c1;
  loop
   fetch c1 into r1;
   exit when not found;
    if r1.city='pune' then
      raise notice 'customer name=% city=%',r1.cname,r1.city;
      cnt:=cnt+1;
    end if;
  end loop;
 close c1;
 return cnt;
end;
$$
language 'plpgsql';

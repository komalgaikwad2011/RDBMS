create or replace function disp_employee() returns int as
$$
declare
c1 cursor for select * from employee;
r1 record;
cnt int:=0;
begin
 open c1;
  loop
   fetch c1 into r1;
   exit when not found;
    if r1.salary >'500' then
      raise notice 'employee name=% salary=%',r1.ename,r1.salary;
      cnt:=cnt+1;
    end if;
  end loop;
 close c1;
 return cnt;
end;
$$
language 'plpgsql';

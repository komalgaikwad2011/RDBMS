create or replace function disp_owner() returns int as
$$
declare
c1 cursor for select * from car;
r1 record;
cnt int:=0;
begin
 open c1;
  loop
   fetch c1 into r1;
   exit when not found;
    if r1.color='black' then
      raise notice 'owner name=% color=%',r1.owner,r1.color;
      cnt:=cnt+1;
    end if;
  end loop;
 close c1;
 return cnt;
end;
$$
language 'plpgsql';

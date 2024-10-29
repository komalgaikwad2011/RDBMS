create or replace function disp_items()returns int as
$$
declare
c1 cursor for select * from item_supplier;
c2 cursor for select * from item;
r1 record;
r2 record;
cnt int:=0;
begin
 open c1;
  loop
   fetch c1 into r1;
   exit when not found;
    if r1.rate='400' then
     open c2;
      loop
      fetch c2 into r2;
      exit when not found;
       if r1.itemno=r2.itemno then
        raise notice 'item name=%',r2.itemname;
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

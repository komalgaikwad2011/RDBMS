create or replace function disp_person() returns int as
$$
declare
c1 cursor for select * from area;
c2 cursor for select * from person;
r1 record;
r2 record;
cnt int:=0;
begin
 open c1;
  loop
   fetch c1 into r1;
   exit when not found;
    if r1.area_type='urban' then
     open c2;
      loop
       fetch c2 into r2;
       exit when not found;
        if r1.aid=r2.aid then
        raise notice 'person name=% arae=%',r2.pname,r1.area_type;
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

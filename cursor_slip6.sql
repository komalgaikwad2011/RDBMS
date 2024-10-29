create or replace function disp_producer(mn text) returns text as
$$
declare
c1 cursor for select pname from producer where p_id in(select p_id from movie_producer where m_name=mn);
r1 producer.pname%type;
cnt int:=0;
begin
 open c1;
 loop
   fetch c1 into r1;
   exit when not found;
     raise notice '%',r1;
    cnt:=cnt+1;
 end loop;
 close c1;
 return cnt;
end;
$$
language 'plpgsql';

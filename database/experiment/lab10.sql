create or replace procedure proc
as
begin
  for i in 1 .. 1000000
    loop
      insert into order values(i,54045, to_date('2007-12-20 18:31:34', 'YYYY-MM-DD HH24:MI:SS'),1,127.28,0);
    end loop;
  commit;
end;

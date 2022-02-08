select * from stay where stay_id = 900;        --1
select * from stay where stay_id = 968818;     --2
select * from stay where stay_id = 435;        --2
select * from stay where stay_id = 979943;     --3
select * from stay where stay_id = 386;        --3
select * from stay where stay_id = 1019;       --4
select * from stay where stay_id = 1046;       --4
select * from stay where stay_id = 5637;       --5
select * from stay where stay_id = 5279;       --6
select * from stay where stay_id = 4111;       --6

select * from stay where stay_id = 900;        --1
select * from stay where stay_id = 968818;     --2
select * from stay where stay_id = 968683;     --2
select * from stay where stay_id = 435;        --2
select * from stay where stay_id = 979943;     --3
select * from stay where stay_id = 386;        --3
select * from stay where stay_id = 1019;       --4
select * from stay where stay_id = 1046;       --4
select * from stay where stay_id = 5637;       --5
select * from stay where stay_id = 5279;       -

select * from stay where stay_id = 900;        --1
select * from stay where stay_id = 968818;     --2
select * from stay where stay_id = 968683;     --2
select * from stay where stay_id = 435;        --2
select * from stay where stay_id = 979943;     --3
select * from stay where stay_id = 386;        --3
select * from stay where stay_id = 642;        --3
select * from stay where stay_id = 1046;       --4
select * from stay where stay_id = 5637;       --5
select * from stay where stay_id = 5279;       --6


create table t_stay_c as select * from t_stay where stay_id in (select stay_id from t_room group by stay_id having min(room_price) < 500);
select count(*) from t_stay_c;
drop table t_stay_c;

create or replace procedure searchForStayInMemory
as
    price NUMBER(10,2);
    s_id NUMBER(10,0);
    s_name VARCHAR2(4000);
    s_province VARCHAR2(1000);
    csr SYS_REFCURSOR;
    sq VARCHAR2(4000) :='select stay_id,stay_name,stay_province from t_stay_c
            where stay_id in (select stay_id from t_room group by stay_id having min(room_price) < 500)';
    sq2 VARCHAR2(4000) :='select stay_id,s_name,stay_province from t_stay
            where stay_id in (select stay_id from t_room group by stay_id having min(room_price) < 1000 and min(room_price)>500)';
begin 
    for i in 1 .. 7
        loop
            OPEN csr FOR sq;
              LOOP
                FETCH csr INTO s_id,s_name,s_province;
                EXIT WHEN csr%NOTFOUND;   
              END LOOP;
            CLOSE csr;
        end loop;
    for i in 1 .. 3
        loop
            OPEN csr FOR sq2;
              LOOP
            FETCH csr INTO s_id,s_name,s_province;
                EXIT WHEN csr%NOTFOUND;         
              END LOOP;
            CLOSE csr;
        end loop;
end;

            
            
create or replace procedure searchForStayInMemory
as
    s_id NUMBER(10,0);
    s_name VARCHAR2(4000);
    s_province VARCHAR2(100);
    csr SYS_REFCURSOR;
    sq VARCHAR2(4000) :='select stay_id,stay_name,stay_province  from t_stay
            where stay_id in (select stay_id from t_room group by stay_id having min(room_price) < 500)';
    sq2 VARCHAR2(4000) :='select stay_id,stay_name,stay_province from t_stay
            where stay_id in (select stay_id from t_room group by stay_id having min(room_price) < 1000 and min(room_price)>500)';
begin 
    for i in 1 .. 7
        loop
            OPEN csr FOR sq;
              LOOP
            FETCH csr INTO s_id, s_name, s_province;
                EXIT WHEN csr%NOTFOUND;         
              END LOOP;
            CLOSE csr;
        end loop;
    for i in 1 .. 3
        loop
            OPEN csr FOR sq2;
              LOOP
            FETCH csr INTO s_id, s_name, s_province;
                EXIT WHEN csr%NOTFOUND;         
              END LOOP;
            CLOSE csr;
        end loop;
end;


call searchForStayInMemory();
call searchForStayNotInMemory();

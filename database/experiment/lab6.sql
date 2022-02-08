select avg(total_price)
from t_order;

select stay_province, count(*) as order_num
from t_order join t_order_room on t_order.order_id=t_order_room.order_id
join t_stay on t_order_room.stay_id=t_stay.stay_id
group by stay_province
having count(*)>10000;

CREATE OR REPLACE PROCEDURE get_price_report
IS
v_sql VARCHAR2(300);
v_price NUMBER(20,10);
csr SYS_REFCURSOR;
BEGIN
v_sql:='select avg(total_price) as v_price
from t_order';
OPEN csr FOR v_sql;
  LOOP
FETCH csr INTO v_price;
    EXIT WHEN csr%NOTFOUND;         
    DBMS_OUTPUT.PUT_LINE('v_price''' || v_price || '''  ');
  END LOOP;
  CLOSE csr;
END;

CREATE OR REPLACE PROCEDURE get_order_report
IS
v_sql VARCHAR2(300);
v_province VARCHAR2(100);
v_order_num VARCHAR2(100);
csr SYS_REFCURSOR;
BEGIN
v_sql:='select stay_province, count(*) as order_num
from t_order join t_order_room on t_order.order_id=t_order_room.order_id
join t_stay on t_order_room.stay_id=t_stay.stay_id
group by stay_province
having count(*)>10000';
OPEN csr FOR v_sql;
  LOOP
    FETCH csr INTO v_province, v_order_num;
    EXIT WHEN csr%NOTFOUND;         
    DBMS_OUTPUT.PUT_LINE('v_province=''' || v_province || '''  ' ||
                         'v_order_num=''' || v_order_num || '''');
  END LOOP;
  CLOSE csr;
END;

call get_price_report();

call get_order_report();


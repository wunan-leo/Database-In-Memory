CREATE OR REPLACE PROCEDURE INSERT_INTO_FAVORITE(customer_id IN NUMBER, favorite_name IN VARCHAR2)
IS
BEGIN
if customer_id IS NULL then
  return;
end if;
INSERT INTO T_FAVORITE VALUES(FAVORITE_INC.nextval, customer_id, favorite_name);
commit;
END;

CREATE OR REPLACE PROCEDURE MULTI_INSERT_INTO_FAVORITE(job_count IN NUMBER)
IS
tmp_jobno NUMBER;
BEGIN
FOR I in 1..job_count LOOP
  dbms_job.submit(tmp_jobno, 'begin INSERT_INTO_FAVORITE(I, test_name_'||I||'); end; ');
END LOOP;
END;


CREATE OR REPLACE PROCEDURE BUY_INSERT_TEST(
customer_id IN NUMBER,
order_time IN DATE,
customer_num IN NUMBER,
total_price IN NUMBER,
order_status IN NUMBER,
room_id IN NUMBER,
start_time IN DATE,
end_time IN DATE,
price IN NUMBER,
)
IS
order_id NUMBER;
stay_id NUMBER;
stay_cap NUMBER:
BEGIN
INSERT INTO T_ORDER VALUES(ORDER_INC.nextval, customer_id, order_time, customer_num, total_price, order_status);
SELECT o.order_id INTO order_id FROM T_ORDER o WHERE o.order_time = order_time;
SELECT s.stay_id, s.stay_capacity INTO stay_id, stay_cap FROM T_STAY s WHERE s.room_id = room_id;
stay_cap = stay_cap – 1;
INSERT INTO T_ORDER_ROOM VALUES(order_id, stay_id, room_id, start_time, end_time, price);
UPDATE T_STAY s SET s.stay_capacity = stay_cap WHERE s.room_id = room_id;
commit;
END;

CREATE OR REPLACE PROCEDURE MULTI_BUY_INSERT_TEST(job_count IN NUMBER)
IS
tmp_jobno NUMBER;
BEGIN
FOR I in 1..job_count LOOP
  dbms_job.submit(tmp_jobno, 'begin BUY_INSERT_TEST(I, TEST_CUSTOMER_ID, TEST_ORDER_TIME, TEST_CUSTOMER_NUM, TEST_TOTAL_PRICE, TEST_ORDER_STATUS, TEST_ROOM_ID, TEST_START_TIME, TEST_END_TIME, TEST_PRICE); end; ');
END LOOP;
END;

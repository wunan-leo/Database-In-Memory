SELECT distinct to_char(ORDER_TIME,'yyyy') FROM T_ORDER;
/*数据分区 年限2018-2023*/
/*part1 2018,2019 part2 2020,2021, part3 2022, 2023*/
select * 
from T_ORDER 
where customer_id = '10002' and order_time >= to_date('2020-01-01','yyyy-mm-dd') and order_time <= to_date('2021-12-10','yyyy-mm-dd');

CREATE TABLE T_ORDER_PARTITION(
    ORDER_ID NUMBER(10,0) PRIMARY KEY,
    CUSTOMER_ID NUMBER(10,0),
    ORDER_TIME DATE,
    CUSTOMER_NUM NUMBER,
    TOTAL_PRICE NUMERIC(10,2),
    ORDER_STATUS NUMBER(2,0)
)PARTITION BY RANGE(ORDER_TIME)
(
    PARTITION T_ORDER_PART1 VALUES LESS THAN (TO_DATE('01-01-2019','DD-MM-YYYY')),
    PARTITION T_ORDER_PART2 VALUES LESS THAN (TO_DATE('01-01-2021','DD-MM-YYYY')) ,
    PARTITION T_ORDER_PART3 VALUES LESS THAN (TO_DATE('01-01-2023','DD-MM-YYYY')),
    PARTITION T_ORDER_PART4 VALUES LESS THAN (MAXVALUE)
);

CREATE TABLE T_COMMENT_PARTITION(
    COMMENT_ID NUMBER PRIMARY KEY,
    COMMENT_CONTENT VARCHAR2(100),
    COMMENT_GRADE NUMBER,
    COMMENT_TIME DATE,
    ORDER_ID NUMBER
)PARTITION BY LIST(COMMENT_CONTENT)
(
    PARTITION T_COMMENT_PART1 VALUES (NULL),
    PARTITION T_COMMENT_PART2 VALUES (DEFAULT) 
);

select customer_id,comment_content,comment_grade,comment_time
from t_comment,t_order,t_order_room 
where t_comment.order_id = t_order.order_id and t_order.order_id = t_order_room.order_id and stay_id = '1000' and comment_content is not null;

select count(*)
from t_comment
where comment_content is not null;









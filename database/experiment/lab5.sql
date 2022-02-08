DROP TYPE type_order_report;
DROP TYPE t_type_order_report;
/*获得订单统计信息的函数*/
CREATE OR REPLACE TYPE type_order_report as OBJECT
(
CUSTOMER_ID NUMBER,
ORDER_COUNT NUMBER,
ORDER_TOTAL_PRICE NUMERIC(10,2),
ORDER_MAX_PRICE NUMERIC(10,2)
);
CREATE OR REPLACE TYPE t_type_order_report as table of type_order_report;

CREATE OR REPLACE FUNCTION CUSTOMER_ORDER_REPORT(c_id NUMBER)
RETURN t_type_order_report
AS
    a_type_order_report t_type_order_report:=t_type_order_report();
    i number :=0;
BEGIN
    for v_result in (
        SELECT T_ORDER.customer_id,COUNT(T_ORDER.customer_id) as ORDER_COUNT, SUM(T_ORDER.total_price) as order_total_price, MAX(T_ORDER.total_price) as order_max_price
        FROM T_ORDER
        WHERE T_ORDER.customer_id = c_id
        GROUP BY T_ORDER.customer_id) loop
        a_type_order_report.extend;
        i := i+1;
        a_type_order_report(i) := type_order_report(v_result.customer_id,v_result.order_count,v_result.order_total_price,v_result.order_max_price);
    end loop;
    return a_type_order_report;
END;


/*获得统计省份信息*/
CREATE OR REPLACE TYPE type_province_report as OBJECT
(
CUSTOMER_ID NUMBER,
STAY_PROVINCE VARCHAR2(25),
PROVINCE_COUNT NUMBER
);
CREATE OR REPLACE TYPE t_type_province_report as table of type_province_report;
CREATE OR REPLACE FUNCTION CUSTOMER_PROVINCE_REPORT(c_id NUMBER)
RETURN t_type_province_report
AS
    a_type_province_report t_type_province_report:=t_type_province_report();
    i number :=0;
BEGIN
    for v_result in (
    SELECT T_ORDER.customer_id, T_STAY.stay_province, COUNT(T_STAY.stay_province) as province_count
    FROM T_ORDER,T_ORDER_ROOM,T_STAY
    WHERE T_ORDER.customer_id = c_id AND T_ORDER.order_id = T_ORDER_ROOM.order_id and T_ORDER_ROOM.stay_id = T_STAY.stay_id
    HAVING COUNT(T_STAY.stay_province)=
    (SELECT MAX(COUNT(T_STAY.stay_province)) FROM T_ORDER,T_ORDER_ROOM,T_STAY WHERE T_ORDER.customer_id = 1 AND T_ORDER.order_id = T_ORDER_ROOM.order_id and T_ORDER_ROOM.stay_id = T_STAY.stay_id GROUP BY T_STAY.stay_province) 
    GROUP BY T_ORDER.customer_id,T_STAY.stay_province
    ) loop
        a_type_province_report.extend;
        i := i+1;
        a_type_province_report(i) := type_province_report(v_result.customer_id,v_result.stay_province,v_result.province_count);
    end loop;
    return a_type_province_report;
END;


/*获得最大金额的订单信息*/
CREATE OR REPLACE TYPE type_max_order_report as OBJECT
(
STAY_NAME VARCHAR2(4000),
ROOM_ID NUMBER,
ROOM_PRICE NUMERIC(10,2),
ROOM_PHOTO VARCHAR2(200),
START_TIME DATE,
END_TIME DATE
);
CREATE OR REPLACE TYPE t_type_max_order_report as table of type_max_order_report;

CREATE OR REPLACE FUNCTION CUSTOMER_MAX_ORDER_REPORT(c_id NUMBER, m_price NUMERIC)
RETURN t_type_max_order_report
AS
    a_type_max_order_report t_type_max_order_report:=t_type_max_order_report();
    i number :=0;
BEGIN
    for v_result in (
    SELECT T_STAY.stay_name, T_ROOM.room_id, T_ROOM.room_price, T_ROOM.room_photo, T_ORDER_ROOM.start_time, T_ORDER_ROOM.end_time
    FROM T_ORDER_ROOM,T_ORDER,T_ROOM,T_STAY
    WHERE T_ORDER.customer_id = c_id and t_order.total_price = m_price and T_ORDER_ROOM.order_id = T_ORDER.order_id
    and T_ORDER_ROOM.room_id = T_ROOM.room_id and T_ORDER_ROOM.stay_id = T_STAY.stay_id and T_ROOM.stay_id = T_ORDER_ROOM.stay_id
    ) loop
        a_type_max_order_report.extend;
        i := i+1;
        a_type_max_order_report(i) := type_max_order_report(v_result.stay_name,v_result.room_id,v_result.room_price,v_result.room_photo,v_result.start_time,v_result.end_time);
    end loop;
    return a_type_max_order_report;
END;

SELECT * FROM TABLE(CUSTOMER_ORDER_REPORT(2));
SELECT * FROM TABLE(CUSTOMER_PROVINCE_REPORT(1));
SELECT * FROM TABLE(CUSTOMER_MAX_ORDER_REPORT(1,6829.17));
SELECT * FROM TABLE(CUSTOMER_ORDER_REPORT(1)) a natural join TABLE(CUSTOMER_PROVINCE_REPORT(1)) b,TABLE(customer_max_order_report(1,6829.17)) c

CREATE OR REPLACE TYPE type_data_report as OBJECT
(
CUSTOMER_ID NUMBER,
ORDER_COUNT NUMBER,
ORDER_TOTAL_PRICE NUMERIC(10,2),
ORDER_MAX_PRICE NUMERIC(10,2),
STAY_PROVINCE VARCHAR2(25),
PROVINCE_COUNT NUMBER,
STAY_NAME VARCHAR2(4000),
ROOM_ID NUMBER,
ROOM_PRICE NUMERIC(10,2),
ROOM_PHOTO VARCHAR2(200),
START_TIME DATE,
END_TIME DATE
);
CREATE OR REPLACE TYPE t_type_data_report as table of type_data_report;

DROP PROCEDURE CUSTOMER_DATA_REPORT;

CREATE OR REPLACE FUNCTION CUSTOMER_DATA_REPORT(c_id NUMBER)
RETURN t_type_data_report
as
    a_type_data_report t_type_data_report:=t_type_data_report();
    price numeric(10,2);
    i number :=0;
BEGIN
    SELECT order_max_price INTO price FROM TABLE(CUSTOMER_ORDER_REPORT(c_id));
    for v_res in (
    SELECT * FROM (TABLE(CUSTOMER_ORDER_REPORT(c_id)) a natural join TABLE(CUSTOMER_PROVINCE_REPORT(c_id)) b),TABLE(customer_max_order_report(c_id,price)) c
    )loop
        a_type_data_report.extend;
        i := i+1;
        a_type_data_report(i) := type_data_report(v_res.customer_id,v_res.order_count,v_res.order_total_price,v_res.order_max_price,
        v_res.stay_province,v_res.province_count,v_res.stay_name,v_res.room_id,v_res.room_price,v_res.room_photo,v_res.start_time,v_res.end_time);
    end loop;
    return a_type_data_report;
END;

SELECT * FROM TABLE(CUSTOMER_DATA_REPORT(1));


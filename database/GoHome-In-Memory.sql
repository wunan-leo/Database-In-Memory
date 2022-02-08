/*
 Navicat Premium Data Transfer

 Source Server         : oracle-in-memory
 Source Server Type    : Oracle
 Source Server Version : 120200
 Source Host           : 180.76.158.125:1521
 Source Schema         : MEMORY

 Target Server Type    : Oracle
 Target Server Version : 120200
 File Encoding         : 65001

 Date: 09/01/2022 17:45:04
*/


-- ----------------------------
-- Table structure for EBA_SAMPLE_MAP_AIRPORTS
-- ----------------------------
DROP TABLE "MEMORY"."EBA_SAMPLE_MAP_AIRPORTS";
CREATE TABLE "MEMORY"."EBA_SAMPLE_MAP_AIRPORTS" (
  "ID" NUMBER VISIBLE NOT NULL,
  "IATA_CODE" VARCHAR2(10 BYTE) VISIBLE,
  "AIRPORT_TYPE" VARCHAR2(255 BYTE) VISIBLE,
  "AIRPORT_NAME" VARCHAR2(255 BYTE) VISIBLE,
  "CITY" VARCHAR2(255 BYTE) VISIBLE,
  "STATE_NAME" VARCHAR2(255 BYTE) VISIBLE,
  "ACTIVATION_DATE" VARCHAR2(50 BYTE) VISIBLE,
  "ACTIVATION_DATE_DT" DATE VISIBLE,
  "ELEVATION" NUMBER VISIBLE,
  "DIST_CITY_TO_AIRPORT" NUMBER VISIBLE,
  "LAND_AREA_COVERED" NUMBER VISIBLE,
  "COMMERCIAL_OPS" NUMBER VISIBLE,
  "AIR_TAXI_OPS" NUMBER VISIBLE,
  "GEOMETRY" "MDSYS"."SDO_GEOMETRY" VISIBLE
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for EBA_SAMPLE_MAP_SIMPLE_STATES
-- ----------------------------
DROP TABLE "MEMORY"."EBA_SAMPLE_MAP_SIMPLE_STATES";
CREATE TABLE "MEMORY"."EBA_SAMPLE_MAP_SIMPLE_STATES" (
  "ID" NUMBER VISIBLE NOT NULL,
  "NAME" VARCHAR2(255 BYTE) VISIBLE,
  "STATE_CODE" VARCHAR2(2 BYTE) VISIBLE,
  "LAND_AREA" NUMBER VISIBLE,
  "WATER_AREA" NUMBER VISIBLE,
  "GEOMETRY" "PUBLIC"."SDO_GEOMETRY" VISIBLE
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for EBA_SAMPLE_MAP_STATES
-- ----------------------------
DROP TABLE "MEMORY"."EBA_SAMPLE_MAP_STATES";
CREATE TABLE "MEMORY"."EBA_SAMPLE_MAP_STATES" (
  "ID" NUMBER VISIBLE NOT NULL,
  "NAME" VARCHAR2(255 BYTE) VISIBLE,
  "STATE_CODE" VARCHAR2(2 BYTE) VISIBLE,
  "LAND_AREA" NUMBER VISIBLE,
  "WATER_AREA" NUMBER VISIBLE,
  "GEOMETRY" "PUBLIC"."SDO_GEOMETRY" VISIBLE
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for HTMLDB_PLAN_TABLE
-- ----------------------------
DROP TABLE "MEMORY"."HTMLDB_PLAN_TABLE";
CREATE TABLE "MEMORY"."HTMLDB_PLAN_TABLE" (
  "STATEMENT_ID" VARCHAR2(30 BYTE) VISIBLE,
  "PLAN_ID" NUMBER VISIBLE,
  "TIMESTAMP" DATE VISIBLE,
  "REMARKS" VARCHAR2(4000 BYTE) VISIBLE,
  "OPERATION" VARCHAR2(30 BYTE) VISIBLE,
  "OPTIONS" VARCHAR2(255 BYTE) VISIBLE,
  "OBJECT_NODE" VARCHAR2(128 BYTE) VISIBLE,
  "OBJECT_OWNER" VARCHAR2(128 BYTE) VISIBLE,
  "OBJECT_NAME" VARCHAR2(128 BYTE) VISIBLE,
  "OBJECT_ALIAS" VARCHAR2(261 BYTE) VISIBLE,
  "OBJECT_INSTANCE" NUMBER VISIBLE,
  "OBJECT_TYPE" VARCHAR2(128 BYTE) VISIBLE,
  "OPTIMIZER" VARCHAR2(255 BYTE) VISIBLE,
  "SEARCH_COLUMNS" NUMBER VISIBLE,
  "ID" NUMBER VISIBLE,
  "PARENT_ID" NUMBER VISIBLE,
  "DEPTH" NUMBER VISIBLE,
  "POSITION" NUMBER VISIBLE,
  "COST" NUMBER VISIBLE,
  "CARDINALITY" NUMBER VISIBLE,
  "BYTES" NUMBER VISIBLE,
  "OTHER_TAG" VARCHAR2(255 BYTE) VISIBLE,
  "PARTITION_START" VARCHAR2(255 BYTE) VISIBLE,
  "PARTITION_STOP" VARCHAR2(255 BYTE) VISIBLE,
  "PARTITION_ID" NUMBER VISIBLE,
  "OTHER" LONG VISIBLE,
  "DISTRIBUTION" VARCHAR2(30 BYTE) VISIBLE,
  "CPU_COST" NUMBER VISIBLE,
  "IO_COST" NUMBER VISIBLE,
  "TEMP_SPACE" NUMBER VISIBLE,
  "ACCESS_PREDICATES" VARCHAR2(4000 BYTE) VISIBLE,
  "FILTER_PREDICATES" VARCHAR2(4000 BYTE) VISIBLE,
  "PROJECTION" VARCHAR2(4000 BYTE) VISIBLE,
  "TIME" NUMBER VISIBLE,
  "QBLOCK_NAME" VARCHAR2(128 BYTE) VISIBLE
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for TEST
-- ----------------------------
DROP TABLE "MEMORY"."TEST";
CREATE TABLE "MEMORY"."TEST" (
  "ID" NUMBER VISIBLE NOT NULL
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON TABLE "MEMORY"."TEST" IS '测试';

-- ----------------------------
-- Table structure for T_COMMENT
-- ----------------------------
DROP TABLE "MEMORY"."T_COMMENT";
CREATE TABLE "MEMORY"."T_COMMENT" (
  "COMMENT_ID" NUMBER VISIBLE NOT NULL,
  "COMMENT_CONTENT" VARCHAR2(100 BYTE) VISIBLE,
  "COMMENT_GRADE" NUMBER VISIBLE NOT NULL,
  "COMMENT_TIME" DATE VISIBLE DEFAULT sysdate,
  "ORDER_ID" NUMBER VISIBLE NOT NULL
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for T_CUSTOMER
-- ----------------------------
DROP TABLE "MEMORY"."T_CUSTOMER";
CREATE TABLE "MEMORY"."T_CUSTOMER" (
  "CUSTOMER_ID" NUMBER(10,0) VISIBLE NOT NULL,
  "CUSTOMER_USERNAME" VARCHAR2(15 BYTE) VISIBLE DEFAULT 'customer'  NOT NULL,
  "CUSTOMER_PASSWORD" VARCHAR2(20 BYTE) VISIBLE NOT NULL,
  "CUSTOMER_PHONE" VARCHAR2(11 BYTE) VISIBLE NOT NULL
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for T_FAVORITE
-- ----------------------------
DROP TABLE "MEMORY"."T_FAVORITE";
CREATE TABLE "MEMORY"."T_FAVORITE" (
  "FAVORITE_ID" NUMBER(10,0) VISIBLE NOT NULL,
  "CUSTOMER_ID" NUMBER(10,0) VISIBLE,
  "FAVORITE_NAME" VARCHAR2(30 BYTE) VISIBLE NOT NULL
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for T_HOST
-- ----------------------------
DROP TABLE "MEMORY"."T_HOST";
CREATE TABLE "MEMORY"."T_HOST" (
  "HOST_ID" NUMBER(10,0) VISIBLE NOT NULL,
  "HOST_USERNAME" VARCHAR2(15 BYTE) VISIBLE DEFAULT 'host'  NOT NULL,
  "HOST_PASSWORD" VARCHAR2(20 BYTE) VISIBLE NOT NULL,
  "HOST_PHONE" VARCHAR2(11 BYTE) VISIBLE NOT NULL
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for T_HOST_ORDER
-- ----------------------------
DROP TABLE "MEMORY"."T_HOST_ORDER";
CREATE TABLE "MEMORY"."T_HOST_ORDER" (
  "HOST_ID" NUMBER(10,0) VISIBLE NOT NULL,
  "ORDER_ID" NUMBER(10,0) VISIBLE NOT NULL
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for T_ORDER
-- ----------------------------
DROP TABLE "MEMORY"."T_ORDER";
CREATE TABLE "MEMORY"."T_ORDER" (
  "ORDER_ID" NUMBER(10,0) VISIBLE NOT NULL,
  "CUSTOMER_ID" NUMBER(10,0) VISIBLE,
  "ORDER_TIME" DATE VISIBLE DEFAULT sysdate  NOT NULL,
  "CUSTOMER_NUM" NUMBER VISIBLE DEFAULT 1,
  "TOTAL_PRICE" NUMBER(10,2) VISIBLE NOT NULL,
  "ORDER_STATUS" NUMBER(2,0) VISIBLE NOT NULL
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for T_ORDER_ROOM
-- ----------------------------
DROP TABLE "MEMORY"."T_ORDER_ROOM";
CREATE TABLE "MEMORY"."T_ORDER_ROOM" (
  "ORDER_ID" NUMBER(10,0) VISIBLE NOT NULL,
  "STAY_ID" NUMBER(10,0) VISIBLE NOT NULL,
  "ROOM_ID" NUMBER(10,0) VISIBLE NOT NULL,
  "START_TIME" DATE VISIBLE NOT NULL,
  "END_TIME" DATE VISIBLE NOT NULL,
  "PRICE" NUMBER(10,2) VISIBLE NOT NULL
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for T_ROOM
-- ----------------------------
DROP TABLE "MEMORY"."T_ROOM";
CREATE TABLE "MEMORY"."T_ROOM" (
  "STAY_ID" NUMBER(10,0) VISIBLE NOT NULL,
  "ROOM_ID" NUMBER(10,0) VISIBLE NOT NULL,
  "ROOM_PRICE" NUMBER(10,2) VISIBLE NOT NULL,
  "ROOM_PHOTO" VARCHAR2(200 BYTE) VISIBLE DEFAULT 'http'  NOT NULL
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for T_STAY
-- ----------------------------
DROP TABLE "MEMORY"."T_STAY";
CREATE TABLE "MEMORY"."T_STAY" (
  "STAY_ID" NUMBER(10,0) VISIBLE NOT NULL,
  "HOST_ID" NUMBER(10,0) VISIBLE,
  "STAY_NAME" VARCHAR2(4000 BYTE) VISIBLE NOT NULL,
  "STAY_PROVINCE" VARCHAR2(25 BYTE) VISIBLE NOT NULL,
  "STAY_CAPACITY" NUMBER VISIBLE DEFAULT 1  NOT NULL,
  "ROOM_NUM" NUMBER VISIBLE DEFAULT 0  NOT NULL,
  "STAY_DESCRIPTION" VARCHAR2(4000 BYTE) VISIBLE,
  "STAY_LONGITUDE" NUMBER(6,2) VISIBLE NOT NULL,
  "STAY_LATITUDE" NUMBER(6,2) VISIBLE NOT NULL,
  "HOST_USERNAME" VARCHAR2(15 BYTE) VISIBLE
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for T_STAY_FAVORITE
-- ----------------------------
DROP TABLE "MEMORY"."T_STAY_FAVORITE";
CREATE TABLE "MEMORY"."T_STAY_FAVORITE" (
  "FAVORITE_ID" NUMBER(10,0) VISIBLE NOT NULL,
  "STAY_ID" NUMBER(10,0) VISIBLE NOT NULL
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for T_STAY_HOT
-- ----------------------------
DROP TABLE "MEMORY"."T_STAY_HOT";
CREATE TABLE "MEMORY"."T_STAY_HOT" (
  "STAY_ID" NUMBER(10,0) VISIBLE,
  "PHOTO" VARCHAR2(200 BYTE) VISIBLE,
  "PRICE" NUMBER VISIBLE,
  "STAY_NAME" VARCHAR2(4000 BYTE) VISIBLE NOT NULL,
  "STAY_DESCRIPTION" VARCHAR2(4000 BYTE) VISIBLE,
  "STAY_CAPACITY" NUMBER VISIBLE NOT NULL,
  "ROOM_NUM" NUMBER VISIBLE NOT NULL
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for T_STAY_PRICE
-- ----------------------------
DROP TABLE "MEMORY"."T_STAY_PRICE";
CREATE TABLE "MEMORY"."T_STAY_PRICE" (
  "STAY_ID" NUMBER(10,0) VISIBLE,
  "PHOTO" VARCHAR2(200 BYTE) VISIBLE,
  "PRICE" NUMBER VISIBLE,
  "STAY_NAME" VARCHAR2(4000 BYTE) VISIBLE NOT NULL,
  "STAY_DESCRIPTION" VARCHAR2(4000 BYTE) VISIBLE,
  "STAY_CAPACITY" NUMBER VISIBLE NOT NULL,
  "ROOM_NUM" NUMBER VISIBLE NOT NULL
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for T_STAY_PRICE_DESC
-- ----------------------------
DROP TABLE "MEMORY"."T_STAY_PRICE_DESC";
CREATE TABLE "MEMORY"."T_STAY_PRICE_DESC" (
  "STAY_ID" NUMBER(10,0) VISIBLE,
  "PHOTO" VARCHAR2(200 BYTE) VISIBLE,
  "PRICE" NUMBER VISIBLE,
  "STAY_NAME" VARCHAR2(4000 BYTE) VISIBLE NOT NULL,
  "STAY_DESCRIPTION" VARCHAR2(4000 BYTE) VISIBLE,
  "STAY_CAPACITY" NUMBER VISIBLE NOT NULL,
  "ROOM_NUM" NUMBER VISIBLE NOT NULL
)
TABLESPACE "USERS"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- View structure for V_HOST_ORDER
-- ----------------------------
CREATE OR REPLACE VIEW "MEMORY"."V_HOST_ORDER" AS select s.STAY_ID, s.STAY_NAME, o.ORDER_ID, o.ORDER_TIME, o.CUSTOMER_NUM, o.TOTAL_PRICE, o.ORDER_STATUS, h.HOST_ID, h.HOST_USERNAME
from T_ORDER o inner join T_ORDER_ROOM ro on o.ORDER_ID = ro.ORDER_ID
    inner join T_STAY s on ro.STAY_ID = s.STAY_ID
    inner join T_HOST h on s.HOST_ID = h.HOST_ID;

-- ----------------------------
-- View structure for V_ORDER_TIME
-- ----------------------------
CREATE OR REPLACE VIEW "MEMORY"."V_ORDER_TIME" AS select order_id, min(start_time) st, max(end_time) et from t_order_room group by order_id;

-- ----------------------------
-- View structure for V_SIP
-- ----------------------------
CREATE OR REPLACE VIEW "MEMORY"."V_SIP" AS select STAY_ID,max(room_photo) photo, min(ROOM_PRICE) price from  T_ROOM group by STAY_ID;

-- ----------------------------
-- View structure for V_STAY_COMMENT
-- ----------------------------
CREATE OR REPLACE VIEW "MEMORY"."V_STAY_COMMENT" AS select COMMENT_CONTENT, COMMENT_TIME, CUSTOMER_USERNAME, STAY_ID from
t_stay natural join T_ORDER natural join T_COMMENT natural join T_CUSTOMER;

-- ----------------------------
-- View structure for V_STAY_PRICE
-- ----------------------------
CREATE OR REPLACE VIEW "MEMORY"."V_STAY_PRICE" AS with SIp as (select STAY_ID,max(room_photo) photo, min(ROOM_PRICE) price from  T_ROOM group by STAY_ID)
select STAY_ID,photo, price, STAY_NAME, STAY_DESCRIPTION, STAY_CAPACITY, ROOM_NUM
from T_STAY natural join SIp
where ROWNUM <= 100
order by price;

-- ----------------------------
-- Function structure for CUSTOMER_DATA_REPORT
-- ----------------------------
CREATE OR REPLACE
FUNCTION "MEMORY"."CUSTOMER_DATA_REPORT" AS
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
/

-- ----------------------------
-- Function structure for CUSTOMER_MAX_ORDER_REPORT
-- ----------------------------
CREATE OR REPLACE
FUNCTION "MEMORY"."CUSTOMER_MAX_ORDER_REPORT" AS
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
/

-- ----------------------------
-- Function structure for CUSTOMER_ORDER_REPORT
-- ----------------------------
CREATE OR REPLACE
FUNCTION "MEMORY"."CUSTOMER_ORDER_REPORT" AS
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
/

-- ----------------------------
-- Function structure for CUSTOMER_PROVINCE_REPORT
-- ----------------------------
CREATE OR REPLACE
FUNCTION "MEMORY"."CUSTOMER_PROVINCE_REPORT" AS
BEGIN
    for v_result in (
    SELECT T_ORDER.customer_id, T_STAY.stay_province, COUNT(T_STAY.stay_province) as province_count
    FROM T_ORDER,T_ORDER_ROOM,T_STAY
    WHERE T_ORDER.customer_id = c_id AND T_ORDER.order_id = T_ORDER_ROOM.order_id and T_ORDER_ROOM.stay_id = T_STAY.stay_id
    HAVING COUNT(T_STAY.stay_province)=
    (SELECT MAX(COUNT(T_STAY.stay_province)) FROM T_ORDER,T_ORDER_ROOM,T_STAY WHERE T_ORDER.customer_id = c_id AND T_ORDER.order_id = T_ORDER_ROOM.order_id and T_ORDER_ROOM.stay_id = T_STAY.stay_id GROUP BY T_STAY.stay_province) 
    GROUP BY T_ORDER.customer_id,T_STAY.stay_province
    ) loop
        a_type_province_report.extend;
        i := i+1;
        a_type_province_report(i) := type_province_report(v_result.customer_id,v_result.stay_province,v_result.province_count);
    end loop;
    return a_type_province_report;
END;
/

-- ----------------------------
-- Function structure for CUSTOMER_REPORT
-- ----------------------------

-- ----------------------------
-- Function structure for EBA_SAMPLE_MAP_LOAD_DATA
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "MEMORY"."EBA_SAMPLE_MAP_LOAD_DATA" AS
begin
    if p_load_from = 'FILE' then
        if p_states_file_name is not null then
            select blob_content
              into l_states_json
              from apex_application_temp_files
             where name = p_states_file_name;
        end if;
        if p_airports_file_name is not null then
            select blob_content
              into l_airports_json
              from apex_application_temp_files
             where name = p_airports_file_name;
        end if;
    else
        l_states_json := apex_web_service.make_rest_request_b(
                             p_url            => 'https://github.com/oracle/apex/tree/main/sample-apps/sample-maps/us-states.json',
                             p_http_method    => 'GET',
                             p_proxy_override => p_proxy_override );
        
        l_airports_json := apex_web_service.make_rest_request_b(
                               p_url            => 'https://github.com/oracle/apex/tree/main/sample-apps/sample-maps/airports.json',
                               p_http_method    => 'GET',
                               p_proxy_override => p_proxy_override );
    end if;
    if l_states_json is not null then
        delete from eba_sample_map_states;
        delete from eba_sample_map_simple_states;
        insert into eba_sample_map_states (id, name, state_code, land_area, water_area, geometry )
        ( 
            select id, name, state_code, land_area, water_area, geometry
              from json_table(
                       l_states_json format json,
                       '$[*]'
                       columns (
                                 id          number             path '$.id',
                                 name        varchar2(255)      path '$.name',
                                 state_code  varchar2(255)      path '$.state_code',
                                 land_area   number             path '$.land_area',
                                 water_area  number             path '$.water_area',
                                 geometry    mdsys.sdo_geometry path '$.geometry' ) ) );
        insert into eba_sample_map_simple_states (id, name, state_code, land_area, water_area, geometry )
        ( select id, name, state_code, land_area, water_area, mdsys.sdo_util.simplify( geometry, 75 ) 
            from eba_sample_map_states);
    end if;
    if l_airports_json is not null then
        delete from eba_sample_map_airports;
        insert into eba_sample_map_airports (id, iata_code, airport_type, airport_name, city, state_name, activation_date, activation_date_dt, elevation, dist_city_to_airport, land_area_covered, commercial_ops, air_taxi_ops, geometry )
            (select rownum, iata_code, airport_type, airport_name, city, state_name, to_char(to_date(activation_date, 'YYYY-MM-DD"T"HH24:MI:SS"Z"'), 'MON-RR'),to_date(activation_date, 'YYYY-MM-DD"T"HH24:MI:SS"Z"'), elevation, dist_city_to_airport, land_area_covered, commercial_ops, air_taxi_ops, geometry
               from json_table(
                        l_airports_json format json,
                        '$[*]'
                        columns(
                                 iata_code             varchar2(255)      path '$.iata',
                                 airport_type          varchar2(255)      path '$.airport_type',
                                 airport_name          varchar2(255)      path '$.airport_name',
                                 city                  varchar2(255)      path '$.city',
                                 state_name            varchar2(255)      path '$.state_name',
                                 activation_date       varchar2(50)       path '$.act_date_dt',
                                 elevation             number             path '$.elevation',
                                 dist_city_to_airport  number             path '$.dist_city_to_airport',
                                 land_area_covered     number             path '$.land_area',
                                 commercial_ops        number             path '$.commercial_ops',
                                 air_taxi_ops          number             path '$.air_taxi_ops',
                                 geometry              sdo_geometry       path '$.geometry' ) ) );
    end if;
end;
/

-- ----------------------------
-- Function structure for FOR_TEST
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "MEMORY"."FOR_TEST" AS
BEGIN
INSERT INTO FORTEST VALUES(t_id, fid, f_name);
END;
/

-- ----------------------------
-- Function structure for FOR_TESTT
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "MEMORY"."FOR_TESTT" AS
BEGIN
INSERT INTO FORTEST VALUES(tt_id, ff_id, ff_name);
END;
'''
'''
create or replace procedure multi_fortest(job_count in number)
is
job_no number;
BEGIN
FOR I in 
'''
begin
for_testt(1, 1, test);
end;
/

-- ----------------------------
-- Function structure for GET_ORDER_REPORT
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "MEMORY"."GET_ORDER_REPORT" AS
BEGIN
v_sql:='select stay_province, count(*) as order_num
from t_order natural join t_order_room natural join t_stay
group by stay_province
having count(*) > 10000';
OPEN csr FOR v_sql;
  LOOP
    FETCH csr INTO v_province, v_order_num;
    EXIT WHEN csr%NOTFOUND;         
    DBMS_OUTPUT.PUT_LINE('v_province=''' || v_province || '''  ' ||
                         'v_order_num=''' || v_order_num || '''');
  END LOOP;
  CLOSE csr;
END;
/

-- ----------------------------
-- Function structure for GET_PRICE_REPORT
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "MEMORY"."GET_PRICE_REPORT" AS
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
/

-- ----------------------------
-- Function structure for INSERT_FOR_TEST
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "MEMORY"."INSERT_FOR_TEST" AS
BEGIN
INSERT INTO FORTEST VALUES(id, fid, name);
commit;
END;
/

-- ----------------------------
-- Function structure for INSERT_INTO_FAVORITE
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "MEMORY"."INSERT_INTO_FAVORITE" AS
BEGIN
if customer_id IS NULL then
  return;
end if;
INSERT INTO T_FAVORITE VALUES(1, customer_id, favorite_name);
commit;
END;
/

-- ----------------------------
-- Function structure for PROC
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "MEMORY"."PROC" AS
begin
  for i in 1 .. 1000000
    loop
      insert into TEST_ORDER values(i,54045, to_date('2007-12-20 18:31:34', 'YYYY-MM-DD HH24:MI:SS'),1,127.28,0);
      commit;
    end loop;
end;
/

-- ----------------------------
-- Function structure for PROC1
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "MEMORY"."PROC1" AS
begin
  for i in 1 .. 1000000
    loop
      insert into TEST_ORDER values(i,54045, to_date('2007-12-20 18:31:34', 'YYYY-MM-DD HH24:MI:SS'),1,127.28,0);
    end loop;
  commit;
end;
/

-- ----------------------------
-- Function structure for cus_login
-- ----------------------------
CREATE OR REPLACE
FUNCTION "MEMORY"."cus_login" AS
begin
if p_user_phone is null then
    return false;
else
    return true;
end if;
end;
/

-- ----------------------------
-- Sequence structure for MDRS_16422$
-- ----------------------------
DROP SEQUENCE "MEMORY"."MDRS_16422$";
CREATE SEQUENCE "MEMORY"."MDRS_16422$" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 ORDER CACHE 100;

-- ----------------------------
-- Sequence structure for MDRS_1642B$
-- ----------------------------
DROP SEQUENCE "MEMORY"."MDRS_1642B$";
CREATE SEQUENCE "MEMORY"."MDRS_1642B$" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 ORDER CACHE 100;

-- ----------------------------
-- Sequence structure for MDRS_16432$
-- ----------------------------
DROP SEQUENCE "MEMORY"."MDRS_16432$";
CREATE SEQUENCE "MEMORY"."MDRS_16432$" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 ORDER CACHE 100;

-- ----------------------------
-- Primary Key structure for table EBA_SAMPLE_MAP_AIRPORTS
-- ----------------------------
ALTER TABLE "MEMORY"."EBA_SAMPLE_MAP_AIRPORTS" ADD CONSTRAINT "SYS_C0024280" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table EBA_SAMPLE_MAP_AIRPORTS
-- ----------------------------
ALTER TABLE "MEMORY"."EBA_SAMPLE_MAP_AIRPORTS" ADD CONSTRAINT "SYS_C0024279" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table EBA_SAMPLE_MAP_SIMPLE_STATES
-- ----------------------------
ALTER TABLE "MEMORY"."EBA_SAMPLE_MAP_SIMPLE_STATES" ADD CONSTRAINT "SYS_C0024288" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table EBA_SAMPLE_MAP_SIMPLE_STATES
-- ----------------------------
ALTER TABLE "MEMORY"."EBA_SAMPLE_MAP_SIMPLE_STATES" ADD CONSTRAINT "SYS_C0024287" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table EBA_SAMPLE_MAP_STATES
-- ----------------------------
ALTER TABLE "MEMORY"."EBA_SAMPLE_MAP_STATES" ADD CONSTRAINT "SYS_C0024286" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table EBA_SAMPLE_MAP_STATES
-- ----------------------------
ALTER TABLE "MEMORY"."EBA_SAMPLE_MAP_STATES" ADD CONSTRAINT "SYS_C0024285" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table TEST
-- ----------------------------
ALTER TABLE "MEMORY"."TEST" ADD CONSTRAINT "TEST_PK" PRIMARY KEY ("ID");

-- ----------------------------
-- Primary Key structure for table T_COMMENT
-- ----------------------------
ALTER TABLE "MEMORY"."T_COMMENT" ADD CONSTRAINT "SYS_C0020578" PRIMARY KEY ("COMMENT_ID");

-- ----------------------------
-- Checks structure for table T_COMMENT
-- ----------------------------
ALTER TABLE "MEMORY"."T_COMMENT" ADD CONSTRAINT "SYS_C0020574" CHECK ("COMMENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_COMMENT" ADD CONSTRAINT "SYS_C0020575" CHECK ("COMMENT_GRADE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_COMMENT" ADD CONSTRAINT "SYS_C0020577" CHECK ("ORDER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table T_CUSTOMER
-- ----------------------------
ALTER TABLE "MEMORY"."T_CUSTOMER" ADD CONSTRAINT "SYS_C0019177" PRIMARY KEY ("CUSTOMER_ID");

-- ----------------------------
-- Uniques structure for table T_CUSTOMER
-- ----------------------------
ALTER TABLE "MEMORY"."T_CUSTOMER" ADD CONSTRAINT "SYS_C0019178" UNIQUE ("CUSTOMER_PHONE") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table T_CUSTOMER
-- ----------------------------
ALTER TABLE "MEMORY"."T_CUSTOMER" ADD CONSTRAINT "SYS_C0019173" CHECK ("CUSTOMER_USERNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_CUSTOMER" ADD CONSTRAINT "SYS_C0019174" CHECK ("CUSTOMER_PASSWORD" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_CUSTOMER" ADD CONSTRAINT "SYS_C0019175" CHECK ("CUSTOMER_PHONE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_CUSTOMER" ADD CONSTRAINT "SYS_C0019176" CHECK ( length(customer_phone) = 11) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table T_FAVORITE
-- ----------------------------
ALTER TABLE "MEMORY"."T_FAVORITE" ADD CONSTRAINT "SYS_C0019212" PRIMARY KEY ("FAVORITE_ID");

-- ----------------------------
-- Checks structure for table T_FAVORITE
-- ----------------------------
ALTER TABLE "MEMORY"."T_FAVORITE" ADD CONSTRAINT "SYS_C0019211" CHECK ("FAVORITE_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table T_HOST
-- ----------------------------
ALTER TABLE "MEMORY"."T_HOST" ADD CONSTRAINT "SYS_C0019183" PRIMARY KEY ("HOST_ID");

-- ----------------------------
-- Uniques structure for table T_HOST
-- ----------------------------
ALTER TABLE "MEMORY"."T_HOST" ADD CONSTRAINT "SYS_C0019184" UNIQUE ("HOST_PHONE") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table T_HOST
-- ----------------------------
ALTER TABLE "MEMORY"."T_HOST" ADD CONSTRAINT "SYS_C0019179" CHECK ("HOST_USERNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_HOST" ADD CONSTRAINT "SYS_C0019180" CHECK ("HOST_PASSWORD" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_HOST" ADD CONSTRAINT "SYS_C0019181" CHECK ("HOST_PHONE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_HOST" ADD CONSTRAINT "SYS_C0019182" CHECK ( length(host_phone) = 11 ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table T_HOST_ORDER
-- ----------------------------
ALTER TABLE "MEMORY"."T_HOST_ORDER" ADD CONSTRAINT "SYS_C0023991" PRIMARY KEY ("HOST_ID", "ORDER_ID");

-- ----------------------------
-- Primary Key structure for table T_ORDER
-- ----------------------------
ALTER TABLE "MEMORY"."T_ORDER" ADD CONSTRAINT "SYS_C0019198" PRIMARY KEY ("ORDER_ID");

-- ----------------------------
-- Checks structure for table T_ORDER
-- ----------------------------
ALTER TABLE "MEMORY"."T_ORDER" ADD CONSTRAINT "SYS_C0019195" CHECK ("ORDER_TIME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_ORDER" ADD CONSTRAINT "SYS_C0019196" CHECK ("TOTAL_PRICE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_ORDER" ADD CONSTRAINT "SYS_C0019197" CHECK ("ORDER_STATUS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table T_ORDER
-- ----------------------------
CREATE TRIGGER "MEMORY"."ORDER_TRIGGER" AFTER INSERT ON "MEMORY"."T_ORDER" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
begin
        insert into T_COMMENT values (:NEW.ORDER_ID, 'hh',5,sysdate, :NEW.ORDER_ID);
    end;
/

-- ----------------------------
-- Primary Key structure for table T_ORDER_ROOM
-- ----------------------------
ALTER TABLE "MEMORY"."T_ORDER_ROOM" ADD CONSTRAINT "SYS_C0019208" PRIMARY KEY ("ORDER_ID", "STAY_ID", "ROOM_ID", "START_TIME");

-- ----------------------------
-- Checks structure for table T_ORDER_ROOM
-- ----------------------------
ALTER TABLE "MEMORY"."T_ORDER_ROOM" ADD CONSTRAINT "SYS_C0019205" CHECK ("START_TIME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_ORDER_ROOM" ADD CONSTRAINT "SYS_C0019206" CHECK ("END_TIME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_ORDER_ROOM" ADD CONSTRAINT "SYS_C0019207" CHECK ("PRICE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table T_ROOM
-- ----------------------------
ALTER TABLE "MEMORY"."T_ROOM" ADD CONSTRAINT "SYS_C0019193" PRIMARY KEY ("STAY_ID", "ROOM_ID");

-- ----------------------------
-- Checks structure for table T_ROOM
-- ----------------------------
ALTER TABLE "MEMORY"."T_ROOM" ADD CONSTRAINT "SYS_C0019191" CHECK ("ROOM_PRICE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_ROOM" ADD CONSTRAINT "SYS_C0019192" CHECK ("ROOM_PHOTO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table T_STAY
-- ----------------------------
ALTER TABLE "MEMORY"."T_STAY" ADD CONSTRAINT "SYS_C0019189" PRIMARY KEY ("STAY_ID");

-- ----------------------------
-- Checks structure for table T_STAY
-- ----------------------------
ALTER TABLE "MEMORY"."T_STAY" ADD CONSTRAINT "SYS_C0019185" CHECK ("STAY_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_STAY" ADD CONSTRAINT "SYS_C0019186" CHECK ("STAY_PROVINCE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_STAY" ADD CONSTRAINT "SYS_C0019187" CHECK ("STAY_CAPACITY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_STAY" ADD CONSTRAINT "SYS_C0019188" CHECK ("ROOM_NUM" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_STAY" ADD CONSTRAINT "SYS_C0020261" CHECK ("STAY_LONGITUDE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_STAY" ADD CONSTRAINT "SYS_C0020262" CHECK ("STAY_LATITUDE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table T_STAY_FAVORITE
-- ----------------------------
ALTER TABLE "MEMORY"."T_STAY_FAVORITE" ADD CONSTRAINT "SYS_C0019214" PRIMARY KEY ("FAVORITE_ID", "STAY_ID");

-- ----------------------------
-- Checks structure for table T_STAY_HOT
-- ----------------------------
ALTER TABLE "MEMORY"."T_STAY_HOT" ADD CONSTRAINT "SYS_C0024295" CHECK ("STAY_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_STAY_HOT" ADD CONSTRAINT "SYS_C0024296" CHECK ("STAY_CAPACITY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_STAY_HOT" ADD CONSTRAINT "SYS_C0024297" CHECK ("ROOM_NUM" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table T_STAY_PRICE
-- ----------------------------
ALTER TABLE "MEMORY"."T_STAY_PRICE" ADD CONSTRAINT "SYS_C0024289" CHECK ("STAY_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_STAY_PRICE" ADD CONSTRAINT "SYS_C0024290" CHECK ("STAY_CAPACITY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_STAY_PRICE" ADD CONSTRAINT "SYS_C0024291" CHECK ("ROOM_NUM" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table T_STAY_PRICE_DESC
-- ----------------------------
ALTER TABLE "MEMORY"."T_STAY_PRICE_DESC" ADD CONSTRAINT "SYS_C0024292" CHECK ("STAY_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_STAY_PRICE_DESC" ADD CONSTRAINT "SYS_C0024293" CHECK ("STAY_CAPACITY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_STAY_PRICE_DESC" ADD CONSTRAINT "SYS_C0024294" CHECK ("ROOM_NUM" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table T_FAVORITE
-- ----------------------------
ALTER TABLE "MEMORY"."T_FAVORITE" ADD CONSTRAINT "SYS_C0019213" FOREIGN KEY ("CUSTOMER_ID") REFERENCES "MEMORY"."T_CUSTOMER" ("CUSTOMER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table T_HOST_ORDER
-- ----------------------------
ALTER TABLE "MEMORY"."T_HOST_ORDER" ADD CONSTRAINT "SYS_C0023992" FOREIGN KEY ("HOST_ID") REFERENCES "MEMORY"."T_HOST" ("HOST_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_HOST_ORDER" ADD CONSTRAINT "SYS_C0023993" FOREIGN KEY ("ORDER_ID") REFERENCES "MEMORY"."T_ORDER" ("ORDER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table T_ORDER
-- ----------------------------
ALTER TABLE "MEMORY"."T_ORDER" ADD CONSTRAINT "SYS_C0019199" FOREIGN KEY ("CUSTOMER_ID") REFERENCES "MEMORY"."T_CUSTOMER" ("CUSTOMER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table T_ORDER_ROOM
-- ----------------------------
ALTER TABLE "MEMORY"."T_ORDER_ROOM" ADD CONSTRAINT "SYS_C0019209" FOREIGN KEY ("ORDER_ID") REFERENCES "MEMORY"."T_ORDER" ("ORDER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_ORDER_ROOM" ADD CONSTRAINT "SYS_C0019210" FOREIGN KEY ("STAY_ID", "ROOM_ID") REFERENCES "MEMORY"."T_ROOM" ("STAY_ID", "ROOM_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table T_ROOM
-- ----------------------------
ALTER TABLE "MEMORY"."T_ROOM" ADD CONSTRAINT "SYS_C0019194" FOREIGN KEY ("STAY_ID") REFERENCES "MEMORY"."T_STAY" ("STAY_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table T_STAY
-- ----------------------------
ALTER TABLE "MEMORY"."T_STAY" ADD CONSTRAINT "SYS_C0019190" FOREIGN KEY ("HOST_ID") REFERENCES "MEMORY"."T_HOST" ("HOST_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table T_STAY_FAVORITE
-- ----------------------------
ALTER TABLE "MEMORY"."T_STAY_FAVORITE" ADD CONSTRAINT "SYS_C0019216" FOREIGN KEY ("STAY_ID") REFERENCES "MEMORY"."T_STAY" ("STAY_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MEMORY"."T_STAY_FAVORITE" ADD CONSTRAINT "SYS_C0024238" FOREIGN KEY ("FAVORITE_ID") REFERENCES "MEMORY"."T_FAVORITE" ("FAVORITE_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

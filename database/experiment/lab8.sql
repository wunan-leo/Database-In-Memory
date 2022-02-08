select stay_id, t_host.host_username
from t_stay,t_host
where t_stay.host_id=t_host.host_id 
and stay_province='上海市'

select stay_id, t_host.host_username
from t_stay, t_host
where t_stay.host_id=t_host.host_id 
and stay_province='上海市' 
and stay_capacity<>3
and room_num<>1

select stay_id, host_username
from t_stay
where stay_province='上海市' 

select stay_id, host_username
from t_stay
where stay_province='上海市' 
and stay_capacity<>3
and room_num<>1

create table T_ORDER_REDUNDANCY as
select ORDER_ID,CUSTOMER_ID,ORDER_TIME,CUSTOMER_NUM,TOTAL_PRICE,ORDER_STATUS,STAY_NAME
from T_ORDER NATURAL JOIN T_ORDER_ROOM NATURAL JOIN T_STAY;

select stay_name
from T_ORDER_REDUNDANCY 
where order_id = 2;

select distinct stay_name
from T_ORDER_ROOM natural join T_STAY
where ORDER_ID = 2;


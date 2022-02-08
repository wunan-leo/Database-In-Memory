options(skip=1,BINDSIZE=256000, ROWS=1, READSIZE=1048576, ERRORS=0)
load data
infile '/home/oracle/data/order.csv'
insert into table "order"
fields terminated by ','
Optionally enclosed by '"'
(order_id,
customer_id,
order_time "to_date(:order_time, 'yyyy/mm/dd hh24:mi:ss')",
customer_num,
total_price,
order_status TERMINATED BY WHITESPACE
)
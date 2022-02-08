select count(distinct(order_id))
from t_order_room natural join t_order natural join t_room  natural join t_stay
where host_id = 634225;

select count(distinct(order_id))
from t_host_order
where host_id = 634225;

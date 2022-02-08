--2.2.1
select count(distinct(order_id))
from t_order_room natural join t_order natural join t_room  natural join t_stay
where host_id = 634225;

select count(distinct(order_id))
from t_stay natural join t_room natural join t_order  natural join t_order_room
where host_id = 634225;


select count(distinct(T_ORDER.ORDER_ID))
from  t_order_room, t_order, t_room, t_stay
where t_order_room.order_id = t_order.order_id and
      t_order_room.room_id = t_room.room_id and
      t_order_room.stay_id = t_room.stay_id and
      t_room.stay_id = t_stay.stay_id and
      t_stay.host_id = 634225;

select count(distinct(T_ORDER.order_id))
from  t_stay, t_room, t_order, t_order_room
where t_order_room.order_id = t_order.order_id and
      t_order_room.room_id = t_room.room_id and
      t_order_room.stay_id = t_room.stay_id and
      t_room.stay_id = t_stay.stay_id and
      t_stay.host_id = 634225;

--2.2.2
select count(distinct(t_order.order_id))
from  t_stay, t_room, t_order, t_order_room
where t_stay.host_id = 634225 and
      t_order_room.stay_id = t_room.stay_id and
      t_order_room.room_id = t_room.room_id and
      t_room.stay_id = t_stay.stay_id and
      t_order_room.order_id = t_order.order_id;

select count(distinct(t_order.order_id))
from  t_stay, t_room, t_order, t_order_room
where t_order_room.order_id = t_order.order_id and
      t_order_room.room_id = t_room.room_id and
      t_order_room.stay_id = t_room.stay_id and
      t_room.stay_id = t_stay.stay_id and
      t_stay.host_id = 634225;

--2.2.3
select distinct order_id
from t_stay natural join t_room natural join t_order  natural join t_order_room
where host_id = 634225;

select order_id
from t_stay natural join t_room natural join t_order  natural join t_order_room
where host_id = 634225
group by order_id;
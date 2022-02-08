select count(*)
from T_COMMENT
where comment_grade = 1

insert into T_COMMENT
values (COMMENT_INC.nextval, null, 1, to_date('2021/11/08', 'yyyy-mm-dd'), 1);

drop index comment_index;
create index comment_index
on T_COMMENT(comment_grade);

drop index comment_index;
create bitmap index comment_index
on T_COMMENT(comment_grade);

drop index comment_index;
create hash index comment_index
on T_COMMENT(comment_grade);

select count(*) 
from T_COMMENT 
where COMMENT_TIME > to_date('2021-01-01 00:00:00','yyyy-MM-dd HH24:MI:SS');

drop index comment_time_index;
create index comment_time_index
on T_COMMENT(COMMENT_TIME);

drop index comment_time_index;
create bitmap index comment_time_index
on T_COMMENT(COMMENT_TIME);
-- 创建触发器
create or replace trigger trg_customer_audit
before update on t_customer
for each row
declare
    c_insert_sql constant varchar2(100) := 'insert into t_audit values(seq_audit_pk.nextval,c_table_name,:new.f_id,:new.f_version,:1,:2,:2,:new.f_modified_id,systimestamp)';
    c_table_name constant varchar2(20)  := 'T_CUSTOMER';
    v_column_name varchar2(20);
begin
    -- 保存历史版本
    insert into t_customer_history values(:old.f_id,:old.f_code,:old.f_full_name,:old.f_linkman,:old.f_mobile,:old.f_telephone,:old.f_email,:old.f_address,:old.f_city,:old.f_balance,:old.f_partner,:old.f_remark,:old.f_salesman,:old.f_deleted_tag,:old.f_created_id,:old.f_created_time,:old.f_modified_id,:old.f_modified_time,:old.f_version);
    
    -- 版本更新
    :new.f_version := :old.f_version+1;
    
    -- 更新审计表
    if updating('F_LINKMAN') then
        execute immediate c_insert_sql using 'linkman',:old.f_linkman;
    end if;
    
    if updating('F_MOBILE') then
        execute immediate c_insert_sql using 'mobile',:old.f_mobile;
    end if;
    
    if updating('F_TELEPHONE') then
        execute immediate c_insert_sql using 'telephone',:old.f_telephone;
    end if;
    
    if updating('F_EMAIL') then
        execute immediate c_insert_sql using 'email',:old.f_email;
    end if;
    
    if updating('F_ADDRESS') then
        execute immediate c_insert_sql using 'address',:old.f_address;
    end if;
    
    if updating('F_BALANCE') then
        execute immediate c_insert_sql using 'balance',:old.f_balance;
    end if;
end;
/

-- 修改联系人
create or replace procedure modify_linkman
(p_row_id in number,p_linkman_name in varchar2, p_operator in number)
as
begin
    execute immediate 'update t_customer set f_linkman=:1,f_modified_id=:2, f_modified_time=sysdate where f_id=:3' 
    using p_linkman_name,p_operator,p_row_id;
    commit;
    dbms_output.put_line('Updated linkman name successfully.');
end;
/

-- 修改手机号码
create or replace procedure modify_mobile
(p_row_id in number,p_mobile in varchar2,p_operator in number)
as
begin
    execute immediate 'update t_customer set f_mobile=:1,f_modified_id=:2, f_modified_time=sysdate where f_id=:3' 
    using p_mobile,p_operator,p_row_id;
    commit;
    dbms_output.put_line('Updated mobile successfully.');
end;
/

-- 修改余额
create or replace procedure modify_balance
(p_row_id in number,p_balance in number, p_operator in number)
as
begin
    execute immediate 'update t_customer set f_balance=:1,f_modified_id=:2, f_modified_time=sysdate where f_id=:3' 
    using p_balance,p_operator,p_row_id;
    commit;
    dbms_output.put_line('Updated balance successfully.');
end;
/

-- 修改地址
create or replace procedure modify_address
(p_row_id in number,p_address in varchar2, p_operator in number)
as
begin
    execute immediate 'update t_customer set f_address=:1,f_modified_id=:2, f_modified_time=sysdate where f_id=:3' 
    using p_address,p_operator,p_row_id;
    commit;
    dbms_output.put_line('Updated address successfully.');
end;
/

-- 修改邮箱
create or replace procedure modify_email
(p_row_id in number,p_email in varchar2, p_operator in number)
as
begin
    execute immediate 'update t_customer set f_email=:1,f_modified_id=:2, f_modified_time=sysdate where f_id=:3' 
    using p_email,p_operator,p_row_id;
    commit;
    dbms_output.put_line('Updated email successfully.');
end;
/

-- 修改固话号码
create or replace procedure modify_telephone
(p_row_id in number,p_telephone in varchar2,p_operator in number)
as
begin
    execute immediate 'update t_customer set f_telephone=:1,f_modified_id=:2, f_modified_time=sysdate where f_id=:3' 
    using p_telephone,p_operator,p_row_id;
    commit;
    dbms_output.put_line('Updated mobile successfully.');
end;
/

-- 修改联系人信息
create or replace procedure modify_linkman_info
(p_row_id in number,p_linkman_name in varchar2,p_mobile in varchar2, 
 p_telephone in varchar2,p_email in varchar2,p_operator in number)
as
begin
    execute immediate 'update t_customer set f_linkman=:1, f_mobile=:2, 
    f_telephone=:3, f_email=:4, f_modified_id=:5, f_modified_time=sysdate where f_id=:6' 
    using p_linkman_name,p_mobile,p_telephone,p_email,p_operator,p_row_id;
    commit;
    dbms_output.put_line('Updated linkman info successfully.');
end;
/

-- 重置Sequence
create or replace PROCEDURE reset_seq( seq_name IN VARCHAR2 )
IS
    v_val NUMBER;
BEGIN
    EXECUTE IMMEDIATE 'SELECT ' || seq_name || '.NEXTVAL FROM dual' INTO v_val;

    EXECUTE IMMEDIATE 'ALTER SEQUENCE ' || seq_name || ' INCREMENT BY -' || v_val ||' MINVALUE 0';

    EXECUTE IMMEDIATE 'SELECT ' || seq_name || '.NEXTVAL FROM dual' INTO v_val;

    EXECUTE IMMEDIATE 'ALTER SEQUENCE ' || seq_name || ' INCREMENT BY 1 MINVALUE 0';
end;
/

-- 数据初始化
create or replace procedure init is
begin
    execute immediate 'truncate table t_audit';
    execute immediate 'truncate table t_customer_history';
    execute immediate 'truncate table t_customer';
    execute immediate 'truncate table t_user';
    execute immediate 'truncate table t_department';
    reset_seq('seq_audit_pk');

    --插入部门
    insert into t_department values(1,'销售部','D01',NULL,'李梦菲','备注1...');
    insert into t_department values(2,'销售部-北京分部','D0101',1,'王轩','备注2...');
    insert into t_department values(3,'销售部-上海分部','D0102',1,'孙云梦','备注3...');
    insert into t_department values(4,'销售部-深圳分部','D0103',1,'王兵','备注4...');

    --插入用户
    insert into t_user values(1,1,'李晶霞','U8201','女','13771234101','02131231011','use1@samtech.com','备注1...');
    insert into t_user values(2,1,'李明申','U8202','男','13771234102','02131231012','use2@samtech.com','备注2...');
    insert into t_user values(3,2,'李采文', 'U8203','女','13771234103','02131231013','use3@samtech.com','备注3...');
    insert into t_user values(4,2,'王兴平', 'U8204','男','13771234104','02131231014','use4@samtech.com','备注4...');
    insert into t_user values(5,3,'赵昌日','U8205','男','13771234105','02131231015','use5@samtech.com','备注5...');
    insert into t_user values(6,3,'孙晓华','U8206','男','13771234106','02131231016','use6@samtech.com','备注6...');
    insert into t_user values(7,4,'孙姝','U8207','女','13771234107','02131231017','use7@samtech.com','备注7...');
    insert into t_user values(8,4,'王凡阳','U8208','男','13771234108','02131231018','use8@samtech.com','备注8...');

    --插入客户
    insert into t_customer 
    values(1,'C1808001','上海市永辉电子股份有限公司','张明升','15352678121','02135681589','ming@google.com','上海市静安区城区安泰路1108号','上海市',12082,'上海中远','备注...','张娜',0,1,sysdate,1,sysdate,1);
    commit;
end;
/

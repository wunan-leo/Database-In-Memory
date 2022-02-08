--方案一
--部门表
CREATE TABLE T_DEPARTMENT 
(	"F_ID" NUMBER(6,0) NOT NULL ENABLE, 
	"F_NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"F_PARENT_ID" number(6,0), 
	"F_MANAGER_ID" NUMBER(6,0) NOT NULL ENABLE, 
	"F_REMARK" VARCHAR2(200 BYTE), 
	 CONSTRAINT "T_DEPARTMENT_PK" PRIMARY KEY ("F_ID")
) ;
 
--用户表
CREATE TABLE "T_USER" 
(	"F_ID" NUMBER(6,0) NOT NULL ENABLE, 
	"F_DEPT_ID" NUMBER(6,0) NOT NULL ENABLE, 
	"F_NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE,  
	"F_SEX" VARCHAR2(5 BYTE) DEFAULT NULL, 
	"F_MOBILE" VARCHAR2(20 BYTE), 
	"F_EMAIL" VARCHAR2(50 BYTE), 
	"F_REMARK" VARCHAR2(200 BYTE), 
	 CONSTRAINT "T_USER_PK" PRIMARY KEY ("F_ID")
);
 
--客户信息表 
CREATE TABLE "T_CUSTOMER" 
(	"F_ID" NUMBER(6,0) NOT NULL ENABLE, 
	"F_NAME" varchar2(145 byte) not null enable, 
	"F_LINKMAN" VARCHAR2(45 BYTE) NOT NULL ENABLE, 
	"F_MOBILE" VARCHAR2(11 BYTE) NOT NULL ENABLE, 
	"F_EMAIL" VARCHAR2(60 BYTE), 
	"F_ADDRESS" VARCHAR2(200 BYTE), 
	"F_REMARK" VARCHAR2(200 BYTE), 
	"F_CREATED_ID" NUMBER(6,0) NOT NULL ENABLE, 
	"F_CREATED_TIME" TIMESTAMP (6) NOT NULL ENABLE, 
	 PRIMARY KEY ("F_ID")
);

--过程：数据初始化
create or replace procedure init is
begin
    execute immediate 'truncate table t_customer';
    execute immediate 'truncate table t_user';
    execute immediate 'truncate table t_department';
END;
	-- 插入部门
    INSERT INTO t_department VALUES(1,'公司',NULL,1,'remark...');
    INSERT INTO t_department VALUES(2,'行政部',1,1,'remark...');
    INSERT INTO t_department VALUES(3,'销售部',1,2,'remark...');
    INSERT INTO t_department VALUES(4,'电销组',3,3,'销售部电销组');
    INSERT INTO t_department VALUES(5,'推销组',3,6,'销售部推销组');

    --插入用户
    INSERT INTO t_user VALUES(1,1,'管理员','男','13771234101','use1@samtech.com','系统管理员');   
    INSERT INTO t_user VALUES(2,3,'李明申','男','13771234102','use2@samtech.com','销售部经理');   
    INSERT INTO t_user VALUES(3,4,'张雪', '女','13771234103','use3@samtech.com','销售部电销组主管');
    INSERT INTO t_user VALUES(4,4,'王刚', '男','13771234104','use4@samtech.com','销售部电销组业务员1');
    INSERT INTO t_user VALUES(5,4,'赵昌日','男','13771234105','use5@samtech.com','销售部电销组业务员2');  
    INSERT INTO t_user VALUES(6,5,'孙晓华','男','13771234106','use6@samtech.com','销售部推销组主管');
    INSERT INTO t_user VALUES(7,5,'陈亚男','女','13771234107','use7@samtech.com','销售部推销组业务员3');
    INSERT INTO t_user VALUES(8,5,'刘兵超','男','13771234108','use8@samtech.com','销售部推销组业务员4');   
    INSERT INTO t_user VALUES(9,3,'陈彬','女','13771234109','use9@samtech.com','销售部业务员x1');
    INSERT INTO t_user VALUES(10,3,'王军','男','13771234110','use10@samtech.com','销售部业务员x2');

    --插入客户
    INSERT INTO t_customer VALUES(1,'中科创客（深圳）智能工业设备公司','李明'  ,'17723180234','ming6@google.com','深圳市龙岗区富民工业园致康路301号','推销组业务员2创建',8,sysdate);
    INSERT INTO t_customer VALUES(2,'南宁云讯科技有限公司'          ,'王永成','13568932166','ming7@google.com','广东省深圳市福田区长川路102号','销售部业务员x1创建',9,sysdate);
    INSERT INTO t_customer VALUES(3,'上海市永辉电子股份有限公司'     ,'张明升','15352678121','ming1@google.com','上海市静安区城区安泰路1108号','电销组主管创建',3,sysdate);
    INSERT INTO t_customer VALUES(4,'安徽广宏顶管装备制造有限公司'   ,'邱阳阳' ,'15328921231','ming3@google.com','安徽省广德县经济开发区东纬路5号','电销组业务员2创建',5,sysdate);
    INSERT INTO t_customer VALUES(5,'上海定丰霖贸易有限公司'        ,'赵兰'  ,'15532212322','ming4@google.com','上海市浦东新区东延路112号408室','推销组主管创建',6,sysdate);
    INSERT INTO t_customer VALUES(6,'上海博运汽车销售有限公司'      ,'朱荣荣' ,'13231289212','ming2@google.com','上海市徐汇区钦江路256号','电销组业务员1创建',4,sysdate);
    INSERT INTO t_customer VALUES(7,'上海东俊科技有限公司'          ,'张军'  ,'15367823660','ming5@google.com','上海市长宁区王安路135号','推销组业务员1创建',7,sysdate);
    INSERT INTO t_customer VALUES(8,'沈阳优速家政服务有限公司'       ,'李东升','13392312343','ming8@google.com','辽宁省沈阳市铁西区北二路青年易居东门32号','销售部业务员x2创建',10,sysdate);
/

----------------------------------------------------------------------------

--方案二
--部门表
CREATE TABLE T_DEPARTMENT_2 
(	"F_ID" NUMBER(6,0) NOT NULL ENABLE, 
	"F_NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
    "F_CODE" VARCHAR2(50 BYTE) NOT NULL ENABLE, -- 多一个部门编码
	"F_PARENT_ID" number(6,0), 
	"F_MANAGER_ID" NUMBER(6,0) NOT NULL ENABLE, 
	"F_REMARK" VARCHAR2(200 BYTE), 
	 CONSTRAINT "T_DEPARTMENT_PK2" PRIMARY KEY ("F_ID")
) ;
 
--用户表
CREATE TABLE "T_USER_2" 
(	"F_ID" NUMBER(6,0) NOT NULL ENABLE, 
	"F_DEPT_ID" NUMBER(6,0) NOT NULL ENABLE, 
	"F_NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE,  
    "F_CODE" VARCHAR2(50 BYTE) NOT NULL ENABLE,
	"F_SEX" VARCHAR2(5 BYTE) DEFAULT NULL, 
	"F_MOBILE" VARCHAR2(20 BYTE), 
	"F_EMAIL" VARCHAR2(50 BYTE), 
	"F_REMARK" VARCHAR2(200 BYTE), 
	 CONSTRAINT "T_USER_PK2" PRIMARY KEY ("F_ID")
);

--客户信息表 
CREATE TABLE "T_CUSTOMER_2" 
(	"F_ID" NUMBER(6,0) NOT NULL ENABLE, 
	"F_NAME" varchar2(145 byte) not null enable, 
	"F_LINKMAN" VARCHAR2(45 BYTE) NOT NULL ENABLE, 
	"F_MOBILE" VARCHAR2(11 BYTE) NOT NULL ENABLE, 
	"F_EMAIL" VARCHAR2(60 BYTE), 
	"F_ADDRESS" VARCHAR2(200 BYTE), 
	"F_REMARK" VARCHAR2(200 BYTE), 
    "F_ACCESS_CODE" VARCHAR2(50 BYTE) NOT NULL ENABLE,  -- 权限编码
	"F_CREATED_ID" NUMBER(6,0) NOT NULL ENABLE, 
	"F_CREATED_TIME" TIMESTAMP (6) NOT NULL ENABLE, 
	 PRIMARY KEY ("F_ID")
);


--过程：数据初始化
create or replace procedure init2 is
begin
	--清除数据
    EXECUTE IMMEDIATE 'truncate table t_customer_2';
    EXECUTE IMMEDIATE 'truncate table t_user_2';
    EXECUTE IMMEDIATE 'truncate table t_department_2';

    --插入部门
    INSERT INTO t_department_2 VALUES(1,'公司','1',NULL,1,'remark...');
    INSERT INTO t_department_2 VALUES(2,'行政部','101',1,1,'remark...');
    INSERT INTO t_department_2 VALUES(3,'销售部','102',1,2,'remark...');
    INSERT INTO t_department_2 VALUES(4,'电销组','10201',3,3,'销售部电销组');
    INSERT INTO t_department_2 VALUES(5,'推销组','10202',3,6,'销售部推销组');

    --插入用户
    INSERT INTO t_user_2 VALUES(1,1,'管理员','1','男','13771234101','use1@samtech.com','系统管理员');   
    INSERT INTO t_user_2 VALUES(2,3,'李明申','102','男','13771234102','use2@samtech.com','销售部经理');   
    INSERT INTO t_user_2 VALUES(3,4,'张雪',  '10201', '女','13771234103','use3@samtech.com','销售部电销组主管');
    INSERT INTO t_user_2 VALUES(4,4,'王刚',  '1020101', '男','13771234104','use4@samtech.com','销售部电销组业务员1');
    INSERT INTO t_user_2 VALUES(5,4,'赵昌日','1020102','男','13771234105','use5@samtech.com','销售部电销组业务员2');  
    INSERT INTO t_user_2 VALUES(6,5,'孙晓华','10202','男','13771234106','use6@samtech.com','销售部推销组主管');
    INSERT INTO t_user_2 VALUES(7,5,'陈亚男','1020201','女','13771234107','use7@samtech.com','销售部推销组业务员3');
    INSERT INTO t_user_2 VALUES(8,5,'刘兵超','1020202','男','13771234108','use8@samtech.com','销售部推销组业务员4');   
    INSERT INTO t_user_2 VALUES(9,3,'陈彬',  '10203','女','13771234109','use9@samtech.com','销售部业务员x1');
    INSERT INTO t_user_2 VALUES(10,3,'王军', '10204','男','13771234110','use10@samtech.com','销售部业务员x2');

    --插入客户
    INSERT INTO t_customer_2 VALUES(1,'上海定丰霖贸易有限公司'        ,'赵兰'  ,'15532212322','ming4@google.com','上海市浦东新区东延路112号408室','推销组主管创建','10202',6,sysdate);
    INSERT INTO t_customer_2 VALUES(2,'上海东俊科技有限公司'          ,'张军'  ,'15367823660','ming5@google.com','上海市长宁区王安路135号','推销组业务员1创建','1020201',7,sysdate);
    INSERT INTO t_customer_2 VALUES(3,'南宁云讯科技有限公司'          ,'王永成','13568932166','ming7@google.com','广东省深圳市福田区长川路102号','销售部业务员x1创建','10203',9,sysdate);
    INSERT INTO t_customer_2 VALUES(4,'沈阳优速家政服务有限公司'       ,'李东升','13392312343','ming8@google.com','辽宁省沈阳市铁西区北二路青年易居东门32号','销售部业务员x2创建','10204',10,sysdate);
    INSERT INTO t_customer_2 VALUES(5,'上海市永辉电子股份有限公司'     ,'张明升','15352678121','ming1@google.com','上海市静安区城区安泰路1108号','电销组主管创建','10201',3,sysdate);
    INSERT INTO t_customer_2 VALUES(6,'中科创客（深圳）智能工业设备公司','李明'  ,'17723180234','ming6@google.com','深圳市龙岗区富民工业园致康路301号','推销组业务员2创建','1020202',8,sysdate);
    INSERT INTO t_customer_2 VALUES(7,'上海博运汽车销售有限公司'      ,'朱荣荣' ,'13231289212','ming2@google.com','上海市徐汇区钦江路256号','电销组业务员1创建','1020101',4,sysdate);
    INSERT INTO t_customer_2 VALUES(8,'安徽广宏顶管装备制造有限公司'   ,'邱阳阳' ,'15328921231','ming3@google.com','安徽省广德县经济开发区东纬路5号','电销组业务员2创建','1020102',5,sysdate);
    commit;
END;
-- TODO: 插入数据
/

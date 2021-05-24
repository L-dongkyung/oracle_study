create or replace synonym syn_channel for channels;
select count(*) from syn_channel;

alter user hr identified by hr account unlock;

--hr 유저한테 select 권한 주기
grant select on syn_channel to hr;

create or replace public synonym syn_channel2 for channels;
grant select on syn_channel2 to public;

drop synonym syn_channel;
drop public synonym syn_channel2;

--시퀀스
create sequence my_seq1
increment by 1
start with 1
minvalue 1
maxvalue 1000
nocycle
nocache;

create table ex2_8_seq(
col1 number,
col2 number);

delete ex2_8_seq;
--시퀀스명.nextval 을 입력하면 다음 value 값이 들어간다
insert into ex2_8_seq (col1) values (my_seq1.nextval);
insert into ex2_8_seq (col1) values (my_seq1.nextval);
select * from ex2_8_seq;
--시퀀스명.currval 을 입력하면 현재 값을 알수 있다
select my_seq1.currval from dual;

insert into ex2_8_seq (col1) values (my_seq1.nextval);

-- 시퀀스명.nextval 을 사용하면 계속 값이 증가한다
-- insert문이 아닌 select문에서 사용해도 값이 증가한다
select my_seq1.nextval from dual;

drop sequence my_seq1;

-- self check
--1번 문제
create table ORDERS(
ORDER_ID NUMBER(12,0),
ORDER_DATE DATE,
ORDER_MOD VARCHAR2(8),
CUSTOMER_ID NUMBER(6,0),
ORDER_STATUS NUMBER(2,0),
ORDER_TOTAL NUMBER(8,2) DEFAULT 0,
SALES_REP_ID NUMBER(6,0),
PROMOTION_ID NUMBER(6,0),
CONSTRAINT PK_ORDER_ID PRIMARY KEY (ORDER_ID),
CONSTRAINT MODE_CHECK CHECK (ORDER_MODE IN ('direct', 'online' )));

--2번 문제
CREATE TABLE ORDER_ITEMS(
ORDER_ID NUMBER(12,0),
LINE_ITEM_ID NUMBER(3,0),
PRODUCT_ID NUMBER(3,0),
UNIT_PRICE NUMBER(8,2) DEFAULT 0,
QUANTITY NUMBER(8,0) DEFAULT 0,
CONSTRAINT PK_ORDERID_ITEM_ID PRIMARY KEY (ORDER_ID, LINE_ITEM_ID));

--3번 문제
CREATE TABLE PROMOTIONS(
PROMO_ID NUMBER(6,0),
PROMO_NAME VARCHAR2(20),
CONSTRAINT PK_ID PRIMARY KEY (PROMO_ID));

--5번 문제
CREATE SEQUENCE ORDERS_SEQ
INCREMENT BY 1
START WITH 1000
MINVALUE 1
MAXVALUE 99999999;
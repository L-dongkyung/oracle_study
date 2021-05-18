create table ex2_10(
col1 varchar2(10) not null,
col2 varchar2(10) null,
create_date date default sysdate);

insert into ex2_10(col1, col2) values('AA', 'BB');

select * from ex2_10;

drop table ex2_10;

alter table ex2_10 rename column col1 to col11;
alter table ex2_10 modify col2 varchar2(30);
desc ex2_10;

alter table ex2_10 add col3 number;
desc ex2_10;

alter table ex2_10 drop column col3;

alter table ex2_10 add constraint pk_ex2_10 primary key(col11);

alter table ex2_10 drop constraint pk_ex2_10;

create table ex2_10_1 as select * from ex2_10; 
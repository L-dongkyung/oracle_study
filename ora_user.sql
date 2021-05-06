create table ex2_1 (
column1 char(10),
column2 varchar2(10),
column3 nvarchar2(10),
column4 number
);

insert into ex2_1 (column1, column2) values('abc','abc');

select column1, length(column1) as len1,
column2, length(column2) as len2 from ex2_1;

create table ex2_2( column1 varchar2(3), column2 varchar2(3 byte), column3 varchar(3char));
insert into ex2_2 values('abc', 'abc', 'abc');

delete ex2_2;

select column1, length(column1) as len1,
column2, length(column2) as len2,
column3, length(column3) as len3 from ex2_2;

insert into ex2_2 values('ȫ�浿','ȫ�浿','ȫ�浿') ;
insert into ex2_2 (column3) values('ȫ�浿');

select column3, length(column3) as len3, length(column3) as bytelen from ex2_2;
create table ex2_3( col_int integer, col_dec decimal, col_num number);

select column_id, column_name, data_type, data_length from user_tab_cols
where table_name='EX2_3' order by column_id;

create table ex2_4(col_flot1 float(32), col_flot2 float);

insert into ex2_4 values (1234567891234, 1234567891234);
--float(32)는 2진수로32라서 약 10자리만 입력이 들어간다.

create table ex2_5(col_date date, col_timestamp timestamp);

insert into ex2_5 values (sysdate, systimestamp);

select * from ex2_5;
create table ex2_7(
col_unique_null varchar2(10) UNIQUE,
col_unique_nnull varchar(10) UNIQUE not null,
col_unique VARCHAR2(10),
CONSTRAINT unique_nm1 unique (col_unique)
);

select constraint_name, constraint_type, table_name, search_condition
from user_constraints where table_name='EX2_7';

insert into ex2_7 values('AA', 'AA', 'AA');
insert into ex2_7 values('', 'BB', 'BB');
insert into ex2_7 values('', 'CC', 'CC');

create table ex2_8(
col1 varchar2(10) primary key,
col2 varchar2(10));

select constraint_name, constraint_type, table_name, search_condition
from user_constraints where table_name='EX2_8';
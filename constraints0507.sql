create table ex2_6(
col_null varchar2(10),
col_not_null varchar2(10) not null
);

--insert into ex2_6 values('AA','');
insert into ex2_6 values('AA','BB');

select constraint_name, constraint_type, table_name, search_condition
from user_constraints where table_name='EX2_6';

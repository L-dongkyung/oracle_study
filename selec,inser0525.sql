-- select
SELECT employee_id, emp_name from employees where salary > 5000;

select employee_id, emp_name from employees where salary> 5000
order by employee_id;

select employee_id, emp_name from employees where salary>5000 and job_id='IT_PROG'
order by employee_id;

select employee_id, emp_name from employees where salary>5000 and job_id='it_prog'
order by employee_id;

select employee_id, emp_name from employees where salary>5000 or job_id='IT_PROG'
order by employee_id;

select a.employee_id, a.emp_name, a.department_id, b.department_name
from employees a, departments b where a.department_id=b.department_id;

select a.employee_id, a.emp_name, a.department_id, b.department_name AS dep_name 
from employees a, departments b 
where a.department_id = b.department_id;

-- insert
create table ex3_1(
col1 varchar2(20),
col2 number,
col3 date
);
insert into ex3_1(col1, col2, col3) values('ABC', 10, SYSDATE );

insert into ex3_1(col3, col1, col2) values(sysdate, 'DEF', 20);

insert into ex3_1 values('GHI', 30, sysdate);

insert into ex3_1(col1, col2) values('GHI', 40);

insert into ex3_1 values('GHI', 50);

insert into ex3_1(col1, col2, col3) values (10, '10', '2021-05-25'); -- 자동 형변환
-- insert select
create table ex3_2(
emp_id number,
emp_name varchar2(100));

insert into ex3_2
select employee_id, emp_name from employees where salary >5000;

--update
select * from ex3_1;
update ex3_1 set col2=15;
update ex3_1 set col3 = sysdate where col3='';
update ex3_1 set col3=sysdate where col3 is null;

-- ansi outer
--기존문법
select a.employee_id, a.emp_name, b.job_id, b.department_id
from employees a, job_history b 
where a.employee_id = b.employee_id(+)
and a.department_id = b.department_id(+);
--안시 조인
select a.employee_id, a.emp_name, b.job_id, b.employee_id
from employees a
left outer join job_history b
on(a.employee_id = b.employee_id and a.department_id = b.department_id);
select a.employee_id, a.emp_name, b.job_id, b.employee_id --right
from employees a
right outer join job_history b
on(a.employee_id = b.employee_id and a.department_id = b.department_id);

--cross 
select a.employee_id, a.emp_name, b.department_id, b.department_name
from employees a, departments b;
select a.employee_id, a.emp_name, b.department_id, b.department_name
from employees a
cross join
departments b;

--full outer
create table hong_a(emp_id int); 
create table hong_b(emp_id int);
insert into hong_a values(10);
insert into hong_a values(20);
insert into hong_a values(40);
insert into hong_b values(10);
insert into hong_b values(20);
insert into hong_b values(30);
commit;
select a.emp_id, b.emp_id
from hong_a a, hong_b
where a.emp_id (+) = b.emp_id(+);

select a.emp_id, b.emp_id
from hong_a a
full join hong_b b
on(a.emp_id = b.emp_id);

select a.emp_id, b.emp_id
from hong_a a
left join hong_b b on(a.emp_id = b.emp_id)
union
select a.emp_id, b.emp_id
from hong_a a
right join hong_b b on(a.emp_id = b.emp_id);


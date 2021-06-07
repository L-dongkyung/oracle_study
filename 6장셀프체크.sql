--1번
select a.employee_id, a.emp_name, b.job_title, c.start_date, c.end_date, d.department_name
from employees a,
jobs b,
job_history c,
departments d
where c.job_id = b.job_id
and c.department_id = d.department_id
and c.employee_id = a.employee_id
and a.employee_id = '101';

--2번 외부조인은 하나의 테이블에만 적용가능
select a.employee_id, a.emp_name, b.job_id, b.department_id
from employees a,
job_history b
where a.employee_id = b.employee_id(+)
and a.department_id = b.department_id(+);

--3번


--4번

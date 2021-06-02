--semi join
--anti join not in 
select a.employee_id, a.emp_name, a.department_id, b.department_name
from employees a, departments b
where a.department_id = b.department_id
and a.department_id not in (select department_id from departments where manager_id is null);
-- not exists (서브쿼리 안에 낫 이그지스트가 있다)
select count(*) from employees a where not exists(
select 1 from departments c where a.department_id = c.department_id
and manager_id is null);

--self join
select a.employee_id, a.emp_name, b.employee_id, b.emp_name, a.department_id
from employees a, employees b
where a.employee_id < b.employee_id 
and a.department_id = b.department_id
and a.department_id = 20;

--outer join
select a.department_id, a.department_name, b.job_id, b.department_id
from departments a, job_history b
where a.department_id = b.department_id;

select a.department_id, a.department_name, b.job_id, b.department_id
from departments a, job_history b
where a.department_id = b.department_id(+);

select a.employee_id, a.emp_name, b.job_id, b.department_id
from employees a, job_history b
where a.employee_id = b.employee_id(+)
and a.department_id = b.department_id;

select a.employee_id, a.emp_name, b.job_id, b.department_id
from employees a, job_history b
where a.employee_id = b.employee_id(+)
and a.department_id = b.department_id(+);

--catasian
select a.employee_id, a.emp_name, b.department_id, b.department_name
from employees a, departments b;

--ansi
select a.employee_id, a.emp_name, a.department_id, b.department_name
from employees a, departments b
where a.department_id = b.department_id
and a.hire_date > to_date('2003-01-01','yyyy-mm-dd');

select a.employee_id, a.emp_name, b.department_id, b.department_name
from employees a
inner join departments b
on(a.department_id = b.department_id)
where a.hire_date > to_date('2003-01-01','yyyy-mm-dd')
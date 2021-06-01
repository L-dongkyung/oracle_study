--eual join
select a.employee_id, a.emp_name, a.department_id, b.department_name
from employees a, departments b
where a.department_id = b.department_id;

--semi join
--exists
select department_id, department_name from departments a
where exists(select * from employees b 
where a.department_id = b.department_id and b.salary > 3000)
order by a.department_name;

select department_id, department_name from departments;
--in
select department_id, department_name
from departments a
where a.department_id in (select b.department_id from employees b
where b.salary >3000)
order by department_name;

select a.department_id, a.department_name from departments a, employees b 
where a.department_id = b.department_id and b.salary >3000
order by a.department_name;
--sub query
select count(*) from employees
where salary >= (select avg(salary) from employees );

select count(*) from employees
where department_id in 
(select department_id from departments where parent_id is null);

select employee_id, emp_name, job_id from employees
where (employee_id, job_id) in
(select employee_id, job_id from job_history);

commit;
--연관성 있는 서브쿼리
select a.department_id, a.department_name from departments a
where exists (select 1 from job_history b where a.department_id = b.department_id );

select a.employee_id, 
(select b.emp_name from employees b where a.employee_id = b.employee_id) emp_name, 
a.department_id,
(select b.department_name from departments b where a.department_id = b.department_id ) dep_name
from job_history a;

select a.department_id, a.department_name
from departments a
where exists
(select 1 from employees b 
where a.department_id = b.department_id and b.salary > ( select avg(salary) from employees));

select department_id, avg(salary) from employees a
where department_id in
(select department_id from departments where parent_id = 90)
group by department_id;

update employees a set a.salary = 
(select sal from 
(select b.department_id, avg(c.salary) as sal from departments b, employees c
where b.parent_id = 90 and b.department_id = c.department_id
group by b.department_id ) d
where a.department_id = d.department_id)
where a.department_id in (select department_id from departments where parent_id = 90);

select department_id, min(salary), max(salary) from employees a 
where department_id in (select department_id from departments where parent_id = 90)
group by department_id ;

rollback;
merge into employees a
using(select b.department_id, avg(c.salary) sal from departments b, employees c
where b.parent_id = 90
and b.department_id = c.department_id 
group by b.department_id ) d
on (a.department_id = d.department_id)
when matched then
update set a.salary = d.sal;

--inline view
select a.employee_id, a.emp_name, b.department_id, b.department_name from employees a, departments b,
(select avg(c.salary) avg_salary from departments b, employees c 
where b.parent_id = 90 and b.department_id = c.department_id) d
where a.department_id = b.department_id
and a.salary > d.avg_salary;

select a.* from
(select a.sales_month, round(avg(a.amount_sold)) month_avg from sales a, customers b, countries c 
where a.sales_month between '200001' and '200012' and a.cust_id = b.cust_id
and b.country_id = c.country_id and c.country_name = 'Italy'
group by a.sales_month) a,
(select round(avg(a.amount_sold)) year_avg from sales a, customers b, countries c
where a.sales_month between '200001' and '200012'
and a.cust_id = b.cust_id
and b.country_id = c.country_id
and c.country_name = 'Italy') b
where a.month_avg > b.year_avg;
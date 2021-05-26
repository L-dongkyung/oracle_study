--1번
create table ex3_6(
employee_id number,
employee_name varchar2(20),
salary number,
manager_id number);

insert into ex3_6
select employee_id, emp_name, salary, manager_id 
from employees
where manager_id = 124 
and salary between 2000 and 3000;

--2번
delete ex3_3;
insert into ex3_3(employee_id)
select e.employee_id
from employees e, sales s
where e.employee_id = s.employee_id and s.sales_month between 200010 and 200012
group by e.employee_id;

merge into ex3_3 d
using(select employee_id, salary from employees where manager_id = 145) b
on (d.employee_id = b.employee_id)
when matched then
update set d.bonus_amt = d.bonus_amt + b.salary * 0.01
when not matched then
insert (d.employee_id, d.bonus_amt) values (b.employee_id, b.salary * 0.005);

select * from ex3_3 order by employee_id;

--3번 문제
select employee_id, emp_name from employees where commission_pct is null;

--4번 문제
select employee_id, salary from employees where salary >=2000 and salary <=2500
order by employee_id;
select employee_id, salary from employees where salary between 2000 and 2500
order by employee_id;

 --5번 문제
 select employee_id, salary from employees
 where salary = any(2000,3000,4000)
 order by employee_id;
 
 select employee_id, salary from employees
 where not salary <> all(2000,3000,4000)
 order by employee_id;
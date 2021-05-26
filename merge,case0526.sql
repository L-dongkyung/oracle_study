--merge
CREATE TABLE EX3_3 (
employee_id number,
bonus_amt number default 0);

insert into ex3_3 (employee_id) select e.employee_id from employees e, sales s
where e.employee_id = s.employee_id and s.SALES_MONTH between '200010' and '200012'
group by e.employee_id;

select * from ex3_3 order by employee_id;

select employee_id, manager_id, salary, salary * 0.01 from employees
where employee_id in (select employee_id from ex3_3);

select employee_id, manager_id, salary, salary * 0.001 from employees
where employee_id not in (select employee_id from ex3_3) and manager_id = 146;

merge into ex3_3 d
using (select employee_id, salary, manager_id from employees where manager_id = 146) b
on (d.employee_id = b.employee_id)
when matched then
update set d.bonus_amt = d.bonus_amt + b.salary * 0.01
when not matched then
insert (d.employee_id, d.bonus_amt) values (b.employee_id, b.salary *0.001)
where (b.salary < 8000);

select * from ex3_3 order by employee_id;

select a.employee_id, b.employee_id, b.manager_id from ex3_3 a, employees b where a.employee_id = b.employee_id;

merge into ex3_3 d
using(select employee_id, salary, manager_id from employees where manager_id =146) b
on(d.employee_id = b.employee_id)
when matched then
update set d.bonus_amt = d.bonus_amt + b.salary * 0.01
delete where (b.employee_id = 161)
when not matched then
insert (d.employee_id, d.bonus_amt) values(b.employee_id, b.salary*0.001)
where b.salary<8000;

select * from ex3_3 order by employee_id;

--delete
delete ex3_3;
select * from ex3_3 order by employee_id;
select partition_name from user_tab_partitions where table_name='SALES';

--commit
create table ex3_4(
employee_id number);

insert into ex3_4 values (100);
select * from ex3_4;
commit;
--truncate
truncate table ex3_4;

--의사컬럼
select rownum, employee_id from employees;
select rownum, employee_id from employees where rownum <5;
select rownum, employee_id, rowid from employees where rownum <5;

--문자 연산자 || 문자연결
select employee_id ||'-'|| emp_name employee_info from employees where rownum <5;

--case
select employee_id, salary, 
    case when salary <= 5000 then 'C등급'
        when salary >5000 and salary <=15000 then 'B등급'
        when salary > 1500 then 'A등급'
    end salary_grade
from employees;

--조건식
select employee_id, salary from employees where salary = any('2000','3000','4000')
order by employee_id;

select employee_id, salary from employees where salary = '2000' or salary = '3000' or salary = '4000'
order by employee_id;

select employee_id, salary from employees where salary = some('2000','3000','4000')
order by employee_id;

select employee_id, salary from employees where not salary >=3000
order by employee_id;

select employee_id, salary from employees where salary between '2000' and '5000'
order by employee_id;

select employee_id, salary from employees where salary is not null;
select employee_id, salary from employees where salary in ('2000','3000','4000');
select employee_id, salary from employees where salary not in ('2000','3000','4000');
select department_id, department_name from departments a 
where exists (select * from employees b where a.department_id = b.department_id and b.salary >3000)
order by a.department_name;
select a.department_id, b.department_name, a.salary from employees a, departments b 
where a.department_id = b.department_id order by a.salary desc;


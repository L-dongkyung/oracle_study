--1번
select replace(lpad(substr(phone_number, 4, 12),14,'(031)'),'.','-') from employees;

--2번
select employee_id 사원번호, emp_name 사원명, hire_date, floor((sysdate- hire_date)/365) 근속년수
from employees
where floor((sysdate- hire_date)/365) >= 22
order by 4;

-- 3번
select cust_name, TRANSLATE(cust_main_phone_number, '0123456789', 'abcdefghij'), cust_main_phone_number
from customers
order by 1;

--4번
create table exam3(
name varchar2(100),
new_phone_number varchar2(25));

-- 5번
insert into exam3 select cust_name, TRANSLATE(cust_main_phone_number, '0123456789', 'abcdefghij') 
from customers;

-- 6번
select translate(new_phone_number,'abcdefghij','0123456789') from exam3;

--7번
select cust_name,
case substr(cust_year_of_birth,1,3) when '195' then '1950년대' 
 when '196' then '1960년대' 
 when '197' then '1970년대' 
 when '198' then '1980년대' 
 when '199' then '1990년대'
 else '기타' 
end 연대
from customers;

--8번
select to_char(hire_date,'mm'), count(*)
from employees
group by to_char(hire_date,'mm')
order by 1;

--9번
select region 지역, sum(loan_jan_amt) "2011년 대출 총 잔액"
from kor_loan_status
where period like '2011%'
group by region;

select region 지역, 
sum(case when period like '2011%' then loan_jan_amt else 0 end) "2011",
sum(case when period like '2012%' then loan_jan_amt else 0 end) "2012",
sum(case when period like '2013%' then loan_jan_amt else 0 end) "2013"
from kor_loan_status
group by region;
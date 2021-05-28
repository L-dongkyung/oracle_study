--1번
select lpad(substr(phone_number, 4), 13,'(02)') phone from employees;--where rownum < 5;

--2번
select employee_id 사원번호, emp_name 사원명, hire_date 입사일자, 
(substr(sysdate,1, 4)- substr(hire_date,1,4)+1) 근속년수
from employees where substr(sysdate,1, 4)- substr(hire_date,1,4) >10
order by 근속년수 desc;

select employee_id 사원번호, emp_name 사원명, hire_date 입사일자, 
floor(months_between(sysdate, hire_date)/12) 근속년수
from employees where floor(months_between(sysdate, hire_date)/12) > 10
order by 근속년수 desc;

--3번
select replace(cust_main_phone_number, '-','/') phone from customers ;

--4번
select TRANSLATE(cust_main_phone_number, '0123456789', 'abcdefghij') 암호문 from customers;

--5번
select decode(substr(to_char(sysdate, 'YYYY')-cust_year_of_birth,1,1) , 
3, '30대',
4, '40대',
5, '50대',
'기타') 나이대
from customers;

--6번
select substr(sysdate,1, 4)-cust_year_of_birth 나이,
case when substr(sysdate,1,4)-cust_year_of_birth < 20 then '10대'
     when substr(sysdate,1, 4)-cust_year_of_birth < 30 then '20대'
     when substr(sysdate,1, 4)-cust_year_of_birth < 40 then '30대'
     when substr(sysdate,1, 4)-cust_year_of_birth < 50 then '40대'
     when substr(sysdate,1, 4)-cust_year_of_birth < 60 then '50대'
     when substr(sysdate,1, 4)-cust_year_of_birth < 70 then '60대'
     when substr(sysdate,1, 4)-cust_year_of_birth < 80 then '70대'
     when substr(sysdate,1, 4)-cust_year_of_birth < 90 then '80대'
     else '90대'
     end ㄴㅏ이대
from customers;



select 2021-cust_year_of_birth from customers where 2021-cust_year_of_birth <= 30;


select 2021-cust_year_of_birth, cust_year_of_birth from customers;

select rpad(30,1) from dual;

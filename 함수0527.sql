--숫자 함수
select abs(10), abs(-10), abs(-10.123) from dual;
select ceil(10.123), ceil(10), ceil(11.1) from dual;
select floor(10), floor(10.123), floor(11.123) from dual;
select round(10.123), round(10.987), round(11.5) from dual;
select round(10.123, 1), round(11.987, 2) from dual;
select round(0,3), round(115.155, -1), round(115.1, -2) from dual;
select trunc(115.155), trunc(115.155, 1), trunc(115.111, -1), trunc(111.111,-2)
from dual;

select power(3, 2), power(3,3), power(3, 3.0001) from dual;
select power(-3, 3.0001) from dual; -- 앞이 마이너스면 뒤가 정수형!!!
select sqrt(4),sqrt(2), sqrt(5) from dual;
select mod(19,4), mod(19.123, 4.2) from dual;
select remainder(19, 4), remainder(19.123, 4.2) from dual;
select exp(2), ln(2.71828182), log(10, 100) from dual;

--문자함수
select initcap('never say goodbye') from dual;
select lower('NEVER SAY GOODBYE') from dual;
select upper('never say goodbye') from dual;
select concat('hello','world') from dual;
select substr('abcdefg',1,4), substr('abcdefg',-1, 3) from dual;
select ltrim('abcdefgabc', 'abc'), ltrim('가나다라마바사가나다','가나다') from dual;
select rtrim('abcdefgabc', 'abc'), rtrim('가나다라가나다','가나다') from dual;
create table ex4_1(
phone_num varchar2(30));
insert into ex4_1 values('111-1111');
insert into ex4_1 values('111-2222');
insert into ex4_1 values('111-3333');
select lpad(phone_num, 12, '(02)') from ex4_1;
select rpad(phone_num, 12, '(02)') from ex4_1;
select replace('나는 너를 모르는데 너는 나를 알겠는가?', '나', '너') from dual;
select TRANSLATE('나는 너를 모르는데 너는 나를 알겠는가?', '나는', '너를') from dual;
select INSTR('내가만약 외로울때면, 내가만약 괴로울때면, 내가만약 즐거울때면', '만약') as instr1,
INSTR('내가만약 외로울때면, 내가만약 괴로울때면, 내가만약 즐거울때면', '만약', 5) as instr2,
INSTR('내가만약 외로울때면, 내가만약 괴로울때면, 내가만약 즐거울때면', '만약',5,2) as instr3
from dual;
select length('대한민국') from dual;
select LENGTHB('대한민국') from dual;

--날짜함수
select sysdate, systimestamp from dual;
select add_months(sysdate, 1), add_months(sysdate, -1) from dual;
select months_between(sysdate, add_months(sysdate, 1)) mon1,
months_between(add_months(sysdate,1),sysdate) mon2 from dual;
select last_day(sysdate) from dual;

-- 변환함수
select to_char(123456789, '999,999,999') from dual;
select to_char(sysdate, 'yyyy-mm-dd') from dual;
select to_number('123456') from dual;
select to_date('20210527','yyyy-mm-dd') from dual;
select to_timestamp('20210527 12:19:50', 'yyyy-mm-dd hh24:mi:ss') from dual;

-- null 함수
select nvl(manager_id, employee_id) from employees where manager_id is null;
select employee_id, salary,commission_pct, nvl2(commission_pct, salary+ (salary*commission_pct), salary ) as salary2 from employees;
select employee_id, salary, commission_pct, coalesce(salary*commission_pct, salary) salary2 from employees;
select employee_id, commission_pct from employees where commission_pct<0.2;
select employee_id, commission_pct from employees where nvl(commission_pct,0)<0.2;
select employee_id, commission_pct from employees where lnnvl(commission_pct >= 0.2);
--1번
declare
num number :=3;
begin
dbms_output.put_line('3*1 = '||num*1);
dbms_output.put_line('3*2 = '||num*2);
dbms_output.put_line('3*3 = '||num*3);
dbms_output.put_line('3*4 = '||num*4);
dbms_output.put_line('3*5 = '||num*5);
dbms_output.put_line('3*6 = '||num*6);
dbms_output.put_line('3*7 = '||num*7);
dbms_output.put_line('3*8 = '||num*8);
dbms_output.put_line('3*9 = '||num*9);
end;
/
--2번
declare
empname employees.emp_name%type;
email employees.email%type;
begin
select emp_name, email
into empname, email
from employees
where employees.employee_id = 201;
dbms_output.put_line(empname ||' - '|| email);
end;
--DBMS_OUTPUT.PUT_LINE('201번' || CHR(10) || CHR(13) || '사원명 : '|| vs_emp_name || CHR(10)|| CHR(13) || '이메일 ' || vs_emp_email);
/
--3번
declare
search_id employees.employee_id%type;
plus constant number:=1;
begin
select max(employee_id) into search_id from employees a ;
insert into employees(employee_id, emp_name, email, hire_date, department_id) 
values (search_id+plus, 'Harrison Ford', 'HARRIS', sysdate, 50);
end;
/
select max(employee_id) from employees a;
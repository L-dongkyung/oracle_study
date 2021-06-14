set SERVEROUTPUT ON
--1번
declare
vn_base_num number := 3;
begin
for i in 1..9
loop
dbms_output.put_line(vn_base_num || ' * ' || i || ' = ' || vn_base_num*i);
end loop;
end;
/
--2번
create or replace function my_initcap(ps_string varchar2)
return varchar2
is
    vs_string varchar2(800);
    vn_start_index number := 1;
    vn_end_index number;
    vs_1string varchar2(10);
    vs_2string varchar2(80);
begin
    vs_1string := upper(substr(ps_string, 1, 1));
    vn_end_index := instr(ps_string, ' ')-1;
    if vn_end_index = -1 then
        vn_end_index := length(ps_string);
    end if;
    vs_2string := substr(ps_string,2,vn_end_index-vn_start_index);
    vs_string := vs_1string||vs_2string;
    while vn_end_index <> length(ps_string)
    loop
        vn_start_index := instr(ps_string, ' ',vn_start_index)+1;
        vs_1string := upper(substr(ps_string,vn_start_index,1));
        vn_end_index := instr(ps_string, ' ', vn_start_index)-1;
        if vn_end_index = -1 then
            vn_end_index := length(ps_string);
        end if;
        vs_2string := substr(ps_string, vn_start_index +1, vn_end_index - vn_start_index);
        vs_string := vs_string ||' '|| vs_1string || vs_2string;
    end loop;
    return vs_string;
end;
/
select my_initcap('oracle so diff') from dual;
/
select substr('lee dong kyung', 6, 3) from dual;
/
--3번
create or replace procedure my_last_day (vs_date varchar2)
is
begin
dbms_output.put_line(last_day(vs_date));
end;
/
create or replace function my_last(ps_date varchar2)
return varchar2
is
    vd_date date := to_date(ps_date,'YYYY-MM-DD');
    vs_start_mon date := trunc(vd_date,'month');
    vs_next_mon date := add_months(vs_start_mon, 1);
    vs_return varchar2(100);
begin
    vs_return := to_char(vs_next_mon-1,'YYYY-MM-DD');
    return vs_return;
end;
/
select my_last('2021-12-21') from dual;
/
select to_char(1,'99') from dual;
/
--4번
--pass
--5번
create or replace procedure my_new_job_proc2(
    p_job_id in jobs.job_id%type,
    p_job_title in jobs.job_title%type,
    p_min_sal in jobs.min_salary%type,
    p_max_sal in jobs.max_salary%type
    )
is
begin    
    merge into jobs a
--    using(select job_id, job_title, min_salary, max_salary from jobs where job_id = p_job_id) b
    using(select p_job_id job_id from dual) b
    on(a.job_id = b.job_id)
    when matched then
        update set a.job_title = p_job_title,
                        a.min_salary = p_min_sal,
                        a.max_salary = p_max_sal
    when not matched then
        insert (a.job_id, a.job_title, a.min_salary, a.max_salary)
        values (p_job_id, p_job_title, p_min_sal, p_max_sal);
end;
/
exec my_new_job_proc2('study1', 'human', 1000, 5000);
commit;
/
--6번
create table ch09_departments as
select department_id, department_name, parent_id
from departments;
/
create or replace procedure my_dept_manage_proc(
    p_dep_id departments.department_id%type,
    p_dep_name departments.department_name%type,
    p_par_id departments.parent_id%type,
    p_flag varchar2
    )
is
    emp_cnt number := 0;
begin
    if p_flag = 'upsert' then
        merge into ch09_departments a
        using (select p_dep_id from dual) b
        on(a.department_id = b.p_dep_id)
        when matched then
        update set a.department_name = p_dep_name,
                    a.parent_id = p_par_id
        when not matched then
        insert (a.department_id, a.department_name, a.parent_id)
        values (p_dep_id, p_dep_name, p_par_id);
    elsif p_flag = 'delete' then
        select count(*) into emp_cnt from employees c
        where c.department_id = p_dep_id;
        if emp_cnt = 0 then
            delete from ch09_departments
            where department_id = p_dep_id;
        else
            dbms_output.put_line('해당부서에 속한 사원이 있다');
        end if;
    else
        dbms_output.put_line('flag를 올바르게 입력');
    end if;
end;
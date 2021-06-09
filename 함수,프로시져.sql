set serveroutput on
create or replace function my_mod(num1 number, num2 number)     -- 함수
return number
is
    vn_remainder number:=0;
    vn_quotient number :=0;
begin
    vn_quotient := floor(num1/num2);
    vn_remainder := num1 - (num2 * vn_quotient);
    RETURN vn_remainder;
end;
/
select my_mod(14, 3) remainder from dual;
/
create or replace function fn_get_country_name(p_country_id number)
    return varchar2
is
    vs_country_name countries.country_name%type;
begin
    select country_name into vs_country_name
    from countries
    where country_id = p_country_id;
    return vs_country_name;
end;
/
select fn_get_country_name (52777) coun1, fn_get_country_name(10000) coun2 from dual;
/
create or replace function fn_get_country_name( p_country_id number)
    return varchar2
is
    vs_country_name countries.country_name%type;
    vn_count number :=0;
begin
    select count(*) into vn_count from countries
    where country_id = p_country_id;
    if vn_count=0 then
        vs_country_name := '해당국가 없음';
    else
        select country_name into vs_country_name
        from countries
        where country_id = p_country_id;
    end if;
    return vs_country_name;
end;
/
select fn_get_country_name(52777) coun1, fn_get_country_name(10000)coun2 from dual;
/
create or replace function fn_get_user
    return varchar2
is 
    vs_user_name varchar2(80);
begin
    select user into vs_user_name from dual;
    return vs_user_name;
end;
/
select fn_get_user, fn_get_user() from dual;
/
create or replace procedure my_new_job_proc         --프로시져
(p_job_id in jobs.job_id%type,
 p_job_title in jobs.job_title%type,
 p_min_sal in jobs.min_salary%type,
 p_max_sal in jobs.max_salary%type)
is
    
begin
    insert into jobs(job_id, job_title, min_salary, max_salary, create_date, update_date)
    values(p_job_id, p_job_title, p_min_sal, p_max_sal, sysdate, sysdate);
    commit;
end;
/
exec my_new_job_proc('SM_JOB1','Sample JOB1',1000,5000);
/
select * from jobs where job_id = 'SM_JOB1';
/
exec my_new_job_proc ('SM_JOB1', 'Sample JOB1',1000,5000);
/
create or replace procedure my_new_job_proc
(p_job_id in jobs.job_id%type,
 p_job_title in jobs.job_title%type,
 p_min_sal in jobs.min_salary%type,
 p_max_sal in jobs.max_salary%type)
 is
    vn_cnt number :=0;
begin
    select count(*) into vn_cnt from jobs where job_id = p_job_id;
    if vn_cnt =0 then
        insert into jobs values (p_job_id, p_job_title, p_min_sal, p_max_sal, sysdate, sysdate);
    else
        update jobs set job_title = p_job_title,
                        min_salary = p_min_sal,
                        max_salary = p_max_sal,
                        update_date = sysdate
        where job_id = p_job_id;
    end if;
    commit;
end;
/
exec my_new_job_proc('SM JOB1','Sample JOB1',2000,6000);

select * from jobs where job_id = 'SM JOB1';
/
execu my_new_job_proc(p_job_id => 'SM JOB1', p_job_title => 'Sample JOB1', 
                        p_min_sal => 2000, p_max_sal => 5000);
/
select * from jobs where job_id = 'SM JOB1';
/
create or replace procedure my_new_job_proc
(p_job_id in jobs.job_id%type,
 p_job_title in jobs.job_title%type,
 p_min_sal in jobs.min_salary%type := 0,
 p_max_sal in jobs.max_salary%type := 0)
 is
    vn_cnt number :=0;
begin
    select count(*) into vn_cnt from jobs where job_id = p_job_id;
    if vn_cnt =0 then
        insert into jobs values (p_job_id, p_job_title, p_min_sal, p_max_sal, sysdate, sysdate);
    else
        update jobs set job_title = p_job_title,
                        min_salary = p_min_sal,
                        max_salary = p_max_sal,
                        update_date = sysdate
        where job_id = p_job_id;
    end if;
    commit;
end;
/
exec my_new_job_proc('SM JOB1', 'Sample JOB1');

select * from jobs where job_id = 'SM JOB1';
/
create or replace procedure my_new_job_proc     --프로시져 아웃  변수
(p_job_id in jobs.job_id%type,
 p_job_title in jobs.job_title%type,
 p_min_sal in jobs.min_salary%type := 0,
 p_max_sal in jobs.max_salary%type := 0,
 p_upd_date out jobs.update_date%type            --out 변수 추가
 )
 is
    vn_cnt number :=0;
    vn_cur_date jobs.update_date%type := sysdate;       --변수 추가
begin
    select count(*) into vn_cnt from jobs where job_id = p_job_id;
    if vn_cnt =0 then
        insert into jobs values (p_job_id, p_job_title, p_min_sal, p_max_sal, sysdate, sysdate);
    else
        update jobs set job_title = p_job_title,
                        min_salary = p_min_sal,
                        max_salary = p_max_sal,
                        update_date = vn_cur_date
        where job_id = p_job_id;
    end if;
    p_upd_date := vn_cur_date;
    commit;
end;
/
declare 
    vd_cur_date jobs.update_date%type;
begin
    my_new_job_proc('SM JOB1','Sample JOB1', 2000, 6000, vd_cur_date);
    dbms_output.put_line(vd_cur_date);
end;
/
create or replace procedure my_parameter_test_proc (
    p_var1  varchar2,
    p_var2 out  varchar2,
    p_var3 in out varchar2)
is
begin
    dbms_output.put_line('in var1 = ' || p_var1);
    dbms_output.put_line('in var2 = ' || p_var2);
    dbms_output.put_line('in var3 = ' || p_var3);
    
    p_var2 := 'B2';
    p_var3 := 'C2';
end;
/
declare 
    v_var1 varchar2(80) := 'A';
    v_var2 varchar2(80) := 'B';
    v_var3 varchar2(80) := 'C';
begin
    my_parameter_test_proc(v_var1, v_var2, v_var3);
    dbms_output.put_line('var1 = ' || v_var1);
    dbms_output.put_line('var2 = ' || v_var2);
    dbms_output.put_line('var3 = ' || v_var3);
end;
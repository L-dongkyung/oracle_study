create or replace procedure my_new_job_proc(        --procedure return 
p_job_id    in jobs.job_id%type,
p_job_title in jobs.job_title%type,
p_min_sal   in jobs.min_salary%type := 10,
p_max_sal   in jobs.max_salary%type := 100
)
is
    vn_cnt number:=0;
    vn_cur_date jobs.update_date%type := sysdate;
begin
    if p_min_sal < 1000 then
        dbms_output.put_line('최소 급여값은 1000 이상이어야 합니다.');
        return;
    end if;
    
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
    --p_upd_date := vn_cur_date;
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
exec my_new_job_proc('SM JOB1','Sample JOB1', 999,6000);
/
declare 
    vs_emp_name    varchar2(80);
begin
    vs_emp_name := 'hong';
     update employees
     set emp_name = vs_emp_name
     where employee_id = 100;
     
     select emp_name into vs_emp_name from employees where employee_id = 100;
     
     dbms_output.put_line(vs_emp_name);
end;
/
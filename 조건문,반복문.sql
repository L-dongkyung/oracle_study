set serveroutput on

declare         --if else
  vn_num1 number := 1;
  vn_num2 number := 2;
begin
  if vn_num1 >= vn_num2 then
    dbms_output.put_line(vn_num1 || '이 큰수');
  else
    dbms_output.put_line(vn_num2|| '이 큰수');
  end if;
end;
/

declare     --if elsif else
  vn_salary number:= 0;
  vn_department_id number := 0 ;
begin
    vn_department_id := round(dbms_random.value (10,120), -1);
        select salary into vn_salary from employees
        where department_id = vn_department_id
        and rownum = 1;
    dbms_output.put_line(vn_salary);
    
    if vn_salary between 1 and 3000 then
        dbms_output.put_line('낮음');
    elsif vn_salary between 3001 and 6000 then
        dbms_output.put_line('중간');
    elsif vn_salary between 6001 and 10000 then
        dbms_output.put_line('높음');
    else
        dbms_output.put_line('최상위');
    end if;
end;
/
declare       --if if
    vn_salary number:= 0;
    vn_department_id number := 0;
    vn_commission number(5,3) := 0;
begin
    vn_department_id := round(dbms_random.value(10,120),-1);
    
        select salary, commission_pct into vn_salary, vn_commission
        from employees
        where department_id = vn_department_id
        and rownum=1;
    dbms_output.put_line(vn_salary);
    
    if vn_commission >0 then
        if vn_commission > 0.15 then
            dbms_output.put_line(vn_salary*vn_commission);
        end if;
    else
        dbms_output.put_line(vn_salary);
    end if;
end;
/
declare     --case
    vn_salary number:=0;
    vn_department_id number:=0;
begin
    vn_department_id := round(dbms_random.value(10,120), -1);
        select salary into vn_salary from employees
        where department_id = vn_department_id
        and rownum=1;
    dbms_output.put_line(vn_salary);
    
    case when vn_salary between 1 and 3000 then
            dbms_output.put_line('낮음');
        when vn_salary between 3001 and 6000 then
            dbms_output.put_line('중간');
        when vn_salary between 6001 and 10000 then
            dbms_output.put_line('높음');
        else
            dbms_output.put_line('최상위');
    end case;
end;
/
declare    --loop
    vn_base_num number := 3;
    vn_cnt      number := 1;
begin
    loop
        dbms_output.put_line (vn_base_num || ' * ' || vn_cnt || ' = ' || vn_base_num*vn_cnt);
        vn_cnt := vn_cnt + 1;
        
        exit when vn_cnt >9;
    end loop;
end;
/
declare     -- while
    vn_base_num number := 3;
    vn_cnt      number := 1;
begin
while vn_cnt <=9
loop
    dbms_output.put_line(vn_base_num || ' * ' || vn_cnt || ' = ' || vn_base_num * vn_cnt);
    vn_cnt := vn_cnt + 1;
end loop;
end;
/
declare     -- while exit
    vn_base_num number := 3;
    vn_cnt      number := 1;
begin
while vn_cnt <=9
loop
    dbms_output.put_line(vn_base_num || ' * ' || vn_cnt || ' = ' || vn_base_num * vn_cnt);
    exit when vn_cnt = 5;
    vn_cnt := vn_cnt + 1;
end loop;
end;
/
declare     -- for
    vn_base_num number := 3;
begin
for i in 1..9
loop
    dbms_output.put_line(vn_base_num || ' * ' || i || ' = ' || vn_base_num*i);
end loop;
end;
/
declare     -- for reverse
    vn_base_num number := 3;
begin
for i in reverse 1..9
loop
    dbms_output.put_line(vn_base_num || ' * ' || i || ' = ' || vn_base_num*i);
end loop;
end;
/
declare
    vn_base_num number :=3;
begin
    <<third>>
    for i in 1..9
    loop
        dbms_output.put_line(vn_base_num || ' * ' || i || ' = ' || vn_base_num * i);
        if i =3 then
            goto fourth;
        end if;
    end loop;
    
    <<fourth>>
    vn_base_num :=4;
    for i in 1..9
    loop
        dbms_output.put_line (vn_base_num || ' * '|| i || ' = ' || vn_base_num * i);
    end loop;
end;
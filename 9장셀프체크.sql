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
create table ch09_dept(
department_id number,
department_name varchar2(100),
levels number);
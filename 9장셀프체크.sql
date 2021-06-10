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
exec my_last_day('2021-02-21');
/
--4번
create table ch09_dept(
department_id number,
department_name varchar2(100),
levels number);
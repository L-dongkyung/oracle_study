select a.employee_id, a.emp_name, a.department_id, b.department_name 
from employees a, departments b where a.department_id = b.department_id;

--select em.사원id, em.사원명, em.부서 id, de.부서명 
--from employees em, departments de
--where em.부서 id = de.부서 id;

create or replace view emp_dept_v1 as
select a.employee_id, a.emp_name, a.department_id, b.department_name 
from employees a, departments b where a.department_id = b.department_id;

select * from emp_dept_v1;

drop view emp_dept_v1;

create view testview as select * from ex2_10;
drop view testview;

-- 인덱스(b-tree,비트맵,함수기반)

-- B-tree인덱스: 인덱스 키와 키에 해당하는 컬럼 값을 가진 테이블로우가 저장된 주소값


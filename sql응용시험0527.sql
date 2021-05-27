CREATE TABLE PRODUCT (
PRODUCT_ID NUMBER(12,0),
PRODUCT_NAME VARCHAR2(8 BYTE),
QUANTITY NUMBER(10,0) DEFAULT 0,
ORDER_DATE DATE,
ORDER_MODE VARCHAR2(8 BYTE),
DESCRIPTION VARCHAR2(20 BYTE),
STANDARD_COST NUMBER(4,0),
LIST_PRICE NUMBER(8,2) DEFAULT 0,
CATEGORY_ID NUMBER(6,0),
PROMOTION_ID NUMBER(6,0),
CONSTRAINT PK_PRO_ID PRIMARY KEY(PRODUCT_ID),
CONSTRAINT CHECK_MODE CHECK (ORDER_MODE IN ('direct', 'online'))
);

CREATE TABLE exam2_1(
employee_id NUMBER(6),
emp_name VARCHAR2(80),
salary NUMBER(8,2),
manager_id NUMBER(6)
);

INSERT into exam2_1 select employee_id, emp_name, salary, manager_id 
from employees 
where manager_id = 147 and salary between 6000 and 7000;

select * from exam2_1;

CREATE TABLE EXAM2_2(
employee_id NUMBER,
bonus_amt NUMBER DEFAULT 0);

INSERT INTO exam2_2 (employee_id) SELECT e.employee_id FROM employees e, sales s
WHERE E.EMPLOYEE_ID = s.employee_id AND s.SALES_MONTH BETWEEN '200010' AND '200012'
GROUP BY e.employee_id;
COMMIT;
SELECT * FROM EXAM2_2;

MERGE INTO exam2_2 a
USING (SELECT employee_id, salary, manager_id 
from employees where manager_id = 146) e
on(a.employee_id = e.employee_id)
WHEN MATCHED THEN
UPDATE SET a.bonus_amt = e.salary * 0.05
WHEN NOT MATCHED THEN
INSERT (a.employee_id, a.bonus_amt) 
VALUES(e.employee_id, e.salary * 0.02);

SELECT employee_id, emp_name from employees where department_id is null;

SELECT employee_id, salary FROM employees 
WHERE salary >= 4500 AND salary <=5000
ORDER BY employee_id;

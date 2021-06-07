select b.연도, a.사원아이디, c.emp_name, b.매출액
from
(SELECT 연도, 사원아이디, max(매출액) 매출액
from(SELECT substr(c.sales_month, 1,4) 연도, a.employee_id 사원아이디, sum(c.amount_sold) 매출액
FROM employees a, countries b, sales c, customers d
where c.employee_id = a.employee_id
and d.country_id = b.country_id
and b.country_name = 'Italy'
and d.cust_id = c.cust_id
group by substr(c.sales_month, 1,4), a.employee_id
order by 1) a
group by 연도, 사원아이디) a
left join employees c
on(a.사원아이디= c.employee_id),
(SELECT 연도, max(매출액) 매출액
from(SELECT substr(c.sales_month, 1,4) 연도, sum(c.amount_sold) 매출액
FROM employees a, countries b, sales c, customers d
where c.employee_id = a.employee_id
and d.country_id = b.country_id
and b.country_name = 'Italy'
and d.cust_id = c.cust_id
group by substr(c.sales_month, 1,4), a.employee_id
order by 1) a
group by 연도) b
where a.매출액 = b.매출액
order by 1;

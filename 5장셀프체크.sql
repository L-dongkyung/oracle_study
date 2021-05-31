--1번
select substr(hire_date,1,4), count(*) 사원수 from employees
group by substr(hire_date,1,4);

--2번
select period, region ,sum(loan_jan_amt) from kor_loan_status
where period like '2012%'
GROUP by period, region
order by 1;

--3번
select period, gubun, sum(loan_jan_amt) total_jan
from kor_loan_status
where period like '2013%'
group by period, rollup(gubun);

select period, gubun, sum(loan_jan_amt) total_jan
from kor_loan_status
where period like '2013%'
group by period, gubun
UNION
select period, null, sum(loan_jan_amt) total_jan
from kor_loan_status
where period like '2013%'
group by period;

--4번
select period,
case when gubun='주택담보대출' then sum(loan_jan_amt) else 0 end 주택담보대출액,
case when gubun='기타대출' then sum(loan_jan_amt) else 0 end 기타대출액
from kor_loan_status
where period = '201311'
group by period, gubun;

select period, sum(loan_jan_amt) 주택담보대출액, 0 기타대출액 from kor_loan_status
where period = '201311' AND gubun = '주택담보대출'
GROUP by period
union
select period, 0, sum(loan_jan_amt) 기타대출액 from kor_loan_status
where period = '201311' AND gubun = '기타대출'
GROUP by period;


--5번
select region 지역, sum(loan_jan_amt) "201111",

from kor_loan_status
where period between 201111 and 201112 
group by region, period;
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
select region 지역, 
sum(amt1111) "201111",
sum(amt1112) "201112",
sum(amt1210) "201210",
sum(amt1211) "201211",
sum(amt1212) "201212",
sum(amt1310) "201310",
sum(amt1311) "201311"
from (select region,
case when period = '201111' then loan_jan_amt else 0 end amt1111,
case when period = '201112' then loan_jan_amt else 0 end amt1112,
case when period = '201210' then loan_jan_amt else 0 end amt1210,
case when period = '201211' then loan_jan_amt else 0 end amt1211,
case when period = '201212' then loan_jan_amt else 0 end amt1212,
case when period = '201310' then loan_jan_amt else 0 end amt1310,
case when period = '201311' then loan_jan_amt else 0 end amt1311
from kor_loan_status)
group by region;

select region 지역,
sum(case when period = '201111' then loan_jan_amt else 0 end) "201111",
sum(case when period = '201112' then loan_jan_amt else 0 end) "201112",
sum(case when period = '201210' then loan_jan_amt else 0 end) "201210",
sum(case when period = '201211' then loan_jan_amt else 0 end) "201211",
sum(case when period = '201212' then loan_jan_amt else 0 end) "201212",
sum(case when period = '201310' then loan_jan_amt else 0 end) "201310",
sum(case when period = '201311' then loan_jan_amt else 0 end) "201311"
from kor_loan_status
group by region;

--count 함수
select count(*) from employees;

select count(employee_id) from employees;

select count (department_id) from employees;

select count(DISTINCT department_id) from employees;

select distinct department_id from employees order by 1;

--group by 함수
select department_id, sum(salary) from employees
group by department_id
order by 1;

select period, region, sum(loan_jan_amt) totl_jan
from kor_loan_status
where period like '2013%'
group by period, region
order by 1,2;

select period, region, sum(loan_jan_amt) totl_jan
from kor_loan_status
where period = '201311'
group by  period, region
order by 2;

select period, region, sum(loan_jan_amt) total_jan
from kor_loan_status
where period ='201310'
group by period, region
having sum(loan_jan_amt)<50000 
order by 3;

-- rollup
select period, gubun, sum(loan_jan_amt) total_jan
from kor_loan_status
where period like '2013%'
group by period, rollup(gubun);

select period, gubun, sum(loan_jan_amt) total_jan
from kor_loan_status
where period like '2013%'
group by period, rollup(gubun);

-- cube
select period, gubun, sum(loan_jan_amt) total_jan
from kor_loan_status
where period like '2013%'
group by cube(period, gubun);

select period, gubun, sum(loan_jan_amt) total_jan
from kor_loan_status
where period like '2013%'
group by period, rollup(gubun);

--union
create table exp_goods_asia(
country varchar2(10),
seq number,
goods varchar2(80));

insert into exp_goods_asia values ('한국', 1, '원유제외 석유류');
insert into exp_goods_asia values ('한국', 2, '자동차');
insert into exp_goods_asia values ('한국', 3, '전자집적회로');
insert into exp_goods_asia values ('한국', 4, '선박');
insert into exp_goods_asia values ('한국', 5, 'LCD');
insert into exp_goods_asia values ('한국', 6, '자동차부품');
insert into exp_goods_asia values ('한국', 7, '휴대전화');
insert into exp_goods_asia values ('한국', 8, '환식탄화수소');
insert into exp_goods_asia values ('한국', 9, '무선송신기 디스플레이 부속품');
insert into exp_goods_asia values ('한국', 10, '철 또는 비합금강');

INSERT INTO exp_goods_asia VALUES ('일본', 1, '자동차');
INSERT INTO exp_goods_asia VALUES ('일본', 2, '자동차부품');
INSERT INTO exp_goods_asia VALUES ('일본', 3, '전자집적회로');
INSERT INTO exp_goods_asia VALUES ('일본', 4, '선박');
INSERT INTO exp_goods_asia VALUES ('일본', 5, '반도체웨이퍼');
INSERT INTO exp_goods_asia VALUES ('일본', 6, '화물차');
INSERT INTO exp_goods_asia VALUES ('일본', 7, '원유제외 석유류');
INSERT INTO exp_goods_asia VALUES ('일본', 8, '건설기계');
INSERT INTO exp_goods_asia VALUES ('일본', 9, '다이오드, 트랜지스터');
INSERT INTO exp_goods_asia VALUES ('일본', 10, '기계류');

select goods from exp_goods_asia
where country = '한국'
order by seq;
select goods from exp_goods_asia
where country = '일본'
order by seq;

select goods from exp_goods_asia
where country = '한국'
union
select goods from exp_goods_asia
where country = '일본';

select goods from exp_goods_asia
where country = '한국'
union all
select goods from exp_goods_asia
where country = '일본';

select goods from exp_goods_asia
where country = '한국'
INTERSECT
select goods from exp_goods_asia
where country = '일본';

select goods from exp_goods_asia
where country = '한국'
minus
select goods from exp_goods_asia
where country = '일본';

select seq, goods from exp_goods_asia -- error
where country = '한국'
union
select goods from exp_goods_asia
where country = '일본';

select seq, goods from exp_goods_asia
where country = '한국'
union
select seq, goods from exp_goods_asia
where country = '일본';

select seq, goods from exp_goods_asia
where country = '한국'
INTERSECT
select seq, goods from exp_goods_asia
where country = '일본';

select seq, goods from exp_goods_asia
where country = '한국'
union
select seq, goods from exp_goods_asia
where country = '일본'
order by goods;
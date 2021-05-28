--기타함수
select greatest(1,2,3,2) , least(1,2,3,2) from dual;
select greatest('이순신', '강감찬','세종대왕'), least ('이순신','강감찬','세종대왕') from dual;

select prod_id, 
decode( channel_id, 3, 'Direct',
                    9, 'Direct2',
                    5, 'Indirect',
                    4, 'indirect2',
                        'others') decodes 
from sales where rownum<10;
--**숫자형 함수
select player_name, length(player_name) as 길이 from player;

--소문자로 바꾸어주는 함수
select lower('SQL Expert') as result from dual;

--아스키 변환 > 65
select ascii('A') from dual;

--아스키 변환 > A
select chr(65) from dual;

select concat('RDBMS','SQL') from dual;
select 'RDBMS' || 'SQL' from dual;

--Expert (idx는 1부터)
select substr('SQL Expert',5) from dual;
--Exp
select substr('SQL Expert',5,3) from dual;

select length('APPLE') from dual;

select ltrim('zzzxxz','z') from dual;
select rtrim('zzzxxz','z') from dual;
select trim('z' from 'zzzxxz') from dual;

select player_name, concat(substr(player_name,1,length(player_name)-1),'*') from player;

select exp(1) from dual;
select power(3,2) from dual;




--**변환형 함수

--암시적 변환
select player_id, mod(player_id,4) from player;
--명시적 변환
select player_id, mod(to_number(player_id),4) from player;

--암시적 형변환
select '1'+'1' from dual;
select to_number('1')+to_number('1') from dual;

select to_char(20) from dual;
select sysdate from dual;
--암시적 형변환
select sysdate +2 from dual;

--날짜를 문자열로 변환
select to_char(sysdate) from dual;
select to_char(sysdate,'YYYY-MM-DD') from dual;

select extract(year from sysdate) from dual;
select extract(year from to_date('2020/01/01')) from dual;

select extract(month from birth_date) from player;

select player_name, birth_date, trunc(sysdate,'DD')-trunc(birth_date,'DD') from player;


--**Case 절
select player_name, height,
case when height >180
then height
else 180
end as new_height
from player;

--searched case expression
select player_name,
case when position ='GK' then '골키퍼'
else '그 외'
end as 포지션
from player;

--simple case expression
select player_name, case position
when 'GK' then '골키퍼2'
else '그 외2'
end as 포지션2
from player;

--DECODE
select player_name, DECODE(position,
'GK','골키퍼3',
'DF','수비수',
'그 외3') as position
from player;

select player_name, position from player
where position is null;

--coalesce
select e_player_name, nickname, player_name,
coalesce(e_player_name, nickname, player_name)
from player;

select player_name, position,
case when position is null then '없음'
else position
end as 포지션
from player;

select * from emp;

--nvl 이 필요한 이유
select ename, sal, comm, (sal*12) +nvl(comm,0) as 연봉 from emp where empno=7369;

--nullif (아래와 두가지 방식 모두 알기)
select player_name,position,
case when position='GK' then null
else position
end as 포지션
from player;

select player_name, position,
nullif(position,'GK') as 포지션
from player;
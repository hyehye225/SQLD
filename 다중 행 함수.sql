select * from player;

select count(distinct team_id) from player;

--개별 컬럼은 쓸 수 없다. (group by의 그룹의 기준이 되는 컬럼은 ok)
--각종 집계 함수들이 올 수 있다.
select position 포지션,count(*) 전체행수, count(height) 키건수, round(avg(height)) 평균키
from player group by position;

--where 절 사용 -> error, where 절이 group by 절보다 먼저 수행되기 때문 -> having 사용
select position, round(avg(height),2) 평균키
from player where avg(height)>=180
group by position;

select position, round(avg(height),2) 평균키
from player 
group by position
having avg(height) >= 180;

select round(avg(height),2) 평균키, position
from player
group by position
having max(height) >= 190;

select dname, job, count(*) 직원수, sum(sal) as 급여합
from emp, dept
where dept.deptno=emp.deptno
group by dname,job
order by dname, job;

--맞지 않은 방법 (order by는 마지막)
select player_name, height, rownum
from player where rownum < 4 order by height;

select player_name, height, orgno, rownum
from (select player_name, height, rownum as orgno from player order by height)
where rownum < 4;

--인라인 뷰의 select 절에 명시되지 않은 칼럼은 메인 쿼리에서 사용 불가
select player_name, height
from (select player_name, height from player where position='MF')
order by position;

select player_name, height
from (select player_name, position, height from player where position='MF')
order by position;

--rollup
select dname, job, count(*) 직원수, sum(sal) as 급여합
from emp, dept
where dept.deptno=emp.deptno
group by rollup(dname,job)
order by dname,job;

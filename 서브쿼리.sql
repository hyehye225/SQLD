select team_id from player where player_id='2007182';

select player_name, team_id
from player
where team_id=
(select team_id from player where player_id='2007182');

update emp set mgr =(select mgr from emp where empno=7369)
where empno=7499;

select empno, mgr from emp where empno=7499 or empno=7369;

select height from player where back_no =19;

select player_name, height, back_no
from player
where height >= any (select height from player where back_no =19);

select ename,sal,deptno
from emp m
where 
sal > (select avg(s.sal) from emp s where m.deptno=s.deptno);

select deptno, max(sal) from emp group by deptno;

select ename, deptno, sal
from emp
where (deptno,sal) in (select deptno, max(sal) from emp group by deptno);

--스칼라 서브쿼리
--함수 안에도 스칼라 서브쿼리가 사용될 수 있다.
select empno, ename, substr((select dname from dept where deptno=a.deptno),1,3) as dname from emp a;

--뷰 생성
create view v_emp_dept as
select ename, empno, deptno, dname
from emp join dept
using (deptno);

select * from user_views;

select * from v_emp_dept;

--계층적 view 생성
create view v_emp_dept2 as
select ename, dname
from v_emp_dept;

select * from v_emp_dept2;

select empno from (select empno, ename from emp order by mgr);
--위와 같이 인라인 뷰의 select 문에서 정의된 칼럼은 메인 쿼리에서 사용 가능
--아래는 안됨
select mgr from (select empno, ename from emp order by mgr);

select e.empno, e.ename, e.sal, d.dname
from (select empno, ename, sal, deptno from emp where sal > 2000) e, dept d
where e.deptno=d.deptno;
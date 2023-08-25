select ename,dname
 from emp, dept
 where emp.deptno=dept.deptno;
-- where 절 없이 실행할 경우 카디시안 곱이 됨 (CROSS JOIN)

select ename,dname,emp.deptno
 from emp, dept
 where emp.deptno=dept.deptno;
-- 중복 칼럼의 경우, 칼럼명 앞에 테이블명을 붙여야 함

select ename,dname,E.deptno
 from emp E, dept D
 where E.deptno=D.deptno;
 -- alias 사용
 
 select p.player_name, p.position, t.region_name, t.team_name, s.stadium_name
 from player p, team t, stadium s
 where p.team_id=t.team_id and t.stadium_id=s.stadium_id;
 
 select e.ename 사원명,e.sal 급여,s.grade 급여등급
 from emp e, salgrade s
 where e.sal >=s.losal and e.sal<=s.hisal;
 
select e.ename 사원명,e.sal 급여,s.grade 급여등급
 from emp e, salgrade s
 where e.sal between s.losal and s.hisal;
 
 --암시적 조인
 select ename,dname,E.deptno
 from emp E, dept D
 where E.deptno=D.deptno and e.sal>2000;
 
 --명시적 조인 (표준)
select ename,dname,E.deptno
 from emp E inner join dept D
 on E.deptno=D.deptno 
 where e.sal>2000;
 
 --natural inner join
 select *
 from emp natural join dept;

--inner join
 select *
 from emp e inner join dept d
 on e.deptno=d.deptno;
 
 select e.empno, e.ename, e.deptno, d.dname
 from emp e join dept d
 on e.deptno=d.deptno
 where e.ename like '%S%';
 
 --right outer join
 select e.ename ,e.deptno, d.dname
 from emp e right join dept d
 on e.deptno=d.deptno;
 
  --full outer join
 select e.ename ,e.deptno, d.dname
 from emp e full join dept d
 on e.deptno=d.deptno;
 
 --union
 select e.ename ,e.deptno, d.dname
 from emp e left join dept d
 on e.deptno=d.deptno;
 union
 select e.ename ,e.deptno, d.dname
 from emp e right join dept d
 on e.deptno=d.deptno;
 
 select e.empno,e.ename,m.empno,m.ename
 from emp e left join emp m
 on e.mgr=m.empno;
 
 --계층형 질의
 select empno, mgr from emp;
 
 select level, empno 사원,mgr 관리자,connect_by_isleaf isleaf
 from emp
 start with mgr is null
 connect by prior empno=mgr;
 
 --집합연산의 order by 절에서는 첫번째 줄의 칼럼명만 사용 가능
 --첫번째 줄에서 alias를 썼을 때는 alias를 사용해야 한다.
 select 'T' 구분코드, player_name, team_id
 from player
 where team_id='K06'
 union all
 select 'P' 구분코드, player_name,position
 from player
 where position='GK'
 order by 구분코드, team_id;
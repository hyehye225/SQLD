select ename,dname
 from emp, dept
 where emp.deptno=dept.deptno;
-- where �� ���� ������ ��� ī��þ� ���� �� (CROSS JOIN)

select ename,dname,emp.deptno
 from emp, dept
 where emp.deptno=dept.deptno;
-- �ߺ� Į���� ���, Į���� �տ� ���̺���� �ٿ��� ��

select ename,dname,E.deptno
 from emp E, dept D
 where E.deptno=D.deptno;
 -- alias ���
 
 select p.player_name, p.position, t.region_name, t.team_name, s.stadium_name
 from player p, team t, stadium s
 where p.team_id=t.team_id and t.stadium_id=s.stadium_id;
 
 select e.ename �����,e.sal �޿�,s.grade �޿����
 from emp e, salgrade s
 where e.sal >=s.losal and e.sal<=s.hisal;
 
select e.ename �����,e.sal �޿�,s.grade �޿����
 from emp e, salgrade s
 where e.sal between s.losal and s.hisal;
 
 --�Ͻ��� ����
 select ename,dname,E.deptno
 from emp E, dept D
 where E.deptno=D.deptno and e.sal>2000;
 
 --����� ���� (ǥ��)
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
 
 --������ ����
 select empno, mgr from emp;
 
 select level, empno ���,mgr ������,connect_by_isleaf isleaf
 from emp
 start with mgr is null
 connect by prior empno=mgr;
 
 --���տ����� order by �������� ù��° ���� Į���� ��� ����
 --ù��° �ٿ��� alias�� ���� ���� alias�� ����ؾ� �Ѵ�.
 select 'T' �����ڵ�, player_name, team_id
 from player
 where team_id='K06'
 union all
 select 'P' �����ڵ�, player_name,position
 from player
 where position='GK'
 order by �����ڵ�, team_id;
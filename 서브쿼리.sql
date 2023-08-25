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

--��Į�� ��������
--�Լ� �ȿ��� ��Į�� ���������� ���� �� �ִ�.
select empno, ename, substr((select dname from dept where deptno=a.deptno),1,3) as dname from emp a;

--�� ����
create view v_emp_dept as
select ename, empno, deptno, dname
from emp join dept
using (deptno);

select * from user_views;

select * from v_emp_dept;

--������ view ����
create view v_emp_dept2 as
select ename, dname
from v_emp_dept;

select * from v_emp_dept2;

select empno from (select empno, ename from emp order by mgr);
--���� ���� �ζ��� ���� select ������ ���ǵ� Į���� ���� �������� ��� ����
--�Ʒ��� �ȵ�
select mgr from (select empno, ename from emp order by mgr);

select e.empno, e.ename, e.sal, d.dname
from (select empno, ename, sal, deptno from emp where sal > 2000) e, dept d
where e.deptno=d.deptno;
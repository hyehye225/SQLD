select * from player;

select count(distinct team_id) from player;

--���� �÷��� �� �� ����. (group by�� �׷��� ������ �Ǵ� �÷��� ok)
--���� ���� �Լ����� �� �� �ִ�.
select position ������,count(*) ��ü���, count(height) Ű�Ǽ�, round(avg(height)) ���Ű
from player group by position;

--where �� ��� -> error, where ���� group by ������ ���� ����Ǳ� ���� -> having ���
select position, round(avg(height),2) ���Ű
from player where avg(height)>=180
group by position;

select position, round(avg(height),2) ���Ű
from player 
group by position
having avg(height) >= 180;

select round(avg(height),2) ���Ű, position
from player
group by position
having max(height) >= 190;

select dname, job, count(*) ������, sum(sal) as �޿���
from emp, dept
where dept.deptno=emp.deptno
group by dname,job
order by dname, job;

--���� ���� ��� (order by�� ������)
select player_name, height, rownum
from player where rownum < 4 order by height;

select player_name, height, orgno, rownum
from (select player_name, height, rownum as orgno from player order by height)
where rownum < 4;

--�ζ��� ���� select ���� ��õ��� ���� Į���� ���� �������� ��� �Ұ�
select player_name, height
from (select player_name, height from player where position='MF')
order by position;

select player_name, height
from (select player_name, position, height from player where position='MF')
order by position;

--rollup
select dname, job, count(*) ������, sum(sal) as �޿���
from emp, dept
where dept.deptno=emp.deptno
group by rollup(dname,job)
order by dname,job;

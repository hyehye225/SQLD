-- rank �Լ�
select job, ename, sal,
rank() over (order by sal desc) as all_rank,
rank() over (partition by job order by sal desc) as job_rank
from emp;

--MAX/MIN
SELECT JOB, ENAME,SAL,
	MAX(SAL) OVER (PARTITION BY JOB) JOB_MAX
    FROM EMP
    ORDER BY JOB,ENAME;
    
    SELECT JOB, ENAME,SAL,
	MAX(SAL) OVER () JOB_MAX
    FROM EMP
    ORDER BY JOB,ENAME;
    
--�� ���� ������, ���κ��� ���� �޿��� �޴� ������ �޿� ���� (���� ����)
SELECT JOB, ENAME, SAL,
SUM(SAL) OVER (PARTITION BY JOB ORDER BY SAL DESC RANGE UNBOUNDED PRECEDING)
AS JOB_SUM
FROM EMP;

--�� ���� ������, ���� �ٷ� �� + ���� + ���� �ٷ� �Ʒ��� �޿� �� ���
SELECT JOB, ENAME, SAL,
SUM(SAL) OVER (PARTITION BY JOB ORDER BY SAL ASC ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
AS JOB_SUM
FROM EMP;

--���κ��� �޿��� 100 ���� �������� 200 ���� ���������� �� ���� ��
select ename, sal, count(*) over (order by sal 
range between 100 preceding and 200 following) as mov_count
from emp;

--job="salesman"�� ��� ������ ���ؼ�, �޿� ���� ���� �ٷ� �� ����� �޿��� �Ʒ� ����� �޿��� ����ϴ� ����
select ename,sal,
lag(sal,1) over (order by sal desc) as higher_sal,
lead(sal,1) over (order by sal desc) as lower_sal
from emp
where job='SALESMAN';

--�޿� ���� ���κ��� 2ĭ �� ������ �޿��� ����Ͻÿ�.
select ename, sal,
lag(sal,2,0) over (order by sal desc) as higher_sal
from emp;

--���� job ������, ������ �޿��� ���� �� %�� �ִ��� ���
select deptno, ename, sal,
100*(percent_rank() over (partition by deptno order by sal desc)) || '%' as p_r
from emp;
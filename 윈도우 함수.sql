-- rank 함수
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
    
--각 직업 내에서, 본인보다 높은 급여를 받는 직원의 급여 총합 (본인 포함)
SELECT JOB, ENAME, SAL,
SUM(SAL) OVER (PARTITION BY JOB ORDER BY SAL DESC RANGE UNBOUNDED PRECEDING)
AS JOB_SUM
FROM EMP;

--각 직업 내에서, 본인 바로 위 + 본인 + 본인 바로 아래의 급여 합 출력
SELECT JOB, ENAME, SAL,
SUM(SAL) OVER (PARTITION BY JOB ORDER BY SAL ASC ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
AS JOB_SUM
FROM EMP;

--본인보다 급여가 100 적은 직원부터 200 많은 직원까지의 총 직원 수
select ename, sal, count(*) over (order by sal 
range between 100 preceding and 200 following) as mov_count
from emp;

--job="salesman"인 모든 직원에 대해서, 급여 기준 본인 바로 윗 사람의 급여와 아랫 사람의 급여를 출력하는 질의
select ename,sal,
lag(sal,1) over (order by sal desc) as higher_sal,
lead(sal,1) over (order by sal desc) as lower_sal
from emp
where job='SALESMAN';

--급여 기준 본인보다 2칸 위 직원의 급여를 출력하시오.
select ename, sal,
lag(sal,2,0) over (order by sal desc) as higher_sal
from emp;

--동일 job 내에서, 본인의 급여가 상위 몇 %에 있는지 출력
select deptno, ename, sal,
100*(percent_rank() over (partition by deptno order by sal desc)) || '%' as p_r
from emp;
-- rank ÇÔ¼ö
select job, ename, sal,
rank() over (order by sal desc) as all_rank,
rank() over (partition by job order by sal desc) as job_rank
from emp;
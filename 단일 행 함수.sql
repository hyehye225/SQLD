--**������ �Լ�
select player_name, length(player_name) as ���� from player;

--�ҹ��ڷ� �ٲپ��ִ� �Լ�
select lower('SQL Expert') as result from dual;

--�ƽ�Ű ��ȯ > 65
select ascii('A') from dual;

--�ƽ�Ű ��ȯ > A
select chr(65) from dual;

select concat('RDBMS','SQL') from dual;
select 'RDBMS' || 'SQL' from dual;

--Expert (idx�� 1����)
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




--**��ȯ�� �Լ�

--�Ͻ��� ��ȯ
select player_id, mod(player_id,4) from player;
--����� ��ȯ
select player_id, mod(to_number(player_id),4) from player;

--�Ͻ��� ����ȯ
select '1'+'1' from dual;
select to_number('1')+to_number('1') from dual;

select to_char(20) from dual;
select sysdate from dual;
--�Ͻ��� ����ȯ
select sysdate +2 from dual;

--��¥�� ���ڿ��� ��ȯ
select to_char(sysdate) from dual;
select to_char(sysdate,'YYYY-MM-DD') from dual;

select extract(year from sysdate) from dual;
select extract(year from to_date('2020/01/01')) from dual;

select extract(month from birth_date) from player;

select player_name, birth_date, trunc(sysdate,'DD')-trunc(birth_date,'DD') from player;


--**Case ��
select player_name, height,
case when height >180
then height
else 180
end as new_height
from player;

--searched case expression
select player_name,
case when position ='GK' then '��Ű��'
else '�� ��'
end as ������
from player;

--simple case expression
select player_name, case position
when 'GK' then '��Ű��2'
else '�� ��2'
end as ������2
from player;

--DECODE
select player_name, DECODE(position,
'GK','��Ű��3',
'DF','�����',
'�� ��3') as position
from player;

select player_name, position from player
where position is null;

--coalesce
select e_player_name, nickname, player_name,
coalesce(e_player_name, nickname, player_name)
from player;

select player_name, position,
case when position is null then '����'
else position
end as ������
from player;

select * from emp;

--nvl �� �ʿ��� ����
select ename, sal, comm, (sal*12) +nvl(comm,0) as ���� from emp where empno=7369;

--nullif (�Ʒ��� �ΰ��� ��� ��� �˱�)
select player_name,position,
case when position='GK' then null
else position
end as ������
from player;

select player_name, position,
nullif(position,'GK') as ������
from player;
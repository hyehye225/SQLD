drop table emp;

--create �� �ȿ� �������� �����ϴ� ���1
create table emp
(emp_no varchar2(10) primary key,
emp_num varchar2(300) not null);

--create �� �ȿ� �������� �����ϴ� ���2
create table product2
(PRO_ID varchar2(10) not null constraint PRODUC_PK primary key);


--create �� �ȿ� �������� �����ϴ� ���3
create table product
(PROD_ID varchar2(10) not null,
PROD_NM varchar2(100) not null,
constraint PRODUCT_PK primary key(PROD_ID));


--create �� �ۿ� (alter table) �������� �����ϴ� ���
drop table product2;

create table product2
(PRO_ID varchar2(10) not null);

alter table product2
add
constraint
PRODUC_PK2 primary key (PRO_ID);

select * from all_constraints
where table_name in ('EMP','PRODUCT','PRODUCT2')
order by constraint_name;


--���� ���̺��� Ȱ���� ���̺� ����
drop table player_temp cascade constraint;

create table player_temp as select * from player;

select * from player_temp;
select * from player;

--���̺� ����
desc player_temp;
alter table player_temp modify (player_name not null);

--������� ����
select * from all_constraints where table_name='PLAYER_TEMP';

alter table player_temp 
add constraint player_temp_pk primary key(player_id);

alter table player_temp
drop constraint player_temp_pk;

--���̺� �̸� ����
rename player_temp to old_player;
desc player_temp;

--���̺� ����
select * from all_constraints where table_name='PLAYER';
drop table team;
drop table team cascade constraint;

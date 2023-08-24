drop table emp;

--create 문 안에 제약조건 생성하는 방법1
create table emp
(emp_no varchar2(10) primary key,
emp_num varchar2(300) not null);

--create 문 안에 제약조건 생성하는 방법2
create table product2
(PRO_ID varchar2(10) not null constraint PRODUC_PK primary key);


--create 문 안에 제약조건 생성하는 방법3
create table product
(PROD_ID varchar2(10) not null,
PROD_NM varchar2(100) not null,
constraint PRODUCT_PK primary key(PROD_ID));


--create 문 밖에 (alter table) 제약조건 생성하는 방법
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


--기존 테이블을 활용한 테이블 생성
drop table player_temp cascade constraint;

create table player_temp as select * from player;

select * from player_temp;
select * from player;

--테이블 변경
desc player_temp;
alter table player_temp modify (player_name not null);

--제약사항 변경
select * from all_constraints where table_name='PLAYER_TEMP';

alter table player_temp 
add constraint player_temp_pk primary key(player_id);

alter table player_temp
drop constraint player_temp_pk;

--테이블 이름 변경
rename player_temp to old_player;
desc player_temp;

--테이블 삭제
select * from all_constraints where table_name='PLAYER';
drop table team;
drop table team cascade constraint;

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

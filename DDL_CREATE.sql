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

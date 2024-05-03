create table company (
	num number primary key,
	id varchar2(12) unique not null,
	name varchar2(30) not null,
	pw varchar2(12) not null,
	reg_date date default sysdate not null
);

create sequence company_seq;
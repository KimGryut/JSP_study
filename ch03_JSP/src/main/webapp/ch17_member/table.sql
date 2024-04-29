create table smember(
	num number not null,
	id varchar2(12) not null,
	name varchar2(30) not null,
	passwd varchar2(12) not null,
	email varchar2(50) not null,
	phone varchr2(15),
	reg_date date default sysdate not null,
	constraint smember_pk primary key (num) /*오라클에서 사용*/
);

create sequence smember_seq;
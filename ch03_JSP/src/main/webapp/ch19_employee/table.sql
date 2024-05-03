-- 사원 정보
create table semployee(
	num number primary key,
	id varchar2(12) unique not null,
	name varchar2(30) not null,
	passwd varchar2(12) not null,
	salary number(8) not null,
	job varchar2(30) not null,
	reg_date date default sysdate not null
);

create sequence semployee_seq;

-- 사원 게시판
create table story(
    snum number not null, -- 스토리의 프라이머리 키 
    title varchar2(150) not null,
    content clob not null,
    ip varchar2(30) not null,
    num number not null, -- 작성자 / 사원 번호와 동일
    reg_date date default SYSDATE not null, -- 데이터 형식을 DATE로 지정
    constraint story_pk primary key (snum),
    constraint story_fk foreign key (num) references semployee(num)
);

create sequence story_seq;
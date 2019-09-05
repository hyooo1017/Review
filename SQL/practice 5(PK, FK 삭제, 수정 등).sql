-- Table & Constraints
/*
drop database if exists shopdb;
drop database if exists modeldb;
drop database if exists sqldb;
drop database if exists tabledb;
*/

drop database tabledb;
create database tabledb;

USE tabledb;
drop table if exists buytbl, usertbl;

create table usertbl(	-- 회원 테이블
	-- 컬럼명 데이터타입(반복)
	userid char(8),		-- 사용자 아이디
	name nvarchar(10),	-- 이름
	birthyear int,		-- 출생년도
	addr nchar(2),		-- 지역(경기,서울,경남 등으로 글자만 입력) // unicode(전세계 문자 표현 표준), utf-8
	mobile1 char(3),	-- 휴대폰의국번(011, 016, 017, 018, 019, 010 등) // ascii : 영문 문자 인코딩 방식
	mobile2 char(8),	-- 휴대폰의 나머지 전화번호(하이픈 제외)
	height smallint,	-- 키
	mdate date			-- 회원 가입일
);

create table buytbl(	-- 구매 테이블
	num int,			-- 순번(PK)
    userid char(8),		-- 아이디(FK)
	prodname nchar(6),	-- 물품명
	groupname nchar(4),	-- 분류
	price int,			-- 단가
	amount smallint		-- 수량
);

drop table if exists buytbl, usertbl;

create table usertbl(
	userid char(8) not null,
	name varchar(10) not null,
	birthyear int not null,
	addr char(2) not null,
	mobile1 char(3) null,
	mobile2 char(8) null,
	height smallint null,
	mdate date null
);

create table buytbl(
	num int not null,
    userid char(8) not null,
	prodname nchar(6) not null,
	groupname nchar(4) null,
	price int not null,
	amount smallint not null
);

-- 제약조건(constraints)
/*
primary key - unique, not null
foreign key
unique
default
null, not null
*/

drop table if exists buytbl, usertbl;

create table usertbl(
	userid char(8) not null primary key,
	name varchar(10) not null,
	birthyear int not null,
	addr char(2) not null,
	mobile1 char(3) null,
	mobile2 char(8) null,
	height smallint null,
	mdate date null
);

create table buytbl(
	num int not null primary key,		 -- 회원 아이디, 대부분 테이블에 설정, 하나 이상의 열에 가능
    userid char(8) not null,
	prodname nchar(6) not null,
	groupname nchar(4) null,
	price int not null,
	amount smallint not null
);

drop table if exists buytbl;

create table buytbl(
	num int auto_increment null primary key,		 -- auto_increment : primary key거나 unique key일 때만 사용 가능
    userid char(8) not null,
	prodname nchar(6) not null,
	groupname nchar(4) null,
	price int not null,
	amount smallint not null
);

drop table if exists buytbl;

create table buytbl(
	num int auto_increment null primary key,
    userid char(8) not null,
	prodname nchar(6) not null,
	groupname nchar(4) null,
	price int not null,
	amount smallint not null,
    foreign key(userid) references usertbl(userid)		-- foreign key
    -- usertbl 테이블(기준테이블)의 userid 컬럼을 참조(연결)하는 외래키
);

insert into usertbl values('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8'); 
insert into usertbl values('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4'); 
insert into usertbl values('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7'); 
 
select * from usertbl; 

insert into buytbl values(null, 'JYP', '모니터', '전자', 200, 1);		-- usertbl의 userid에 'JYP'가 없으므로 error
insert into buytbl values(null, 'KBS', '노트북', '전자', 1000, 1);
insert into buytbl values(null, 'KBS', '운동화', null, 30, 2);
-- 첫 번째 문장만 에러문이고 나머지는 오류 없는데 모든 코드 실행 안됨

select * from buytbl;

insert ignore into buytbl values(null, 'JYP', '모니터', '전자', 200, 1);
insert ignore into buytbl values(null, 'KBS', '노트북', '전자', 1000, 1);
insert ignore into buytbl values(null, 'KBS', '운동화', null, 30, 2);
-- ignore을 사용하면 에러문만 제외하고 모두 실행됨

select * from buytbl;


##################################################################################################


-- Primary Key를 지정하는 3가지 방법 
 
drop table usertbl;		-- error(참조받고 있는 기준테이블이므로 usertbl 삭제 불가)
alter table buytbl drop foreign key buytbl_ibfk_1; -- 참조 중인 외래키 삭제
drop table usertbl; 	-- 참조받는 테이블이 없으므로 삭제 가능


-- 1. 테이블 생성할 때 컬럼 옆에서 기본키 지정
create table usertbl(
	userid char(8) not null primary key,
	name varchar(10) not null,
	birthyear int not null,
	addr char(2) not null,
	mobile1 char(3) null,
	mobile2 char(8) null,
	height smallint null,
	mdate date null
);
 
describe usertbl;

drop table if exists usertbl;

-- 2. 테이블 생성할 때 가장 아래에 constraint를 사용하여 기본키 지정
create table usertbl(
	userid char(8) not null,
	name varchar(10) not null,
	birthyear int not null,
	addr char(2) not null,
	mobile1 char(3) null,
	mobile2 char(8) null,
	height smallint null,
	mdate date null,
    constraint primary key pk_usertbl_userid (userid)
);
 
describe usertbl;

drop table if exists usertbl;

-- 3. 테이블 생성 후 alter를 사용하여 기본키 지정
create table usertbl(
	userid char(8) not null,
	name varchar(10) not null,
	birthyear int not null,
	addr char(2) not null,
	mobile1 char(3) null,
	mobile2 char(8) null,
	height smallint null,
	mdate date null
);
alter table usertbl
	add constraint pk_usertbl_userid
    primary key (userid);

describe usertbl;

drop table if exists usertbl;


/*
2개의 컬럼을 묶어서 primary key 지정 
	-> 1개의 컬럼만으로는 unique한 값이 없을 떄 unique한 조합을 찾아 primary key로 지정
*/
-- 1. alter로 기본키 지정
create table prodtbl(
    prodcode char(3) not null,
    prodid char(4) not null,
    proddate datetime not null,
    prodcur char(10) null
);
alter table prodtbl
	add constraint pk_prodtbl_prodcode_prodid  
    primary key (prodcode, prodid);
    
describe prodtbl;

drop table if exists prodtbl;
 
-- 2. 테이블 내 constraint로 기본키 지정
create table prodtbl(
    prodcode char(3) not null,
    prodid char(4) not null,
    proddate datetime not null,
    prodcur char(10) null,
	constraint pk_prodtbl_prodcode_prodid
		primary key (prodcode, prodid)
);

describe prodtbl;

drop table if exists prodtbl;

-- 3. 테이블 내에서 기본키 지정
create table prodtbl(
    prodcode char(3) not null,
    prodid char(4) not null,
    proddate datetime not null,
    prodcur char(10) null,
	primary key (prodcode, prodid)
);

describe prodtbl;


/*
- Primary Key 기본키
- Foreign Key 외래키
- 두 테이블의 관계 선언, 데이터의 무결성을 보장
- 기준키 테이블, 외래키 테이블
- 외래키 테이블에 데이터를 입력 할 때 기준키 테이블에 데이터가 존재해야 한다 
- 기준키 테이블의 참조 열은 반드시 unique거나 primary key이어야 한다
*/

drop table if exists buytbl, usertbl;

create table usertbl(
	userid char(8) not null primary key,		-- 기준테이블의 primary key 지정
	name varchar(10) not null,
	birthyear int not null,
	addr char(2) not null,
	mobile1 char(3) null,
	mobile2 char(8) null,
	height smallint null,
	mdate date null
);

-- 1. 테이블 내에서 외래키 지정
create table buytbl(
	num int auto_increment null primary key,
    userid char(8) not null,
    foreign key(userid) references usertbl(userid),		-- 기준테이블 usertbl의 userid를 참조하는 외래키 지정
	prodname nchar(6) not null,
	groupname nchar(4) null,
	price int not null,
	amount smallint not null
);

describe buytbl;

drop table if exists buytbl;

-- 2. 테이블 내에서 constraint를 사용하여 외래키 지정
create table buytbl(
	num int auto_increment null primary key,
    userid char(8) not null,
	prodname nchar(6) not null,
	groupname nchar(4) null,
	price int not null,
	amount smallint not null,
    constraint fk_usertbl_buytbl foreign key(userid) references usertbl(userid)
);

describe buytbl;

drop table if exists buytbl;

-- 3. alter를 사용하여 외래키 지정
create table buytbl(
	num int auto_increment null primary key,
    userid char(8) not null,
	prodname nchar(6) not null,
	groupname nchar(4) null,
	price int not null,
	amount smallint not null
);
alter table buytbl
	add constraint fk_usertbl_buytbl
    foreign key(userid)
    references usertbl(userid);

-- key 정보를 보기 위해 사용
show index from buytbl;
show index from usertbl;

-- on delete cascade, on update cascade : 기준테이블의 데이터가 변경될 때마다 외래키 테이블에도 자동 반영 
alter table buytbl
	drop foreign key fk_usertbl_buytbl; -- 외래 키 제거 

alter table buytbl
	add constraint fk_usertbl_buytbl
    foreign key(userid)
    references usertbl(userid)
    on update cascade;			-- 기준테이블의 primary key가 수정될 때마다 foreign key값도 수정됨


drop table if exists buytbl, usertbl;


-- unique값을 지정하는 방법
-- 1. 테이블 생성할 때 컬럼 옆에서 지정
create table usertbl(
	userid char(8) not null primary key,
	name varchar(10) not null,
	birthyear int not null,
	addr char(2) not null,
	mobile1 char(3) null,
	mobile2 char(8) null,
	height smallint null,
	mdate date null,
    email char(30) null unique
);

describe usertbl;

drop table if exists usertbl;

-- 2. constraint 사용
create table usertbl(
	userid char(8) not null primary key,
	name varchar(10) not null,
	birthyear int not null,
	addr char(2) not null,
	mobile1 char(3) null,
	mobile2 char(8) null,
	height smallint null,
	mdate date null,
    email char(30) null,
    constraint uk_email unique (email)
);

describe usertbl;

drop table if exists usertbl;

-- 3. alter 사용
create table usertbl(
	userid char(8) not null primary key,
	name varchar(10) not null,
	birthyear int not null,
	addr char(2) not null,
	mobile1 char(3) null,
	mobile2 char(8) null,
	height smallint null,
	mdate date null,
    email char(30) null
);
alter table usertbl
	add constraint uk_usertbl_email
    unique key (email);


-- defualt값 지정

create database if not exists testdb; 
use testdb; 
drop table if exists usertbl;

-- 1. 테이블 생성할 때 컬럼 열에서 설정
create table usertbl(
	userid char(8) not null primary key,
	name varchar(10) not null,
	birthyear int not null default -1,
	addr char(2) not null default '서울',
	mobile1 char(3) null,
	mobile2 char(8) null,
	height smallint null default 170,
	mdate date null
);

drop table if exists usertbl;

-- 2. 테이블 생성 후 alter 사용하여 default값 설정
create table usertbl(
	userid char(8) not null primary key,
	name varchar(10) not null,
	birthyear int not null,
	addr char(2) not null,
	mobile1 char(3) null,
	mobile2 char(8) null,
	height smallint null,
	mdate date null
);
alter table usertbl
	alter column birthyear set default -1;

alter table usertbl
	alter column addr set default '서울';

alter table usertbl
	alter column height set default 170;

-- default값이 있는 컬럼은 자동으로 default값이 입력한다 -> null값 없음
insert into usertbl values('LHL', '이혜리', default, default, '011', '1234567', default, '2019.12.12');

-- 열이름이 명시되지 않으면 default로 설정된 값을 자동 입력한다 -> default값과 입력한 값을 제외하고 모두 null값
insert into usertbl (userID, name) values('KAY', '김아영');

-- 값이 직접 표기되면 default로 설정된 값은 무시된다 -> 정상적으로 값이 다 들어감
insert into usertbl values('WB', '원빈', 1982, '대전', '019', '9876543', 176, '2017.5.5');

select * from usertbl;


##########################################################################################################


-- 데이터 압축

-- 시스템변수 확인 
show variables like 'innodb_file_format';			-- baraccuda
show variables like 'innodb_large_prefix';			-- on

create database if not exists compressdb; 
use compressdb;
create table normaltbl(emp_no int, first_name varchar(14)); 
create table compresstbl(emp_no int, first_name varchar(14)) 
	row_format= compressed;							-- 압축해서 저장

-- 외부테이블에서 값 가져오기
insert into normaltbl select emp_no, first_name from employees.employees;    
insert into compresstbl select emp_no, first_name from employees.employees; 

show table status from compressdb;
-- compresstbl이 normaltbl에 비해 데이터 길이는 작지만 시간은 더 오래걸림

drop database if exists compressdb;

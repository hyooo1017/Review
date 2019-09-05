create database webdb;
use webdb;
show databases;

create table pet(
name varchar(20),
owner varchar(20),
species varchar(20),
sex char(1),
birth date,
death date);

show tables;
-- drop table pet;

insert into pet values('Fluffy', 'Harold', 'cat', 'f', '1999-02-04', null);

select * from pet;

load data local infile 'C:/Temp/pet_table.txt' into table pet;

select * from pet;
/*
set sql_safe_updates = 0;					-- Safe Update 모드 상태 해제
*/
update pet set death = null where death = '0000-00-00';
select * from pet;

select * from pet where name = 'Bowser';
select * from pet where birth >= '1998-01-01';
select * from pet where species = 'dog' and sex = 'f';
select * from pet where species = 'snake' or species = 'bird';
select name, birth from pet;
select name, birth from pet order by birth;		 -- 오름차순으로 정렬
select name, birth from pet order by birth desc; -- 내림차순으로 정렬
select name from pet where death is not null;	 -- 죽은 애완동물을 알고 싶을 때
select name from pet where death is null;	 	 -- 살아있는 애완동물을 알고 싶을 때

select * from pet where name like 'b%';
select * from pet where name like '%fy';
select * from pet where name like '%w%';		 -- w 앞뒤로 글자가 0이상만 나오면 찾아짐
select * from pet where name like '_____';		 -- '_'를 5번 쓰면 5글자의 이름을 갖고 있는 데이터가 찾아짐
select * from pet where name regexp '^b';
select * from pet where name regexp 'fy$';
select count(*) from pet;						 -- 전체 데이터의 갯수

select * from pet;
update pet set species = 'dog' where name = 'claws';
select * from pet;
update pet set species = 'pig' where birth < '1990-01-01';
select * from pet;

use sqldb;
show tables;
select * from buytbl;
select * from usertbl;

select * from usertbl where name = '김경호';
-- 1970년 이후 출생, 키 182 이상인 사람
select * from usertbl where birthyear >= 1970 and height >= 182;
-- 키 180 이상 182 이하
select * from usertbl where height >= 180 and height <= 182;
select * from usertbl where height between 180 and 182;
-- 주소가 경남, 전남, 경북인 사람들
select * from usertbl where addr = '경남' or addr = '전남' or addr = '경북';
select name, addr from usertbl where addr in ('경남', '전남', '경북');
-- 성이 김씨인 사람의 키 뽑기
select name, height from usertbl where name like '김%';
-- 성이 한 글자이고 이름이 종신인 사람의 키
select name, height from usertbl where name like '_종신';
-- 키가 170이상인 사람
select name, height from usertbl where height >= 177;
-- 김경호보다 키가 큰 사람들
select name, height from usertbl where height > (select height from usertbl where name = '김경호');
# 쿼리 안에 쿼리문은 서브쿼리문!!

-- 주소가 경남인 사람의 키보다 큰 사람들의 이름, 키
select name, height from usertbl where height > (select max(height) from usertbl where addr = '경남');
select name, height from usertbl where height > all(select height from usertbl where addr = '경남');
/*
경남 사람들 중 아무나 한 사람보다만 크면 다 찾는 코드
select name, height from usertbl where height > any(select height from usertbl where addr = '경남');
*/
-- 경남에 거주한 사람의 키와 동일한 사람들의 이름과 키
select name, height from usertbl where height = any(select height from usertbl where addr = '경남');
-- 이름과 가입날짜를 가입날짜 기준 오름차순으로 정렬
select name, mdate from usertbl order by mdate;
-- 이름과 가입날짜를 가입날짜 기준 내림차순으로 정렬
select name, mdate from usertbl order by mdate desc;
-- 이름은 오름차순으로 키는 내림차순으로 정렬
select name, height from usertbl order by name , height desc;
-- 주소가 중복되지 않게
select distinct addr from usertbl;

-- employee db에서 employee table의 emp_no, hire_date를 hire_date를 기준으로 오름차순 출력
use employees;
show tables;
select emp_no, hire_date from employees order by hire_date;
-- 입사시기가 가장 오래된 사람들 5명의 emp_no와 hire_date
select emp_no, hire_date from employees order by hire_date limit 5;
-- 입사시기가 가장 오래된 사람들 중 11번째에서 20번째까지의 emp_no와 hire_date
select emp_no, hire_date from employees order by hire_date limit 10,10;

use sqldb;
create table buytbl2(select * from buytbl);
select * from buytbl2;
create table buytbl3(select userid, prodname from buytbl);
select * from buytbl3;

-- group by
select userid, sum(amount) from buytbl group by userid;

-- 컬럼명을 아이디, 총구매갯수 출력
select userid 아이디, sum(amount) 총구매갯수 from buytbl group by userid;
-- 컬럼명을 아이디, 평균구매갯수 출력
select userid 아이디, avg(amount) 평균구매갯수 from buytbl group by userid;
-- 컬럼명을 아이디, 총구매금액 출력
select userid 아이디, sum(amount*price) 총구매금액 from buytbl group by userid;
-- 총구매금액 오름차순 출력
select userid 아이디, sum(amount*price) 총구매금액 from buytbl group by userid order by 총구매금액;
-- 최대, 최소키
select max(height), min(height) from usertbl;
-- 가장 키큰 사람의 이름과 키, 가장 작은 사람의 이름과 키
select name, height from usertbl where height = (select max(height) from usertbl) or height = (select min(height) from usertbl);
select name, height from usertbl where height in ((select max(height) from usertbl), (select min(height) from usertbl));

select * from usertbl;
-- 휴대전화를 갖고 있는 사람들의 수
select count(*) as 전화번호등록자수 from usertbl where mobile1 is not null;
select count(mobile1) as 전화번호등록자수 from usertbl;

-- 아이디별 총 구매금액
select userid, sum(amount*price) from buytbl group by userid;
-- 아이디별 총 구매금액이 1000이상인 데이터
###### group by할 때에는 having으로 조건달기 (where 안됨)
select userid, sum(amount*price) as 총구매금액 from buytbl group by userid having 총구매금액 > 1000;
-- 아이디별 총 구매금액이 1000이상인 데이터 오름차순으로 정렬
select userid, sum(amount*price) as 총구매금액 from buytbl group by userid having 총구매금액 > 1000 order by 총구매금액;


-- sqldb.testtbl1 : id(int), username(char(3), age(int)
use sqldb;
create table testtbl1(id int, username char(3), age int);
insert into testtbl1 values (1, '홍길동', 25);		# values만 적고 값을 넣을 때는 컬럼 순서대로 작성해주어야함
insert into testtbl1(id, username) values (2, '설현'); # null이라고 적지 않는 데이터는 정확한 컬럼명을 작성해주어야함
insert into testtbl1(username, age, id) values('초아', 26, 3);
select * from testtbl1;

create table testtbl2(id int auto_increment primary key, username char(3), age int);
insert into testtbl2 values (null, '지민', 25);
insert into testtbl2 values (null, '유나', 22);
insert into testtbl2 values (null, '유경', 21);
select * from testtbl2;

create table testtbl5(select emp_no, first_name, last_name from employees.employees);
create table testtbl4(id int, fname varchar(50), lname varchar(50));
insert into testtbl4 select emp_no, first_name, last_name from employees.employees;

-- 데이터 수정
select * from testtbl4 where fname = 'Parto';
update testtbl4 set lname = '없음' where fname = 'Parto';

-- buytbl의 가격을 1.5배로 바꾸기
use sqldb;
select * from buytbl;
update buytbl set price = price*1.5;
select * from buytbl;

-- first name이 'Aamer'인 사람 데이터 삭제
select * from testtbl4 where fname = 'Aamer';
delete from testtbl4 where fname = 'Aamer';
select * from testtbl4 where fname = 'Aamer';
-- first name이 'Parto'인 사람 100명만 데이터 삭제
select * from testtbl4 where fname = 'Parto';
select count(*) from testtbl4 where fname = 'Parto';
delete from testtbl4 where fname = 'Parto' limit 100;
select count(*) from testtbl4 where fname = 'Parto';

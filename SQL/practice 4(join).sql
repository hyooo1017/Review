-- 구매자 주소 확인
use sqldb;
select * from buytbl;
select * from usertbl;
select * from buytbl inner join usertbl
	on buytbl.userid = usertbl.userid where buytbl.userid = 'JYP';
-- buytbl을 통해 JYP의 id를 가진 사람의 주소를 usertbl에서 가져옴(inner join 사용 -> 교집합)

-- 필요한 열만 추출할 때
/*
<error(userid의 필드가 모호함)>
select userid, name, prodname, addr, mobile1 + mobile2 as '연락처'
	from buytbl inner join usertbl on buytbl.userid = usertbl.userid;
*/
-- buytbl의 userid로 사용
select buytbl.userid, name, prodname, addr, mobile1 + mobile2 as '연락처'
	from buytbl inner join usertbl on buytbl.userid = usertbl.userid;
-- usertbl의 userid로 사용
select usertbl.userid, name, prodname, addr, mobile1 + mobile2 as '연락처'
	from buytbl inner join usertbl on buytbl.userid = usertbl.userid;

-- where문 활용
select buytbl.userid, name, prodname, addr, mobile1 + mobile2
	from buytbl, usertbl where buytbl.userid = usertbl.userid;

 -- 모두 테이블명 붙임
select buytbl.userid, usertbl.name, buytbl.prodname, usertbl.addr, usertbl.mobile1 + usertbl.mobile2 as '연락처'
	from buytbl inner join usertbl on buytbl.userid = usertbl.userid;

-- 별칭 사용
select B.userid, U.name, B.prodname, U.addr, U.mobile1 + U.mobile2 as '연락처'
	from buytbl B inner join usertbl U on B.userid = U.userid;

-- buytbl 기준
select B.userid, U.name, B.prodname, U.addr, U.mobile1 + U.mobile2 as '연락처'
	from buytbl B inner join usertbl U on B.userid = U.userid where B.userid = 'JYP';

-- usertbl 기준
select U.userid, U.name, B.prodname, U.addr, U.mobile1 + U.mobile2 as '연락처'
	from usertbl U inner join buytbl B on U.userid = B.userid where B.userid = 'JYP';

-- inner join한 결과를 userid기준으로 오름차순 정렬
select U.userid, U.name, B.prodname, U.addr, U.mobile1 + U.mobile2 as '연락처'
	from usertbl U inner join buytbl B on U.userid = B.userid order by U.userid;

-- userid의 중복값을 하나만 출력하고 이름과 주소 출력
select distinct U.userid, U.name, U.addr from usertbl U 
	inner join buytbl B on U.userid = B.userid order by U.userid;


############################################################################################3


USE sqldb;

create table stdtbl(
	stdname varchar(10) not null primary key,
	addr char(4) not null
);
create table clubtbl(
	clubname varchar(10) not null primary key,
	roomno char(4) not null
);
create table stdclubtbl(
	num int auto_increment not null primary key,
	stdname varchar(10) not null,
	clubname varchar(10) not null,
	foreign key(stdname) references stdtbl(stdname),
	foreign key(clubname) references clubtbl(clubname)
);

insert into stdtbl values ('김범수', '경남'), ('성시경', '서울'), ('조용필', '경기'), ('은지원', '경북'), ('바비킴', '서울');
insert into clubtbl values ('수영', '101호'), ('바둑', '102호'), ('축구', '103호'), ('봉사', '104호');
insert into stdclubtbl values (null, '김범수', '바둑'), (null, '김범수', '축구'), (null, '조용필', '축구'),
	(null, '은지원', '축구'), (null, '은지원', '봉사'), (null, '바비킴', '봉사');

select * from stdtbl;
select * from clubtbl;
select * from stdclubtbl;

-- inner join한 결과를 stdname을 기준으로 오름차순 정렬
select S.stdname, S.addr, C.clubname, C.roomno from stdtbl S
	inner join stdclubtbl SC on S.stdname = SC.stdname
	inner join clubtbl C on SC.clubname = C.clubname order by S.stdname;

-- inner join한 결과를 clubname을 기준으로 오름차순 정렬
select C.clubname, C.roomno, S.stdname, S.addr from stdtbl S
	inner join stdclubtbl SC on SC.stdname = S.stdname
	inner join clubtbl C on SC.clubname = C.clubname order by C.clubname;

-- usertbl을 기준으로 left (outer) join한 결과를 userid를 기준으로 오름차순 정렬
select U.userid, U.name, B.prodname, U.addr, concat(U.mobile1, U.mobile2) as '연락처'
	from usertbl U left outer join buytbl B on U.userid = B.userid order by U.userid;

-- buytblbl을 기준으로 right (outer) join한 결과를 userid를 기준으로 오름차순 정렬
select U.userid, U.name, B.prodname, U.addr, concat(U.mobile1, U.mobile2) as '연락처'
	from buytbl B right outer join usertbl U on U.userid = B.userid order by U.userid;
-- usertbl을 기준으로 left (outer) join == buytblbl을 기준으로 right (outer) join -> 이름만 다른 같은 연산

-- usertbl을 기준으로 left (outer) join한 결과 중 prodname이 nill인 것만 userid를 기준으로 오름차순 정렬
select U.userid, U.name, B.prodname, U.addr, concat(U.mobile1, U.mobile2) as '연락처' from usertbl U
	left outer join buytbl B on U.userid = B.userid where B.prodname is null order by U.userid;

-- stdtbl을 기준으로 left (outer) join한 결과를 stdname을 기준으로 오름차순 정렬
select S.stdname, S.addr, C.clubname, C.roomno from stdtbl S
	left outer join stdclubtbl SC on S.stdname = SC.stdname
	left outer join clubtbl C on SC.clubname = C.clubname order by S.stdname;

-- stdtbl을 기준으로 stdclubtbl과는 left (outer) join, clubtbl과는 right (outer) join한 결과를 clubname을 기준으로 오름차순 정렬
select C.clubname, C.roomno, S.stdname, S.addr from stdtbl S
	left outer join stdclubtbl SC on SC.stdname = S.stdname
	right outer join clubtbl C on SC.clubname = C.clubname order by C.clubname;

-- stdtbl을 기준으로 left (outer) join한 결과와 stdtbl을 기준으로 stdclubtbl과는 left (outer) join, clubtbl과는 right (outer) join한 결과를 중복없이 합친다(union)
select S.stdname, S.addr, C.clubname, C.roomno from stdtbl S
	left outer join stdclubtbl SC on S.stdname = SC.stdname
    left outer join clubtbl C on SC.clubname = C.clubname
union
	select S.stdname, S.addr, C.clubname, C.roomno from stdtbl S
	left outer join stdclubtbl SC on SC.stdname = S.stdname
	right outer join clubtbl C on SC.clubname = C.clubname;

-- union all : 중복된 열 포함 / union - 중복된 열 제거
select stdname, addr from stdtbl
union all
	select clubname, roomno from clubtbl;

-- 전화 없는 사람은 제외하고 조회
select name, concat(mobile1, mobile2) as '전화번호' from usertbl
	where name not in (select name from usertbl where mobile1 is null);

-- 전화 없는 사람만 조회
select name, concat(mobile1, mobile2) as '전화번호' from usertbl
	where name in (select name from usertbl where mobile1 is null);

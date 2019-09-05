-- cast : type 변환
select cast('2020-10-19 12:35:29.123' as date) as 'date';
select cast('2020-10-19 12:35:29.123' as time) as 'time';
select cast('2020-10-19 12:35:29.123' as datetime) as 'datetime';

use sqldb;
set @myvar1 = 5;		-- 변수 지정
set @myvar2 = 3;
set @myvar3 = 4.25;
set @myvar4 = '가수 이름 ==> ';
 
select @myvar1;			-- 저장된 변수값을 출력해줌
select @myvar2 + @myvar3;
select @myvar4, name from usertbl where height > 180;
 
set @myvar1 = 3;
prepare myQuery			-- 자주 사용하는 쿼리를 지정해서 저장
	from 'select name, height from usertbl order by height limit ?';
execute myquery using @myvar1;
# select name, height from usertbl order by height limit 3;와 같은 결과

select avg(amount) as '평균 구매 갯수' from buytbl;
select cast(avg(amount) as signed integer) as '평균 구매 갯수' from buytbl;
select convert(avg(amount), signed integer) as '평균 구매 갯수' from buytbl;

select cast('2020$12$12' as date);
select cast('2020/12/12' as date);
select cast('2020%12%12' as date);
select cast('2020@12@12' as date);

select num, concat(cast(price as char(10)), ' x ', cast(amount as char(4)), ' =')
	as '단가 x 수량', price*amount as '구매액' from buytbl;
-- concat : 값을 붙여서 출력 (char 타입을 쭊 붙여서 출력)

select '100' + '200';			-- 문자와 문자를 더함 (정수로 변환되서 연산됨)
select concat('100', '200');	-- 문자와 문자를 연결 (문자로 처리)
select concat(100, '200');		-- 정수와 문자를 연결 (정수가 문자로 변환되서 처리)
select 1 > '2mega';				-- 정수인 2로 변환되어서 비교
select 0 = 'mega2';				-- 문자는 0으로 변환됨

select if(100>200, '참이다', '거짓이다');

select ifnull(null, '널이군요'), ifnull(100, '널이군요');
-- ifnull : 첫번째 값이 null이면 두 번째 값 리턴 // 첫 번째값이 null이 아니면 첫 번째 값 리턴
select nullif(100, 100), nullif(200,100);
-- nullif : 두 개가 같은 값이면 null리턴

select case 10
	when 1 then '일'
    when 5 then '오'
    when 10 then '십'
    else '모름'
end;    
-- if else문이랑 비슷

-- bit_length : 몇 비트인지(1바이트 = 8비트), char_length : 글자길이, length : 몇 바이트인지
select bit_length('abc'), char_length('abc'), length('abc');
select bit_length('가나다'), char_length('가나다'), length('가나다');
-- 한글은 한 글자당 3바이트

select concat_ws('/', '2020', '01', '01');			-- 구분자로 문자열을 이어준다.

select elt(2, '하나', '둘', '셋'), field('둘', '하나', '둘', '셋'), find_in_set('둘', '하나, 둘, 셋'),
	instr('하나둘셋', '둘'), locate('둘', '하나둘셋');
-- elt : 2번째 인자 리턴, field / find_in_set / instr / locate : '둗'값이 몇 번째에 있는지(표기법은 다름)

select format(123456.123456, 4);				-- 소숫점 4번째까지만 표기

select insert('abcdefghi', 3, 4, '@@@@'), insert('abcdefghi', 3, 2, '@@@@');
-- insert : 'abcd~'에서 3번째부터 4개의 값을 없애고 '@@@@"로 채움

select left('abcdefghi', 3), right('abcdefghi', 3);		-- left : 왼쪽 3개 출력, right : 오른쪽 3개 출력

select lower('abcdEFGH'), upper('abcdEFGH');

select lpad('이것이', 5, '##'), rpad('이것이', 5, '##');
-- lpad : 5글자 중에 남는 공간은 왼쪽을 '##'로 채움, rpad : 5글자 중에 남는 공간은 오른쪽을 '##'로 채움


select ltrim(' 이것이'), rtrim('이것이 ');		-- ltrim은 왼쪽, rtrim은 오른쪽의 공백 지우기

-- repeat 함수를 사용하면 묶여서 아래에서부터 #으로 주석차리함
# select repeat('이것이', 3);

select replace('이것이 MySQL이다', '이것이', 'This is');

select reverse('MySQL');

select concat('이것이', space(10), 'MySQL이다');

select substring('대한민국만세', 3, 2);			-- 3번째부터 2글자 출력

select substring_index('cafe.naver.com', '.', 2), substring_index('cafe.naver.com', '.', -2);
-- substring_index : '.'을 기준으로 앞에서부터 2개(양수일 때), 뒤에서부터 2개(음수일 때)

select abs(-100);

select ceiling(4.7), floor(4.7), round(4.7);
-- ceiling : 올림, floor : 내림, round : 반올림

SELECT CONV('AA', 16, 2), CONV(100, 10, 8);
-- conv : 16진수를 2진수로 표기 // 10진수를 8진수로 표기

SELECT MOD(157, 10), 157 % 10, 157 MOD 10;		-- 다 같은 결과를 가짐

SELECT POW(2,3), SQRT(9);			-- 2의 3제곱, 루트9

SELECT SIGN(100), SIGN(0), SIGN(-100.123);
-- sign : 양수면 1, 0은 0, 음수면 -1 리턴

SELECT TRUNCATE(12345.12345, 2), TRUNCATE(12345.12345, -2);
-- truncate : 양수면 n번째 소숫점까지만 표기, 음수면 일의 자리수부터 10의 n자리수까지 0으로 채우고 반올림(ex : 12345.12345 -> 12300)

use sqldb;
create table maxtbl ( col1 longtext, col2 longtext);
# insert into maxtbl values (repeat('A', 1000000), repeat('가', 1000000));
select length(col1), length(col2) from maxtbl;
# insert into maxtbl values (repeat('A', 10000000), repeat('가',10000000));

/*
<cmd 창에서 실행>
CD %PROGRAMDATA%
CD MySQL
CD "MySQL Server 5.7"
DIR
NOTEPAD my.ini
max_allowed_packet=4M --> 1000M
NET STOP MySQL
NET START MySQL
*/

# insert into maxtbl values (repeat('A', 10000000), repeat('가',10000000));
select length(col1), length(col2) from maxtbl;
SHOW variables LIKE 'max%';

/*
<cmd 창에서 실행>
secure-file-priv = c:/Temp
*/

use sqldb;
select * into outfile 'c:/Temp/usertbl.txt' from usertbl;			-- 테이블 텍스트파일로 내보내기

create table membertbl like usertbl;		-- 테이블 구조만 복사

load data local infile 'c:/Temp/usertbl.txt' into table membertbl;	-- 텍스트파일을 테이블로 불러오기

select * from membertbl;

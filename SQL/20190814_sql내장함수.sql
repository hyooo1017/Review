-- emp 테이블의 data 수만큼 결과 출력
select 24*60 from emp;

-- dual 테이블 : 오라클에서 산술 연산 결과를 한 줄로 얻기 위해 제공하는 테이블
select 24*60 from dual;

desc dual;

select * from dual;

-- 현재 날짜를 얻기 위한 함수 sysdate
select sysdate from dual;

-- 절댓값 구하는 함수 abs
select -10, abs(-10) from dual;

-- 소숫점 아래를 버리는 함수 floor(입력값보다 작거나 같은 최대정수)
select 34.5678, floor(34.5678) from dual;

-- 반올림하는 함수 round     // 원하는 자리에서 반올림 가능
select 34.5678, round(34.5678) from dual;

select 34.5678, round(34.5678, 2) from dual;  -- 소숫점 둘째자리까지 표기(소숫점 셋째자리에서 반올림)

select 34.5678, round(34.5678, -1) from dual; -- 일의 자리에서 반올림

-- 내림 함수 trunc         // 원하는 자리에서 내림 가능
select trunc(34.5678, 2), trunc(34.5678, -1), trunc(34.5678) from dual;

-- 나머지를 구하는 함수 mod
select mod(27, 2), mod(27, 5), mod(27,7) from dual;

-- 스스로 해보기 1. ------------------------
select * from emp where mod(empno, 2) = 1;
------------------------------------------

-- 대문자로 변환하는 함수 upper
select 'Welcome to Oracle', upper('Welcome to Oracle') from dual;

-- 소문자로 변환하는 함수 lower
select 'Welcome to Oracle', lower('Welcome to Oracle') from dual;

-- 문자열의 이니셜(띄어쓰기 후 첫 문자)만 대문자로 변환하는 함수 initcap
select 'WELCOME TO ORACLE', initcap('WELCOME TO ORACLE') from dual;

-- 스스로 해보기 2. ---------------------------------------------
select empno, ename, job from emp where lower(job) = 'manager';
---------------------------------------------------------------

-- 글자 수 구하는 함수 length
select length('Oracle'), length('오라클') from dual;

-- 바이트 수를 구하는 함수 lengthb
select lengthb('Oracle'), lengthb('오라클') from dual;  -- 영어는 한 글자당 1바이트, 한글은 한 글자당 3바이트

-- 문자열 일부만 추출하는 함수 substr(문자열, 시작 인덱스, 추출할 문자 갯수)
select substr('Welcome to Oracle', 4, 3) from dual;  -- 오라클 인덱스는 1부터 시작 

select substr('Welcome to Oracle', -4, 3) from dual; -- 음수 인덱스는 뒤에서부터 -> 방향으로 원하는 갯수 추출

select substr(hiredate, 1, 2) 년도, substr(hiredate, 4, 2) 달 from emp;

select * from emp where substr(hiredate, 4, 2) = '09'; -- 9월에 입사한 직원

-- 스스로 해보기 3. ------------------------------------
select * from emp where substr(hiredate, 1, 2) = '81';
------------------------------------------------------

-- 스스로 해보기 4. ---------------------------------
select * from emp where substr(ename, -1, 1) = 'E';
---------------------------------------------------

-- 바이트를 기준으로 문자열 일부만 추출하는 함수 substrb
select substr('Welcome to Oracle', 3, 4), substrb('Welcome to Oracle', 3, 4) from dual; -- 영어는 한 글자당 1바이트이므로 substr과 substrb의 결과가 같음

select substr('웰컴투오라클', 3, 4), substrb('웰컴투오라클', 3, 4) from dual;  -- 한글은 한 글자당 3바이트이므로 substr과 substrb의 결과가 다름

-- 원하는 문자의 위치를 구하는 함수 instr
select instr('WELCOME TO ORACLE', 'O') from dual;

select instr('WELCOME TO ORACLE', 'O', 6, 2) from dual;  -- 문자열의 6번째 글자 이후로 2번째 'O'의 위치

-- 바이트를 기준으로 원하는 문자의 위치를 구하는 함수 instrb
select instr('데이터베이스', '이', 3, 1), instrb('데이터베이스', '이', 3, 1) from dual;

-- 스스로 해보기 5. ----------------------------------
select * from emp where instr(ename, 'R', 3, 1) = 3;
select * from emp where substr(ename, 3, 1) = 'R';
----------------------------------------------------

-- 특정 기호로 빈 공간을 채우는 함수 lpad / rpad
select lpad('Oracle', 20, '#') from dual;

select rpad('Oracle', 20, '#') from dual;

-- 공백 문자를 삭제하는 함수 ltrim / rtrim
select ltrim('  Oracle   ') from dual;

select rtrim('  Oracle   ') from dual;

-- 특정 문자를 잘라내는 함수 trim
select trim('a' from 'aaaaOracleaaaa') from dual;

select trim('  Oracle   ') from dual;    -- 공백 문자를 잘라냄

-- sysdate 함수를 이용한 날짜 연산
select sysdate -1 어제, sysdate 오늘, sysdate +1 내일 from dual;

-- 스스로 해보기 6. ------------------------------
select floor(sysdate-hiredate) 근무일수 from emp;
------------------------------------------------

select hiredate, round(hiredate, 'MONTH') from emp; -- 입사 날짜의 월 기준 반올림

select hiredate, trunc(hiredate, 'MONTH') from emp; -- 입사 월의 1일

-- 두 날짜 사이의 개월 수를 구하는 함수 months_between
select ename, sysdate, hiredate, trunc(months_between(sysdate, hiredate)) from emp;
select ename, sysdate, hiredate, floor(months_between(sysdate, hiredate)) from emp;

-- 개월 수를 더하는 함수 add_months
select  ename, hiredate, add_months(hiredate, 6) from emp;

-- 해당 날짜와 가장 가까운 요일(미래)의 날짜를 반환하는 함수 next_day
select sysdate, next_day(sysdate, '수요일') from dual;

-- 요일을 영어로 표기하고 싶다면 nls_lang을 사용하여 언어변경!!
alter session set nls_language = 'AMERICAN';
select sysdate, next_day(sysdate, 'WEDESDAY') from dual;
alter session set nls_language = 'KOREAN';

-- 해당 달의 말일을 반환하는 함수 last_day
select hiredate, last_day(hiredate) from emp;

-- 문자형으로 변환하는 함수 to_char
select sysdate, to_char(sysdate, 'YYYY-MM-DD') from dual;

select hiredate, to_char(hiredate, 'YYYY-MM-DD DAY') from emp;
select hiredate, to_char(hiredate, 'YY/MON/DD DY') from emp;    -- 년도는 2자리, 월은 문자, 요일은 약어로 출력

select to_char(sysdate, 'YYYY/MM/DD, HH24:MI:SS') from dual;    -- 24시간으로 표현한 현재 시간 표기

select to_char(1230000) from dual;

select ename, sal, to_char(sal, 'L999,999') from emp;  -- 현재 활성화되어 있는 지역 통화기호를 표기하고 천 단위마다 콤마 표기

select to_char(123456, '000000000'), to_char(123456, '999,999,999') from dual; -- 0은 자릿수를 나타내며 자릿수가 맞지 않을 경우에는 0으로 채우고 9는 채우지 않는다

-- 날짜형으로 변환하는 함수 to_date
select ename, hiredate from emp where hiredate = to_date(19810220, 'YYYYMMDD');

select trunc(sysdate - to_date('2009/01/01', 'YYYY/MM/DD')) from dual;

-- 숫자형으로 변환하는 함수 to_number
select to_number('20,000', '99,999') - to_number('10,000', '99,999') from dual;

-- null을 다른 값으로 변환하는 함수 nvl
select ename, sal, comm, sal*12+comm, nvl(comm, 0), sal*12+nvl(comm, 0) from emp order by job;

-- 스스로 해보기 7. ------------------------------------------------------------------
select empno, ename, nvl(to_char(mgr, ''), 'CEO') as CEO from emp where mgr is null;
------------------------------------------------------------------------------------

-- 선택을 위한 함수 decode
select deptno, decode(deptno, 10, 'A', 20, 'B', 'DEFAULT') from emp order by deptno; -- 부서번호가 10이면 A, 20이면 B, 나머진 default

select ename, deptno, decode(deptno, 10, 'ACCOUNTING',
                                     20, 'RESEARCH',
                                     30, 'SALES',
                                     40, 'OPERATIONS') as dname from emp;

-- 스스로 해보기 8. ----------------------------------------------------------------
select empno, ename, job, sal, decode(job, 'ANALYST', sal*1.05, 
                                           'SALESMAN', sal*1.10, 
                                           'MANAGER', sal*1.15, 
                                           'CLERK', sal*1.20, sal) UpSAL from emp;
----------------------------------------------------------------------------------

-- 비교연산자를 이용한 여러 조건 중 하나를 선택하는 함수 case
select ename, deptno, case when deptno = 10 then 'ACCOUNTING'
                           when deptno = 20 then 'RESEARCH'
                           when deptno = 30 then 'SALES'
                           when deptno = 40 then 'OPERATIONS'
                           end as dname from emp;

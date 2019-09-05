select * from emp;

select empno, ename, sal from emp;

select * from emp where sal >= 3000;

select * from emp where deptno = 10;

-- 스스로 해보기 1. -------------------------------------
select empno, ename, sal from emp where sal <= 1500;
-------------------------------------------------------

select empno, ename, sal from emp where ename = 'FORD';

-- 스스로 해보기 2. --------------------------------------
select empno, ename, sal from emp where ename = 'SMITH';
--------------------------------------------------------

select * from emp where hiredate <= '1982/01/01';

select * from emp where deptno = 10 and job = 'MANAGER';

select * from emp where deptno = 10 or job = 'MANAGER';

select * from emp where not deptno = 10;
select * from emp where deptno <> 10;

select * from emp where sal >= 2000 and sal <= 3000;

select * from emp where sal <= 2000 or sal >= 3000;

select * from emp where comm = 300 or comm = 500 or comm = 1400;

-- 스스로 해보기 3. -----------------------------------------------------------
select empno, sal from emp where empno = 7521 or empno = 7654 or empno = 7844;
-----------------------------------------------------------------------------

select * from emp where sal >= 2000 and sal <= 3000;
select * from emp where sal between 2000 and 3000;

select * from emp where sal <2000 or sal > 3000;
select * from emp where sal not between 2000 and 3000;

select * from emp where hiredate between '1982/01/01' and '1982/12/31';

select * from emp where comm = 300 or comm = 500 or comm = 1400;
select * from emp where comm in (300, 500, 1400);

-- 스스로 해보기 4. ----------------------------------------------
select empno, ename from emp where empno in (7521, 7654, 7844);
----------------------------------------------------------------

select * from emp where comm <> 300 and comm <> 500 and comm <> 1400;
select * from emp where comm not in (300, 500, 1400);

-- 스스로 해보기 5. -------------------------------------------------------------------
select empno, ename from emp where empno <> 7521 and empno <> 7654 and empno <> 7844;  -- 비교연산자와 and 이용
select empno, ename from emp where empno not in (7521, 7654, 7844);                    -- not in 연산자
-------------------------------------------------------------------------------------

select * from emp where ename like 'F%';

-- 스스로 해보기 6. ----------------------
select * from emp where ename like 'J%';
----------------------------------------

select * from emp where ename like '%A%';

select * from emp where ename like '%N';

-- 스스로 해보기 7. ---------------------------------
select empno, ename from emp where ename like 'K%';  -- k로 시작하는 이름
select empno, ename from emp where ename like '%K%'; -- k가 들어가는 이름
select empno, ename from emp where ename like '%K';  -- k로 끝나는 이름
----------------------------------------------------

select * from emp where ename like '_A%';

select * from emp where ename like '__A%';

select empno, ename from emp where ename like '%\%%' escape '\';

select * from emp where ename not like '%A%';

select ename, job, comm from emp;

select * from emp where comm is null;

select * from emp where comm is not null;

-- 스스로 해보기 8. ------------------
select * from emp where mgr is null;
------------------------------------

select * from emp order by sal asc;

select * from emp order by sal;    -- 기본적으로 오름차순 정렬

-- 스스로 해보기 9. -------------------------------------------------
select empno, ename, job, hiredate from emp order by hiredate;
-------------------------------------------------------------------

select * from emp order by sal desc;

-- 스스로 해보기 10. ------------------------------
select empno, ename from emp order by empno desc;
-------------------------------------------------

select * from emp order by ename;

select * from emp order by hiredate desc;

select * from emp order by sal desc, ename asc;

-- 스스로 해보기 11. ----------------------------------
select * from emp order by deptno asc, hiredate desc;
-----------------------------------------------------
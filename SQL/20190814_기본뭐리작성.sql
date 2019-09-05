select * from emp;

select empno, ename, sal from emp;

select * from emp where sal >= 3000;

select * from emp where deptno = 10;

-- ������ �غ��� 1. -------------------------------------
select empno, ename, sal from emp where sal <= 1500;
-------------------------------------------------------

select empno, ename, sal from emp where ename = 'FORD';

-- ������ �غ��� 2. --------------------------------------
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

-- ������ �غ��� 3. -----------------------------------------------------------
select empno, sal from emp where empno = 7521 or empno = 7654 or empno = 7844;
-----------------------------------------------------------------------------

select * from emp where sal >= 2000 and sal <= 3000;
select * from emp where sal between 2000 and 3000;

select * from emp where sal <2000 or sal > 3000;
select * from emp where sal not between 2000 and 3000;

select * from emp where hiredate between '1982/01/01' and '1982/12/31';

select * from emp where comm = 300 or comm = 500 or comm = 1400;
select * from emp where comm in (300, 500, 1400);

-- ������ �غ��� 4. ----------------------------------------------
select empno, ename from emp where empno in (7521, 7654, 7844);
----------------------------------------------------------------

select * from emp where comm <> 300 and comm <> 500 and comm <> 1400;
select * from emp where comm not in (300, 500, 1400);

-- ������ �غ��� 5. -------------------------------------------------------------------
select empno, ename from emp where empno <> 7521 and empno <> 7654 and empno <> 7844;  -- �񱳿����ڿ� and �̿�
select empno, ename from emp where empno not in (7521, 7654, 7844);                    -- not in ������
-------------------------------------------------------------------------------------

select * from emp where ename like 'F%';

-- ������ �غ��� 6. ----------------------
select * from emp where ename like 'J%';
----------------------------------------

select * from emp where ename like '%A%';

select * from emp where ename like '%N';

-- ������ �غ��� 7. ---------------------------------
select empno, ename from emp where ename like 'K%';  -- k�� �����ϴ� �̸�
select empno, ename from emp where ename like '%K%'; -- k�� ���� �̸�
select empno, ename from emp where ename like '%K';  -- k�� ������ �̸�
----------------------------------------------------

select * from emp where ename like '_A%';

select * from emp where ename like '__A%';

select empno, ename from emp where ename like '%\%%' escape '\';

select * from emp where ename not like '%A%';

select ename, job, comm from emp;

select * from emp where comm is null;

select * from emp where comm is not null;

-- ������ �غ��� 8. ------------------
select * from emp where mgr is null;
------------------------------------

select * from emp order by sal asc;

select * from emp order by sal;    -- �⺻������ �������� ����

-- ������ �غ��� 9. -------------------------------------------------
select empno, ename, job, hiredate from emp order by hiredate;
-------------------------------------------------------------------

select * from emp order by sal desc;

-- ������ �غ��� 10. ------------------------------
select empno, ename from emp order by empno desc;
-------------------------------------------------

select * from emp order by ename;

select * from emp order by hiredate desc;

select * from emp order by sal desc, ename asc;

-- ������ �غ��� 11. ----------------------------------
select * from emp order by deptno asc, hiredate desc;
-----------------------------------------------------
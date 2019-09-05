-- emp ���̺��� data ����ŭ ��� ���
select 24*60 from emp;

-- dual ���̺� : ����Ŭ���� ��� ���� ����� �� �ٷ� ��� ���� �����ϴ� ���̺�
select 24*60 from dual;

desc dual;

select * from dual;

-- ���� ��¥�� ��� ���� �Լ� sysdate
select sysdate from dual;

-- ���� ���ϴ� �Լ� abs
select -10, abs(-10) from dual;

-- �Ҽ��� �Ʒ��� ������ �Լ� floor(�Է°����� �۰ų� ���� �ִ�����)
select 34.5678, floor(34.5678) from dual;

-- �ݿø��ϴ� �Լ� round     // ���ϴ� �ڸ����� �ݿø� ����
select 34.5678, round(34.5678) from dual;

select 34.5678, round(34.5678, 2) from dual;  -- �Ҽ��� ��°�ڸ����� ǥ��(�Ҽ��� ��°�ڸ����� �ݿø�)

select 34.5678, round(34.5678, -1) from dual; -- ���� �ڸ����� �ݿø�

-- ���� �Լ� trunc         // ���ϴ� �ڸ����� ���� ����
select trunc(34.5678, 2), trunc(34.5678, -1), trunc(34.5678) from dual;

-- �������� ���ϴ� �Լ� mod
select mod(27, 2), mod(27, 5), mod(27,7) from dual;

-- ������ �غ��� 1. ------------------------
select * from emp where mod(empno, 2) = 1;
------------------------------------------

-- �빮�ڷ� ��ȯ�ϴ� �Լ� upper
select 'Welcome to Oracle', upper('Welcome to Oracle') from dual;

-- �ҹ��ڷ� ��ȯ�ϴ� �Լ� lower
select 'Welcome to Oracle', lower('Welcome to Oracle') from dual;

-- ���ڿ��� �̴ϼ�(���� �� ù ����)�� �빮�ڷ� ��ȯ�ϴ� �Լ� initcap
select 'WELCOME TO ORACLE', initcap('WELCOME TO ORACLE') from dual;

-- ������ �غ��� 2. ---------------------------------------------
select empno, ename, job from emp where lower(job) = 'manager';
---------------------------------------------------------------

-- ���� �� ���ϴ� �Լ� length
select length('Oracle'), length('����Ŭ') from dual;

-- ����Ʈ ���� ���ϴ� �Լ� lengthb
select lengthb('Oracle'), lengthb('����Ŭ') from dual;  -- ����� �� ���ڴ� 1����Ʈ, �ѱ��� �� ���ڴ� 3����Ʈ

-- ���ڿ� �Ϻθ� �����ϴ� �Լ� substr(���ڿ�, ���� �ε���, ������ ���� ����)
select substr('Welcome to Oracle', 4, 3) from dual;  -- ����Ŭ �ε����� 1���� ���� 

select substr('Welcome to Oracle', -4, 3) from dual; -- ���� �ε����� �ڿ������� -> �������� ���ϴ� ���� ����

select substr(hiredate, 1, 2) �⵵, substr(hiredate, 4, 2) �� from emp;

select * from emp where substr(hiredate, 4, 2) = '09'; -- 9���� �Ի��� ����

-- ������ �غ��� 3. ------------------------------------
select * from emp where substr(hiredate, 1, 2) = '81';
------------------------------------------------------

-- ������ �غ��� 4. ---------------------------------
select * from emp where substr(ename, -1, 1) = 'E';
---------------------------------------------------

-- ����Ʈ�� �������� ���ڿ� �Ϻθ� �����ϴ� �Լ� substrb
select substr('Welcome to Oracle', 3, 4), substrb('Welcome to Oracle', 3, 4) from dual; -- ����� �� ���ڴ� 1����Ʈ�̹Ƿ� substr�� substrb�� ����� ����

select substr('����������Ŭ', 3, 4), substrb('����������Ŭ', 3, 4) from dual;  -- �ѱ��� �� ���ڴ� 3����Ʈ�̹Ƿ� substr�� substrb�� ����� �ٸ�

-- ���ϴ� ������ ��ġ�� ���ϴ� �Լ� instr
select instr('WELCOME TO ORACLE', 'O') from dual;

select instr('WELCOME TO ORACLE', 'O', 6, 2) from dual;  -- ���ڿ��� 6��° ���� ���ķ� 2��° 'O'�� ��ġ

-- ����Ʈ�� �������� ���ϴ� ������ ��ġ�� ���ϴ� �Լ� instrb
select instr('�����ͺ��̽�', '��', 3, 1), instrb('�����ͺ��̽�', '��', 3, 1) from dual;

-- ������ �غ��� 5. ----------------------------------
select * from emp where instr(ename, 'R', 3, 1) = 3;
select * from emp where substr(ename, 3, 1) = 'R';
----------------------------------------------------

-- Ư�� ��ȣ�� �� ������ ä��� �Լ� lpad / rpad
select lpad('Oracle', 20, '#') from dual;

select rpad('Oracle', 20, '#') from dual;

-- ���� ���ڸ� �����ϴ� �Լ� ltrim / rtrim
select ltrim('  Oracle   ') from dual;

select rtrim('  Oracle   ') from dual;

-- Ư�� ���ڸ� �߶󳻴� �Լ� trim
select trim('a' from 'aaaaOracleaaaa') from dual;

select trim('  Oracle   ') from dual;    -- ���� ���ڸ� �߶�

-- sysdate �Լ��� �̿��� ��¥ ����
select sysdate -1 ����, sysdate ����, sysdate +1 ���� from dual;

-- ������ �غ��� 6. ------------------------------
select floor(sysdate-hiredate) �ٹ��ϼ� from emp;
------------------------------------------------

select hiredate, round(hiredate, 'MONTH') from emp; -- �Ի� ��¥�� �� ���� �ݿø�

select hiredate, trunc(hiredate, 'MONTH') from emp; -- �Ի� ���� 1��

-- �� ��¥ ������ ���� ���� ���ϴ� �Լ� months_between
select ename, sysdate, hiredate, trunc(months_between(sysdate, hiredate)) from emp;
select ename, sysdate, hiredate, floor(months_between(sysdate, hiredate)) from emp;

-- ���� ���� ���ϴ� �Լ� add_months
select  ename, hiredate, add_months(hiredate, 6) from emp;

-- �ش� ��¥�� ���� ����� ����(�̷�)�� ��¥�� ��ȯ�ϴ� �Լ� next_day
select sysdate, next_day(sysdate, '������') from dual;

-- ������ ����� ǥ���ϰ� �ʹٸ� nls_lang�� ����Ͽ� ����!!
alter session set nls_language = 'AMERICAN';
select sysdate, next_day(sysdate, 'WEDESDAY') from dual;
alter session set nls_language = 'KOREAN';

-- �ش� ���� ������ ��ȯ�ϴ� �Լ� last_day
select hiredate, last_day(hiredate) from emp;

-- ���������� ��ȯ�ϴ� �Լ� to_char
select sysdate, to_char(sysdate, 'YYYY-MM-DD') from dual;

select hiredate, to_char(hiredate, 'YYYY-MM-DD DAY') from emp;
select hiredate, to_char(hiredate, 'YY/MON/DD DY') from emp;    -- �⵵�� 2�ڸ�, ���� ����, ������ ���� ���

select to_char(sysdate, 'YYYY/MM/DD, HH24:MI:SS') from dual;    -- 24�ð����� ǥ���� ���� �ð� ǥ��

select to_char(1230000) from dual;

select ename, sal, to_char(sal, 'L999,999') from emp;  -- ���� Ȱ��ȭ�Ǿ� �ִ� ���� ��ȭ��ȣ�� ǥ���ϰ� õ �������� �޸� ǥ��

select to_char(123456, '000000000'), to_char(123456, '999,999,999') from dual; -- 0�� �ڸ����� ��Ÿ���� �ڸ����� ���� ���� ��쿡�� 0���� ä��� 9�� ä���� �ʴ´�

-- ��¥������ ��ȯ�ϴ� �Լ� to_date
select ename, hiredate from emp where hiredate = to_date(19810220, 'YYYYMMDD');

select trunc(sysdate - to_date('2009/01/01', 'YYYY/MM/DD')) from dual;

-- ���������� ��ȯ�ϴ� �Լ� to_number
select to_number('20,000', '99,999') - to_number('10,000', '99,999') from dual;

-- null�� �ٸ� ������ ��ȯ�ϴ� �Լ� nvl
select ename, sal, comm, sal*12+comm, nvl(comm, 0), sal*12+nvl(comm, 0) from emp order by job;

-- ������ �غ��� 7. ------------------------------------------------------------------
select empno, ename, nvl(to_char(mgr, ''), 'CEO') as CEO from emp where mgr is null;
------------------------------------------------------------------------------------

-- ������ ���� �Լ� decode
select deptno, decode(deptno, 10, 'A', 20, 'B', 'DEFAULT') from emp order by deptno; -- �μ���ȣ�� 10�̸� A, 20�̸� B, ������ default

select ename, deptno, decode(deptno, 10, 'ACCOUNTING',
                                     20, 'RESEARCH',
                                     30, 'SALES',
                                     40, 'OPERATIONS') as dname from emp;

-- ������ �غ��� 8. ----------------------------------------------------------------
select empno, ename, job, sal, decode(job, 'ANALYST', sal*1.05, 
                                           'SALESMAN', sal*1.10, 
                                           'MANAGER', sal*1.15, 
                                           'CLERK', sal*1.20, sal) UpSAL from emp;
----------------------------------------------------------------------------------

-- �񱳿����ڸ� �̿��� ���� ���� �� �ϳ��� �����ϴ� �Լ� case
select ename, deptno, case when deptno = 10 then 'ACCOUNTING'
                           when deptno = 20 then 'RESEARCH'
                           when deptno = 30 then 'SALES'
                           when deptno = 40 then 'OPERATIONS'
                           end as dname from emp;

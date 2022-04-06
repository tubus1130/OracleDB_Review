CREATE TABLE TABLE_CHECK(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCH_LOGINID_PK PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLCH_LOGINPWD_CK CHECK(LENGTH(LOGIN_PWD) > 3),
    TEL VARCHAR2(20)
);

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'TABLE_CHECK';

INSERT INTO TABLE_CHECK
    VALUES('TEST_ID', '1234', '010-1234-5678');

SELECT * FROM TABLE_CHECK;

CREATE TABLE TABLE_DEFAULT(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLDEFAULT_LOGINID_PK PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) DEFAULT '1234',
    TEL VARCHAR2(20)
);

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TABLE_DEFAULT';

INSERT INTO TABLE_DEFAULT(LOGIN_ID, TEL)
    VALUES('TEST_ID', '010-1234-5678');
SELECT * FROM TABLE_DEFAULT;

CREATE TABLE DEPT_CONST(
    DEPTNO NUMBER(2) CONSTRAINT DEPTCONST_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14) CONSTRAINT DEPTCONST_DNAME_UNQ UNIQUE,
    LOC VARCHAR2(13) CONSTRAINT DEPTCONST_LOC_NN NOT NULL
);

CREATE TABLE EMP_CONST(
    EMPNO NUMBER(4) CONSTRAINT EMPCONST_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10) CONSTRAINT EMPCONST_ENAME_NN NOT NULL,
    JOB VARCHAR2(9),
    TEL VARCHAR2(10) CONSTRAINT EMPCONST_TEL_UNQ UNIQUE,
    HIREDATE DATE,
    SAL NUMBER(7, 2) CONSTRAINT EMPCONST_SAL_CHK CHECK (SAL BETWEEN 1000 AND 9999),
    COMM NUMBER(7, 2),
    DEPTNO NUMBER(2),
    CONSTRAINT EMPCONST_DEPTNO_FK FOREIGN KEY(DEPTNO)
    REFERENCES DEPT_CONST(DEPTNO)
);

SELECT T1.TABLE_NAME,
    t1.constraint_name,
    t1.constraint_type
FROM USER_CONSTRAINTS T1
WHERE T1.TABLE_NAME IN ('EMP_CONST', 'DEPT_CONST');

ALTER SESSION SET "_oracle_script" = true;

CREATE USER ORCLSTUDY
IDENTIFIED BY ORACLE;

GRANT CREATE SESSION TO ORCLSTUDY;

SELECT *
FROM DBA_USERS
WHERE USERNAME = 'ORCLSTUDY';

ALTER USER ORCLSTUDY
IDENTIFIED BY ORCL;

DROP USER ORCLSTUDY CASCADE;

GRANT RESOURCE,
    CREATE SESSION,
    CREATE TABLE
TO ORCLSTUDY;

ALTER USER ORCLSTUDY
DEFAULT TABLESPACE USERS
QUOTA UNLIMITED ON USERS;

CREATE TABLE TEMP2(
    COL1 VARCHAR2(20),
    COL2 VARCHAR2(20)
);

INSERT INTO TEMP2
    VALUES('USER', 'GRANT_TEST');
SELECT * FROM TEMP2;

SELECT TABLESPACE_NAME,
    FILE_NAME
FROM DBA_DATA_FILES;

CREATE TABLESPACE goodman_ts
DATAFILE 'C:\APP\CHAEW\PRODUCT\18.0.0\ORADATA\XE\goodman01.DBF'
SIZE 300M AUTOEXTEND ON NEXT 30M;

CREATE USER goodman
IDENTIFIED BY pcwk
DEFAULT TABLESPACE goodman_ts
TEMPORARY TABLESPACE temp;

GRANT RESOURCE,
    CREATE SESSION,
    CREATE TABLE
TO goodman;

ALTER USER goodman
DEFAULT TABLESPACE goodman_ts
QUOTA UNLIMITED ON goodman_ts;

CREATE TABLE DEPT(
    DEPTNO NUMBER(4) CONSTRAINT PK_DEPT PRIMARY KEY,
    DNAME VARCHAR2(30),
    LOC VARCHAR2(50)
);
DESC DEPT;

INSERT INTO DEPT
    VALUES(10, 'EDUCATION', 'SEOUL');
SELECT * FROM DEPT;

REVOKE RESOURCE,
    CREATE TABLE
FROM ORCLSTUDY;

CREATE TABLE TEMP321(
    COL1 NUMBER
);
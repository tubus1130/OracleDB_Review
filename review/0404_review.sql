CREATE TABLE dept_sequence
AS(
    SELECT *
    FROM dept
    WHERE 1=2
);
DESC dept_sequence;

CREATE SEQUENCE seq_dept_sequence
INCREMENT BY 10
START WITH 10
MAXVALUE 90
MINVALUE 10
NOCYCLE
CACHE 2;

SELECT * FROM USER_SEQUENCES;

INSERT INTO DEPT_SEQUENCE
    VALUES(SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');
SELECT * FROM DEPT_SEQUENCE;

INSERT INTO DEPT_SEQUENCE
    VALUES(SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');
SELECT * FROM DEPT_SEQUENCE;

ALTER SEQUENCE SEQ_DEPT_SEQUENCE
INCREMENT BY 3
MAXVALUE 99
MINVALUE 0
CYCLE
CACHE 2;

INSERT INTO DEPT_SEQUENCE
    VALUES(SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');
SELECT * FROM DEPT_SEQUENCE;

DROP SEQUENCE SEQ_DEPT_SEQUENCE;
SELECT * FROM USER_SEQUENCES;

CREATE SYNONYM E
FOR EMP;

SELECT * FROM E;

CREATE PUBLIC SYNONYM D2
FOR DEPT;
SELECT * FROM D2;

SELECT *
FROM DBA_SYNONYMS
WHERE TABLE_NAME = 'DEPT';

DROP PUBLIC SYNONYM D2;

CREATE TABLE EMPIDX
AS (
    SELECT *
    FROM EMP
);

CREATE INDEX IDX_EMPIDX_EMPNO
ON EMPIDX(EMPNO);

SELECT *
FROM USER_INDEXES
WHERE TABLE_NAME = 'EMPIDX'
;

CREATE OR REPLACE VIEW EMPIDX_OVER15K
AS (
    SELECT T1.EMPNO,
        T1.ENAME,
        T1.JOB,
        T1.DEPTNO,
        T1.SAL,
        DECODE(T1.COMM, NULL, 'X', 'O') AS "COMM"
    FROM EMPIDX T1
    WHERE SAL > 1500
);

CREATE TABLE DEPTSEQ
AS (
    SELECT *
    FROM DEPT
);

CREATE SEQUENCE SEQ_DEPTSEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 99
MINVALUE 1
NOCYCLE
NOCACHE;

SELECT * FROM USER_SEQUENCES;

SELECT * FROM DEPTSEQ;
INSERT INTO DEPTSEQ
    VALUES(SEQ_DEPTSEQ.NEXTVAL, 'DATABASE', 'SEOUL');
INSERT INTO DEPTSEQ
    VALUES(SEQ_DEPTSEQ.NEXTVAL, 'WEB', 'BUSAN');
INSERT INTO DEPTSEQ
    VALUES(SEQ_DEPTSEQ.NEXTVAL, 'MOBILE', 'ILSAN');
COMMIT;

SELECT * FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMPIDX';

CREATE TABLE TABLE_NOTNULL(
    LOGIN_ID VARCHAR2(20) NOT NULL,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20)
);
DESC TABLE_NOTNULL;

INSERT INTO TABLE_NOTNULL
    VALUES('TEST_01', NULL, '010-1234-5678');

INSERT INTO TABLE_NOTNULL(LOGIN_ID, LOGIN_PWD)
    VALUES('TEST_01', '1234');
SELECT * FROM TABLE_NOTNULL;

UPDATE TABLE_NOTNULL
SET LOGIN_PWD = NULL
WHERE LOGIN_ID = 'TEST_01';

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TABLE_NOTNULL';

CREATE TABLE TABLE_NOTNULL2(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBL_NM2_LOGIN_ID_NN NOT NULL,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TBL_NM2_LOGIN_PWD_NN NOT NULL,
    TEL VARCHAR2(20)
);
DESC TABLE_NOTNULL2;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TABLE_NOTNULL2';

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TABLE_NOTNULL';

ALTER TABLE TABLE_NOTNULL
MODIFY(TEL NOT NULL);

SELECT * FROM TABLE_NOTNULL;

UPDATE TABLE_NOTNULL
SET TEL = '010-1234-5678'
WHERE LOGIN_ID = 'TEST_01';
COMMIT;

ALTER TABLE TABLE_NOTNULL
MODIFY (TEL NOT NULL);

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TABLE_NOTNULL';

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TABLE_NOTNULL2';

ALTER TABLE TABLE_NOTNULL2
MODIFY (TEL CONSTRAINT TBL_NM2_TEL_NN NOT NULL);

ALTER TABLE TABLE_NOTNULL2
RENAME CONSTRAINT TBL_NM2_TEL_NN TO TBL_NM22_TEL_NN;

ALTER TABLE TABLE_NOTNULL2
DROP CONSTRAINT TBL_NM22_TEL_NN;

CREATE TABLE TABLE_UNIQUE(
    LOGIN_ID VARCHAR2(20) UNIQUE,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20)
);

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TABLE_UNIQUE';

INSERT INTO TABLE_UNIQUE
    VALUES('TEST_ID_01', 'PWD01', '010-1234-5678');
SELECT * FROM TABLE_UNIQUE;
INSERT INTO TABLE_UNIQUE
    VALUES('TEST_ID_01', 'PWD02', '010-1234-5678');
INSERT INTO TABLE_UNIQUE
    VALUES('TEST_ID_02', 'PWD02', '010-1234-5678');
INSERT INTO TABLE_UNIQUE
    VALUES(NULL, 'PWD02', '010-1234-5678');

UPDATE TABLE_UNIQUE
SET LOGIN_ID = 'TEST_ID_01'
WHERE LOGIN_ID IS NULL;

CREATE TABLE TABLE_UNIQUE2(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLUNQ02_LOGINID_UNQ UNIQUE,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLUNQ02_LOGINPWD_NN NOT NULL,
    TEL VARCHAR2(20)
);

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TABLE_UNIQUE2';

ALTER TABLE TABLE_UNIQUE99
	DROP
		UNIQUE (
			LOGIN_ID
		)
		CASCADE
		KEEP INDEX;

DROP INDEX UIX_TABLE_UNIQUE99;

/* ���̺�_UNIQUE */
DROP TABLE TABLE_UNIQUE99 
	CASCADE CONSTRAINTS;

/* ���̺�_UNIQUE */
CREATE TABLE TABLE_UNIQUE99 (
	LOGIN_ID VARCHAR2(20), /* �α���_ID */
	LOGIN_PWD VARCHAR2(20) NOT NULL, /* �α���_��� */
	TEL VARCHAR2(20) /* ��ȭ */
);

COMMENT ON TABLE TABLE_UNIQUE99 IS '���̺�_UNIQUE';

COMMENT ON COLUMN TABLE_UNIQUE99.LOGIN_ID IS '�α���_ID';

COMMENT ON COLUMN TABLE_UNIQUE99.LOGIN_PWD IS '�α���_���';

COMMENT ON COLUMN TABLE_UNIQUE99.TEL IS '��ȭ';

CREATE UNIQUE INDEX UIX_TABLE_UNIQUE99
	ON TABLE_UNIQUE99 (
		LOGIN_ID ASC
	);

ALTER TABLE TABLE_UNIQUE99
	ADD
		CONSTRAINT UK_TABLE_UNIQUE99
		UNIQUE (
			LOGIN_ID
		);
        
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('TABLE_UNIQUE2', 'TABLE_UNIQUE99');

ALTER TABLE TABLE_UNIQUE2
MODIFY (TEL UNIQUE);

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TABLE_UNIQUE2';

SELECT * FROM TABLE_UNIQUE;

UPDATE TABLE_UNIQUE
SET TEL = '010-1235-5678'
WHERE LOGIN_ID = 'TEST_ID_01';

UPDATE TABLE_UNIQUE
SET TEL = '010-1236-5678'
WHERE LOGIN_ID = 'TEST_ID_02';

ALTER TABLE TABLE_UNIQUE
MODIFY (TEL UNIQUE);

SELECT * FROM TABLE_UNIQUE;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'TABLE_UNIQUE';

UPDATE TABLE_UNIQUE
SET TEL = NULL;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TABLE_UNIQUE2';

SELECT *
FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'TABLE_UNIQUE2';

ALTER TABLE TABLE_UNIQUE2
RENAME CONSTRAINT SYS_C009162 TO TBLUNQ02_TEL_UNQ99;

ALTER TABLE TABLE_UNIQUE2
DROP CONSTRAINT TBLUNQ02_TEL_UNQ99;

ALTER TABLE TABLE_UNIQUE2
MODIFY(TEL CONSTRAINT TBLUNQ02_TEL_UNQ99 UNIQUE);
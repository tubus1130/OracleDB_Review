CREATE TABLE TEMP(
    COL1 VARCHAR2(20),
    COL2 VARCHAR2(20)
);

GRANT SELECT ON TEMP TO ORCLSTUDY;

GRANT INSERT ON TEMP TO ORCLSTUDY;

SELECT * FROM SCOTT.TEMP;

INSERT INTO SCOTT.TEMP
    VALUES('TEST_01', 'GRANT_TEST');
SELECT * FROM SCOTT.TEMP;
COMMIT;

SELECT * FROM TEMP;

REVOKE SELECT ON TEMP FROM ORCLSTUDY;
REVOKE INSERT ON TEMP FROM ORCLSTUDY;

SELECT * FROM SCOTT.TEMP;

INSERT INTO SCOTT.TEMP
    VALUES('', '');

ALTER SESSION SET "_oracle_script" = true;
CREATE USER PREV_HW
IDENTIFIED BY ORCL;

GRANT CREATE SESSION
TO PREV_HW;

GRANT SELECT
ON EMP TO PREV_HW;
GRANT SELECT
ON DEPT TO PREV_HW;
GRANT SELECT
ON SALGRADE TO PREV_HW;

SELECT * FROM SCOTT.EMP;
SELECT * FROM SCOTT.DEPT;
SELECT * FROM SCOTT.SALGRADE;

REVOKE SELECT ON SALGRADE FROM PREV_HW;

SELECT * FROM SCOTT.SALGRADE;

SET SERVEROUTPUT ON;
BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO WORLD!');
END;
/

DECLARE
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE(V_EMPNO || '��');
    DBMS_OUTPUT.PUT_LINE(V_ENAME);
END;
/

DECLARE
    V_TAX CONSTANT NUMBER(1) := 3;
BEGIN
--    V_TAX := 4;
    DBMS_OUTPUT.PUT_LINE(V_TAX);
END;
/

DECLARE
    V_DEPTNO NUMBER(2) := NULL;
BEGIN
--    V_DEPTNO := 99.1;
    DBMS_OUTPUT.PUT_LINE(V_DEPTNO);
END;
/

DECLARE
    V_DEPTNO NUMBER(2) NOT NULL := 10;
BEGIN
--    V_DEPTNO := NULL;
    DBMS_OUTPUT.PUT_LINE(V_DEPTNO);
END;
/

DECLARE
    V_DEPTNO NUMBER(2) NOT NULL DEFAULT 20;
BEGIN
--    V_DEPTNO := NULL;
    DBMS_OUTPUT.PUT_LINE(V_DEPTNO);
END;
/

DECLARE
    V_DEPTNO DEPT.DEPTNO%TYPE := 30;
BEGIN
    DBMS_OUTPUT.PUT_LINE(V_DEPTNO);
END;
/

DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
    SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
    FROM DEPT
    WHERE DEPTNO = 10;
    
    DBMS_OUTPUT.PUT_LINE(V_DEPT_ROW.LOC);
END;
/

DECLARE
    V_NUMBER NUMBER := 4;
BEGIN
    IF MOD(V_NUMBER, 2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Ȧ��');
    ELSE DBMS_OUTPUT.PUT_LINE('¦��');
    END IF;
END;
/

DECLARE
    V_SCORE NUMBER := 77;
BEGIN
    IF V_SCORE >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('A');
    ELSIF V_SCORE >= 80 THEN
        DBMS_OUTPUT.PUT_LINE('B');
    ELSIF V_SCORE >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('C');
    ELSE
        DBMS_OUTPUT.PUT_LINE('F');
    END IF;
END;
/


DECLARE
    V_SCORE NUMBER := 80;
BEGIN
    CASE TRUNC(V_SCORE/10)
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('A');
        WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('A');
        WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('B');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('C');
        ELSE DBMS_OUTPUT.PUT_LINE('F');
    END CASE;
END;
/

DECLARE
    V_NUMBER NUMBER := 74;
BEGIN
    CASE
        WHEN TRUNC(V_NUMBER/10) = 10 THEN DBMS_OUTPUT.PUT_LINE('A');
        ELSE DBMS_OUTPUT.PUT_LINE('F');
    END CASE;
END;
/

DECLARE
    V_NUM NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(V_NUM);
        V_NUM := V_NUM + 1;
        IF V_NUM = 5 THEN EXIT;
        END IF;
    END LOOP;
END;
/

DECLARE
    V_NUM NUMBER := 1;
BEGIN
    WHILE V_NUM < 5 LOOP
        DBMS_OUTPUT.PUT_LINE(V_NUM);
        V_NUM := V_NUM + 1;
    END LOOP;
END;
/

DECLARE
    V_NUM NUMBER := 0;
BEGIN
    FOR i IN REVERSE 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..10 LOOP
        CONTINUE WHEN MOD(i, 2) = 1;
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..10 LOOP
        IF MOD(i, 2) = 0 THEN
            CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..10 LOOP
        IF MOD(i, 2) = 1 THEN
            CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

DECLARE
    V_DEPTNO DEPT.DEPTNO%TYPE := 10;
BEGIN
    CASE V_DEPTNO
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('ACCOUNTING');
        WHEN 20 THEN DBMS_OUTPUT.PUT_LINE('RESEARCH');
        WHEN 30 THEN DBMS_OUTPUT.PUT_LINE('SALES');
        WHEN 40 THEN DBMS_OUTPUT.PUT_LINE('OPERATION');
    ELSE DBMS_OUTPUT.PUT_LINE('N/A');
    END CASE;
END;
/
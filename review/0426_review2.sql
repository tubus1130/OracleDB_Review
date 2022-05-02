SELECT * FROM EMP;

SELECT DEPTNO,
    JOB,
    AVG(NVL(SAL, 0)) AS AVG_SAL,
    COUNT(*) AS CNT_EMP
FROM EMP
GROUP BY DEPTNO, JOB
UNION ALL
SELECT DEPTNO,
    NULL,
    AVG(NVL(SAL, 0)) AS AVG_SAL,
    COUNT(*)
FROM EMP
GROUP BY DEPTNO
UNION ALL
SELECT NULL,
    NULL,
    AVG(NVL(SAL, 0)),
    COUNT(*)
FROM EMP;

SELECT DEPTNO,
    JOB,
    AVG(NVL(SAL, 0)) AS AVG_SAL,
    COUNT(*) AS CNT_EMP
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB);

SELECT DEPTNO,
    SUM(DECODE(JOB, 'CLERK', SAL)) 
FROM EMP
GROUP BY ROLLUP(DEPTNO);

SELECT * FROM PC_BOARD;

SELECT TT1.*
FROM(
SELECT ROWNUM AS RNUM, T1.*
FROM (
SELECT *
FROM SAWON
ORDER BY HIREDATE DESC)T1
WHERE ROWNUM <= 10)TT1
WHERE RNUM >= 4
;

SELECT ENAME,
    LOWER(ENAME),
    UPPER(ENAME),
    INITCAP(ENAME)
FROM EMP;

SELECT ENAME,
    LENGTH(ENAME),
    LENGTHB('한글')
FROM EMP;

SELECT JOB,
    SUBSTR(JOB, 1, 2),
    SUBSTR(JOB, 3, 2),
    SUBSTR(JOB, -1),
    SUBSTR(JOB, -LENGTH(JOB))
FROM EMP;

SELECT JOB,
    SUBSTR(JOB, -LENGTH(JOB)),
    SUBSTR(JOB, -LENGTH(JOB), 2),
    SUBSTR(JOB, -3),
    SUBSTR(JOB, 2)
FROM EMP;

SELECT JOB,
    INSTR(JOB, 'S'),
    INSTR(JOB, 'S', 5),
    INSTR(JOB, 'S', 2, 2)
FROM EMP;

SELECT TEL,
    INSTR(TEL, ')') AS POS,
    SUBSTR(TEL, 1, INSTR(TEL, ')') - 1) AS AREA_CODE
FROM STUDENT
WHERE DEPTNO1 = 201
;

SELECT HIREDATE,
    REPLACE(HIREDATE, '-', '/'),
    REPLACE(HIREDATE, '-')    
FROM EMP;

SELECT ENAME,
    REPLACE(ENAME, SUBSTR(ENAME, 1, 2), '**')
FROM EMP;

SELECT 'ORACLE',
    LPAD('ORACLE', 10, '*'),
    LPAD('ORACLE', 10),
    RPAD('ORACLE', 10, '#')
FROM DUAL;

SELECT ENAME,
    LPAD(ENAME, 9, '#'),
    RPAD(ENAME, 9, SUBSTR('123456789', LENGTH(ENAME)+1))
FROM EMP;


SELECT ENAME,
    CONCAT(ENAME, EMPNO),
    CONCAT(EMPNO, CONCAT(' : ', ENAME))
FROM EMP;

SELECT ROUND(1234.5678, 2),
    ROUND(1234.5678, 1),
    ROUND(1234.5678, 0),
    ROUND(1234.5678, -1)
FROM DUAL;

SELECT TRUNC(1234.5678, 2),
    TRUNC(1234.5678, 1),
    TRUNC(1234.5678, 0),
    TRUNC(1234.5678, -1)
FROM DUAL;

SELECT CEIL(123.4),
    CEIL(-1235.3),
    FLOOR(123.5),
    FLOOR(-7.5)
FROM DUAL;

SELECT ROWNUM,
    ENAME,
    CEIL(ROWNUM/3)
FROM EMP;

SELECT *
FROM EMP;

ALTER SESSION SET NLS_DATE_FORMAT = 'RRRR-MM-DD';

SELECT SYSDATE,
    SYSDATE + 1,
    SYSDATE - 1
FROM EMP;

SELECT HIREDATE,
    ADD_MONTHS(HIREDATE, -12*40)
FROM EMP;

SELECT TRUNC(MONTHS_BETWEEN(SYSDATE /*DATE1 DATE*/,
                      HIREDATE /*DATE1 DATE*/)/12, 2)
FROM EMP;

SELECT SYSDATE,
    NEXT_DAY(SYSDATE /*DATE DATE*/,
                     'FRI' /*CHAR*/),
    LAST_DAY(SYSDATE /*DATE DATE*/)
FROM DUAL;

SELECT ROUND(SYSDATE, 'CC'),
    ROUND(SYSDATE, 'YYYY'),
    ROUND(SYSDATE, 'HH')
FROM DUAL;

SELECT 2,
    2 + '2',
    2 + TO_NUMBER('2')
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS'),
    TO_CHAR(SYSDATE, 'MONTH')
FROM DUAL;

SELECT TO_CHAR(1234, 'L999,999.99')
FROM DUAL;

SELECT UPPER(ENAME)
FROM EMP;

SELECT ENAME,
    SUBSTR(ENAME, 3)
FROM EMP;

SELECT SYSDATE,
    ADD_MONTHS(SYSDATE /*DATE*/,
                 6 /*INTEGER*/)
FROM DUAL;

SELECT EMPNO,
    ENAME,
    TO_CHAR(SAL * 12 + COMM, '$999,999') AS ANN_SAL
FROM EMP
WHERE ENAME = 'ALLEN';

SELECT EMPNO,
    ENAME,
    TO_CHAR(HIREDATE, 'YYYY/MM/DD') AS HIREDATE,
    TO_CHAR(SAL*12 + NVL(COMM, 0), '$999,999') AS ANN_SAL,
    TO_CHAR((SAL*12 + NVL(COMM, 0))*1.15, '$999,999') AS "15%UP"
FROM EMP
WHERE COMM IS NOT NULL;

SELECT TO_NUMBER('1,200', '999,999') - TO_NUMBER('700', '9,999')
FROM DUAL;

SELECT SYSDATE,
    TO_DATE('2022/11/30', 'YYYY/MM/DD'),
    TO_DATE('941130', 'RRMMDD')
FROM DUAL;

SELECT *
FROM EMP
WHERE HIREDATE > TO_DATE('19810601', 'YYYYMMDD');

SELECT NVL(COMM, 0),
    NVL2(COMM, 'O', 'X')
FROM EMP;

SELECT EMPNO,
    ENAME,
    COMM,
    NVL2(COMM, 'EXIST', 'NULL') AS NVL2
FROM EMP
WHERE DEPTNO=30;

SELECT NAME,
    JUMIN,
    DECODE(SUBSTR(JUMIN, 7, 1), 1, 'M', 'F') AS SEX
FROM STUDENT
WHERE DEPTNO1 = 101;

SELECT SUBSTR(TEL, 1, INSTR(TEL, ')') - 1) AS LOC_NUM,
    DECODE(SUBSTR(TEL, 1, INSTR(TEL, ')') - 1), 
        '02', 'SEOUL',
        '031', 'GYEONGGI',
        '051', 'BUSAN',
        '052', 'ULSAN',
        '053', 'DAEGU',
        '055', 'GYEONGNAM')
FROM STUDENT;

SELECT CASE SUBSTR(TEL, 1, INSTR(TEL, ')') - 1)
    WHEN '02' THEN 'SEOUL'
    ELSE 'ETC'
    END
FROM STUDENT;

-- P174 Q1
SELECT EMPNO,
    RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MASKING_EMPNO,
    ENAME,
    RPAD(SUBSTR(ENAME, 1, 1), 5, '*') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME) >= 5 AND LENGTH(ENAME) < 6;

-- P174 Q2
SELECT EMPNO,
    ENAME,
    SAL,
    TRUNC(SAL/21.5, 2) AS DAY_PAY,
    ROUND(SAL/21.5/8, 1) AS TIME_PAY
FROM EMP;

-- P175 Q3
SELECT EMPNO,
    ENAME,
    TO_CHAR(HIREDATE, 'YYYY/MM/DD') AS HIREDATE,
    TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), 'MON'), 'YYYY/MM/DD') AS R_JOB,
    NVL2(COMM, TO_CHAR(COMM), 'N/A') AS COMM
FROM EMP;

-- P175 Q4
SELECT EMPNO,
    ENAME,
    MGR,
    CASE 
        WHEN MGR IS NULL THEN 0000
        WHEN MGR BETWEEN 7500 AND 7599 THEN 5555        
        WHEN MGR BETWEEN 7600 AND 7699 THEN 6666        
        WHEN MGR BETWEEN 7700 AND 7799 THEN 7777        
        WHEN MGR BETWEEN 7800 AND 7899 THEN 8888        
        ELSE MGR
    END CHG_MGR
FROM EMP;

SELECT TEXT
FROM T_REG
WHERE REGEXP_LIKE(TEXT, '[a-z]')
;
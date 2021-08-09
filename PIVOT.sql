SELECT
    deptno,
    job,
    SUM(sal)
FROM
    emp
GROUP BY
    job,
    deptno;

--pivot

SELECT
    *
FROM
    (
        SELECT
            job,
            deptno,
            sal
        FROM
            emp
    ) PIVOT (
        SUM ( sal )
        FOR deptno
        IN ( 10,
        20,
        30 )
    )
ORDER BY
    job ASC;
--Pivot Column wise Quarter employees

SELECT TO_CHAR(HIREDATE,'Q') FROM EMP;
SELECT * FROM (SELECT EMPNO,TO_CHAR(HIREDATE,'Q') as qrt,TO_CHAR(HIREDATE,'YYYY') as year from emp)
PIVOT (COUNT(EMPNO) FOR qrt in (1,2,3,4)
)
order by year asc;

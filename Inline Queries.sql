--Display dept wise total salary 

SELECT d.dname,e.sumsal FROM (
SELECT SUM(SAL)AS SUMSAL,deptno  FROM EMP GROUP BY DEPTNO) e,dept d
where e.deptno=d.deptno;

--Display even number of records 
select * from (
SELECT ROWNUM AS RNO,EMPNO,ename,sal FROM EMP) E
where mod(e.rno,2)=0;

--Display top 5 salaries and their respective departments 
SELECT e.ename,e.sal,e.dname,e.rnk FROM 
(SELECT ee.ENAME,ee.SAL,DENSE_RANK() OVER(ORDER BY ee.SAL DESC) AS RNK,d.dname FROM EMP EE join dept d on ee.deptno=d.deptno) e
WHERE e.RNK<=5
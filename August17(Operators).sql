
/* Query to get all employees start with S*/
SELECT * FROM emp where ename like 'S%'

/* Query to get all employees end with S*/
SELECT * FROM emp where ename like '%S'

/*Query to display 'A' in 3rd position */
SELECT * from emp where ename like '__A%'

/*Query for 'E' is second character from last */
select * from emp where ename like '%E_'

/* Display employees joined in January month */
select * from emp where HIREDATE like '%JAN%'

/*Employees working as clerk , manager and earning btw 2000 and 5000 and joined in 1981 and not working for dept 10,20*/
select * from emp where 
JOB IN ('CLERK','MANAGER') 
AND 
SAL BETWEEN 2000 AND 5000 
AND 
hiredate like '%81'
AND
deptno not in (10,20)

/* Find employees where commisions are null or display employees who earn some commision*/
select * from emp where COMM is NULL






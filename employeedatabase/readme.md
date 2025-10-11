1. Query to find top 5 salaries?

```sql
SELECT empno as employeenumber,ename as employeename,sal as salary,ranked as salrank
from (SELECT empno, ename, sal, DENSE_RANK() OVER (ORDER BY SAL DESC) as ranked FROM employee) e
WHERE e.ranked between 1 and 5
```
2. Display employees who have same salaries?
```sql
SELECT e1.ename as employeename, e1.sal as employeesalary, e2.ename as secondemployee, e2.sal as secondemployeesalary
FROM employee e1, employee e2
where e1.sal = e2.sal and e1.empno < e2.empno;
```
3. Display employee records earning between 2000 and 5000?
```sql
SELECT * FROM EMPLOYEE 
WHERE SAL BETWEEN 2000 AND 5000;
```
4. Display employee records who are joined between 1981 year?
5. Display employee records who are not joined  in 2000 year ?


1. Query to find top 5 salaries?

```sql
SELECT empno as employeenumber,ename as employeename,sal as salary,ranked as salrank
from (SELECT empno, ename, sal, DENSE_RANK() OVER (ORDER BY SAL DESC) as ranked FROM employee) e
WHERE e.ranked between 1 and 5
```
2. Display employees who have same salaries?
3. Display employee records earning between 2000 and 5000?
4. Display employee records who are joined between 1981 year?
5. Display employee records who are not joined  in 2000 year ?


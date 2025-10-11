1. Query to find top 5 salaries?

```sql
SELECT empno as employeenumber,ename as employeename,sal as salary,ranked as salrank
from (SELECT empno, ename, sal, DENSE_RANK() OVER (ORDER BY SAL DESC) as ranked FROM employee) e
WHERE e.ranked between 1 and 5
```

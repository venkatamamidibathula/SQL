
**Joins**
---------

**LEFT OUTER JOIN**

```sql
SELECT S1.SID AS StudentID,S1.SNAME, A.CNAME, A.decision AS decision
from STUDENT S1 LEFT OUTER JOIN APPLY A USING(SID)
where decision is NULL
```



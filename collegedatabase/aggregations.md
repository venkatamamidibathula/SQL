**AggregationS**

Computations over values in multiple rows.

- min
- max
- sum
- avg
- count


GROUP BY : Allow us to parition results into groups and will perform aggregated functions over each group independently.

HAVING: Allows us to test filters on the results of aggregate values.
- This clause is applied after group by clause and its applied after grouping / grouped result set where as where clause is applied on one tuple at a time.

College, Student, Apply


1. Query to find average gpa of students who applied to major in 'CS'?

```sql

SELECT AVG(S.GPA)
FROM STUDENT S
WHERE S.SID IN (SELECT A.sid from apply a where a.major = 'CS')

```

2. Query to find the count of colleges where enrollment is greater than 15000?

```sql
SELECT COUNT(*)
FROM COLLEGE
WHERE ENROLLMENT > 15000
```

3. Query to find count of students who applied to cornell?

```sql
SELECT COUNT(DISTINCT SID)
FROM APPLY
WHERE CNAME = 'Cornell'
```

4. How much avg gpa of cs students exceeds noncs students gpa?

** we can write a subquery in select clause as long as it produces just a single value**

```sql

SELECT CSe.gpa - NONCS.gpa
fROM 
(SELECT AVG(S1.GPA) as gpa FROM student S1 JOIN Apply A USING(SID) where A.major = 'CS' ) CSe,
(SELECT AVG(S1.GPA) as gpa FROM student S1 JOIN Apply A USING(SID) where A.major <> 'CS') NONCS

```


*Below is the right query*
Explain me the difference why?
```sql

SELECT((SELECT AVG(S1.GPA) as gpa FROM student S1 JOIN Apply A USING(SID) where A.major = 'CS') - 
(SELECT AVG(S1.GPA) as gpa FROM student S1 JOIN Apply A USING(SID) where A.major <> 'CS')) 

```

```sql

SELECT((SELECT AVG(S1.GPA) as gpa FROM student S1 where S1.sid IN (SELECT A.sid from apply A where A.major = 'CS')) - 
(SELECT AVG(S1.GPA) as gpa FROM student S1 where S1.sid NOT IN (SELECT A.sid from apply A where A.major='CS')))

```

5. Query to find total applicants for each college?

```sql

SELECT COUNT(*), CNAME
FROM APPLY 
GROUP BY CNAME

```

6. College enrollments by state?

```sql
SELECT STATE, SUM(ENROLLMENT)
FROM COLLEGE
GROUP BY STATE
```

7. Query to find minimum and maximum gpa for each college and corresponding major?

```sql

SELECT cname, major, min(gpa),max(gpa)
from student join apply  using(sid)
group by cname,major

```

8. Find the largest spread of minimum and maximum gpa for each college and corresponding major?

```sql

LECT max(maxgpa-mingpa)
FROM (SELECT cname, major, min(gpa) as mingpa,max(gpa) as maxgpa
from student join apply  using(sid)
group by cname,major) MN

```

9. Query to find the number of colleges applied by each student?

```sql

SELECT S.SID, S.SNAME, COUNT(DISTINCT A.CNAME)
FROM STUDENT S JOIN APPLY A USING (sid)
GROUP BY S.SID

```
If i have to insert all records that have zero in applied.

```sql
SELECT S.SID, S.SNAME, COUNT(DISTINCT A.CNAME)
FROM STUDENT S LEFT JOIN APPLY A USING (sid)
GROUP BY S.SID
ORDER by S.SID
```

10. Colleges with fewer than 5 applications?

```sql

SELECT cname
from apply 
group by cname
having count(*) < 5

```

11. Colleges with fewer than 5 applicants?

```sql
SELECT cname
from apply 
group by cname
having count(DISTINCT sid) < 5
```

12. Majors whose applicants GPA is below average?
```sql
SELECT major
FROM STUDENT JOIN APPLY USING (SID)
group by major 
having max(gpa) < (SELECT AVG(GPA) FROM student)
```


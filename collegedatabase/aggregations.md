**AggregationS**

Computations over values in multiple rows.

- min
- max
- sum
- avg
- count


GROUP BY : Allow us to parition results into groups and will perform aggregated functions over each group independently.

HAVING: Allows us to test filters on the results of aggregate values.


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

```sql

SELECT((SELECT AVG(S1.GPA) as gpa FROM student S1 JOIN Apply A USING(SID) where A.major = 'CS') - 
(SELECT AVG(S1.GPA) as gpa FROM student S1 JOIN Apply A USING(SID) where A.major <> 'CS')) 

```

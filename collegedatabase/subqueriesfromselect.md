
- We can use subqueries in select and from clause of queries.

- Whenver we write a subquery in select clause it is absolutely critical that the subquery retruns exactly one value.

1. Query to find scaled gpa greater than 1?

```sql

SELECT * FROM (SELECT SID,sname,gpa,gpa*(sizehs/1000.0) as scaledgpa from student) g
where abs(G.scaledGPA-GPA)>1.0;

```

2. Colleges with highest GPA among their applicants?

```sql

SELECT
    C.cname,
    MAX(S.GPA) AS highest_gpa
FROM
    College C
JOIN
    Apply A ON C.cname = A.cname
JOIN
    Student S ON A.sid = S.sid
GROUP BY
    C.cname
ORDER BY
    highest_gpa DESC;

```



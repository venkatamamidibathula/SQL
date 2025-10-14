## Database Relationships

## Database Schema

### College Table
| Column     | Type        | Constraint |
|------------|-------------|------------|
| cname      | VARCHAR(50) | PRIMARY KEY|
| state      | CHAR(2)     |            |
| enrollment | INT         |            |

### Student Table
| Column | Type        | Constraint |
|--------|-------------|------------|
| sid    | INT         | PRIMARY KEY|
| sname  | VARCHAR(50) |            |
| GPA    | DECIMAL(2,1)|            |
| sizehs | INT         |            |

### Apply Table
| Column   | Type        | Constraint                        |
|----------|-------------|-----------------------------------|
| sid      | INT         | PRIMARY KEY, FOREIGN KEY → Student|
| cname    | VARCHAR(50) | PRIMARY KEY, FOREIGN KEY → College|
| major    | VARCHAR(50) | PRIMARY KEY                       |
| decision | CHAR(1)     |                                   |

**Composite Primary Key:** (sid, cname, major)

### Relationships

- **College** ──(1:N)──> **Apply**: One college receives many applications
- **Student** ──(1:N)──> **Apply**: One student submits many applications

---

1. Find all students who have applied to Computer Science in some college?
2. Write a query to find GPA of CS Applicants?

```sql
SELECT S.SID Studentid, S.SNAME as StudentName, S.GPA AS StudentGPA FROM STUDENT S
WHERE S.SID IN (SELECT A.SID FROM APPLY A WHERE A.MAJOR = 'CS' )
ORDER BY S.GPA DESC;
```
```sql
SELECT DISTINCT S.SID AS STUDENTID, S.SNAME AS StudentName, S.GPA AS StudentGPA FROM STUDENT S JOIN APPLY A
ON S.SID=A.SID
WHERE A.MAJOR = 'CS'
ORDER BY S.GPA DESC;
```

3. Find students who applied for Computer Science but not Electrical Engineering?
```sql
SELECT S.SID Studentid, S.SNAME as StudentName, S.GPA AS StudentGPA FROM STUDENT S
WHERE S.SID IN (SELECT A.SID FROM APPLY A WHERE A.MAJOR = 'CS') 
AND S.SID NOT IN (SELECT A.SID FROM APPLY A WHERE A.MAJOR='EE')
```
4. Find all colleges that have at least one other college in the same state?
5. Find the students with highest GPA?
```sql
SELECT STUDENTID, StudentName, StudentGpa, RANKED AS STUDENTRANK FROM 
(SELECT S.SID AS STUDENTID , S.GPA StudentGpa, S.SNAME StudentName, 
DENSE_RANK() OVER (ORDER BY S.GPA DESC) AS RANKED FROM STUDENT S ) NEWT
WHERE RANKED=1;
```
6. Find the student(s) with the 4th highest GPA?
```sql
SELECT STUDENTID, StudentName, StudentGpa, RANKED AS STUDENTRANK
FROM (SELECT S.SID AS STUDENTID , S.GPA StudentGpa, S.SNAME StudentName, 
DENSE_RANK() OVER (ORDER BY S.GPA DESC) AS RANKED FROM STUDENT S ) NEWT
WHERE RANKED=4;
```
7. Find the students who have not applied to any college?
```sql
SELECT S.SID AS STUDENTID, S.SNAME AS STUDENTNAME
FROM STUDENT S LEFT JOIN APPLY A 
ON S.SID = A.SID
WHERE A.MAJOR IS NULL
```
8. Query to find average gpa of students who applied to major in 'CS'?
```sql
SELECT AVG(S.GPA)
FROM STUDENT S 
WHERE S.SID in (SELECT A.SID FROM APPLY A WHERE A.MAJOR='CS')
```
9. Query to find the count of colleges where enrollment is greater than 15000?
```sql
SELECT COUNT(C.CNAME)
FROM COLLEGE C
WHERE C.enrollment>15000
```
10. Query to find count of students who applied to cornell?
11. How much avg gpa of cs students exceeds noncs students gpa?
12. Query to find total applicants for each college?
13. College enrollments by state?
14. Query to find minimum and maximum gpa for each college and corresponding major?
15. Find the largest spread of minimum and maximum gpa for each college and corresponding major?
16. Query to find the number of colleges applied by each student?
17. Colleges with fewer than 5 applications?
18. Colleges with fewer than 5 applicants?
19. Majors whose applicants GPA is below average?
20. Display the top 5 salaried employees?
21. Display employee records earning between 2000 and 5000?
22. Display employee records who are joined between 1981 year?
23. Display employee records who are not joined  in 2000 year ?
24. Display employees who have same salaries?
25. Display top 5 salaries in departnumber 20?
26. Employees who report to same manager?
27. How many employees report to each manager?
28. How does joins work?
    - They are actually cartesian product of two tables joined using a common column. A table with students applying to many colleges if u join them using sid you get 16x20=320 records back.

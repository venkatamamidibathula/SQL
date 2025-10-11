## Database Relationships

### Tables

| Table   | Primary Key           | Foreign Keys                    |
|---------|----------------------|----------------------------------|
| College | cname                | -                                |
| Student | sid                  | -                                |
| Apply   | (sid, cname, major)  | sid → Student(sid), cname → College(cname) |

### Relationships

- **College** ──(1:N)──> **Apply**: One college receives many applications
- **Student** ──(1:N)──> **Apply**: One student submits many applications



1. Find all students who have applied to Computer Science in some college?
2. Write a query to find GPA of CS Applicants?
3. Find students who applied for Computer Science but not Electrical Engineering?
4. Find all colleges that have at least one other college in the same state?
5. Find the students with highest GPA?
6. Find the student(s) with the 4th highest GPA?
7. Find the students who have not applied to any college?
8. Query to find average gpa of students who applied to major in 'CS'?
9. Query to find the count of colleges where enrollment is greater than 15000?
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

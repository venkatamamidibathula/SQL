## Database Schema

Assuming the following tables exist:

- `student(sid, sname, gpa)`
- `apply(sid, cname, major, decision)`
- `college(cname, state)`

---

## Query Examples & Explanations

### 1. Students Who Applied to Computer Science

**Question:**  
Find all students who have applied to Computer Science in some college.

**Method 1: Using IN with Subquery**
```sql
SELECT sid, sname
FROM student 
WHERE sid IN (SELECT sid FROM apply WHERE major = 'CS');
```
*Uses set membership check with IN clause.*

**Method 2: Using JOIN with DISTINCT**
```sql
SELECT DISTINCT s.sid, s.sname
FROM student s, apply a
WHERE s.sid = a.sid AND major = 'CS';
```
*Uses explicit join and DISTINCT to remove duplicates.*

---

### 2. GPA of CS Applicants

**Question:**  
Find the GPAs of students who applied for Computer Science major.

**Problem with JOIN approach:**
```sql
SELECT GPA 
FROM student, apply  
WHERE student.sid = apply.sid AND major = 'CS';
```
*This produces duplicates if students applied to multiple CS programs.*

**Recommended Solution (Subquery):**
```sql
SELECT s.gpa
FROM student s
WHERE s.sid IN (SELECT a.sid FROM apply a WHERE a.major = 'CS');
```
*Avoids duplicates by checking membership rather than joining.*

---

### 3. Exclusive CS Applicants

**Question:**  
Find students who applied for Computer Science but not Electrical Engineering.

```sql
SELECT s.sid, s.sname
FROM student s
WHERE s.sid IN (SELECT a.sid FROM apply a WHERE a.major = 'CS')
  AND NOT s.sid IN (SELECT a.sid FROM apply a WHERE a.major = 'EE');
```
*Uses set difference with NOT IN to exclude EE applicants.*

---

### 4. Colleges with Peers in Same State

**Question:**  
Find all colleges that have at least one other college in the same state.

```sql
SELECT c1.cname AS collegename, c1.state AS usstate
FROM college c1
WHERE EXISTS (
    SELECT * FROM college c2
    WHERE c2.state = c1.state AND c1.cname <> c2.cname
);
```
*Uses correlated subquery with EXISTS to find peers.*

---

### 5. Maximum GPA Query

**Question:**  
Find the student(s) with the highest GPA.

```sql
SELECT s.sname, s.gpa
FROM student s
WHERE s.gpa >= ALL (SELECT gpa FROM student);
```
*Uses ALL comparison operator to find maximum value.*

---

### 6. Nth Highest GPA

**Question:**  
Find the student(s) with the nth highest GPA.

```sql
SELECT sname, gpa
FROM (
    SELECT sname, gpa, 
           DENSE_RANK() OVER (ORDER BY gpa DESC) AS rank
    FROM student
) ranked
WHERE rank = 5;
```
*Uses window function DENSE_RANK() to handle ties properly.*

---

## Notes

- Use subqueries for accuracy when filtering.
- Prefer `EXISTS` for correlated checks.
- Use window functions for ranking and nth largest queries.
- Be mindful of duplicates when joining tables.

---

Review these queries and explanations to strengthen your SQL skills for interviews and practical database analysis!

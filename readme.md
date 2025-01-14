#######
**SQL**
#######


**Table Operators**

-- Get me the list of students who have same GPA
```sql
select S1.sid,s1.sname,s1.gpa,s2.sid,s2.sname,s2.gpa
from student s1, student s2
where s1.gpa=s2.gpa and s1.sid < s2.sid
```
Operators:

**UNION**: Eliminates duplicates.

**UNION ALL**: Retains duplicates including results.

**INTERSECT**: It gives intersection of two sets.

-- Get the list of students who applied for major in both "CS" AND "EE"
```sql
SELECT a.sid from apply a where a.major='EE'
INTERSECT
SELECT a.sid from apply a where a.major='CS'
```

-- students applied for major in cs and not ee
```sql
select a.sid from apply a where a.major='CS'
EXCEPT
select a.sid from apply a where a.major='EE'
```


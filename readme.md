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


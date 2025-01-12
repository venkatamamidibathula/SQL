- Query to obtain Students with GPA > 3.6
select SID, sname, GPA
FROM Student 
where GPA> 3.6

- Get the bunch of students and majors they applied for 
SELECT distinct sname, major 
from Student, Apply
where Student.sid=Apply.sid

- Find names,gpa of students whose size of high school is less than 1000 who applied for major in cs and at stanford and their decision(Students applied to CS in stanford from a small highscool)
SELECT sname, GPA, decision
from student, apply
where student.sid=apply.sid
and sizehs < 1000 and major = 'cs' and cname = 'stanford'


- Find all large campuses that have applied to its campus in CS

select distinct college.cname
from college, apply
where enrollment > 20000 and major = 'cs'

- Get the list of students with GPA descending
select Student.sid, sname, gpa, apply.cName, enrollment
from student,college,apply
where apply.sid=student.sid and apply.cname=college.cname
order by GPA desc, enrollment

- Get the list of students who applied for bio
SELECT sid,major
from apply 
where major like '%bio%';


- Get the list of students and their scaled gpa
select sid,sname,gpa,sizehs, gpa*(sizehs/1000.0) as scaledgpa
from student;


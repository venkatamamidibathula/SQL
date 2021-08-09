-- Find students greater than 3.6?

SELECT * FROM STUDENT WHERE GPA>3.6;
desc student;
desc college;
desc apply;

-- Find students and the majors they applied?

SELECT DISTINCT S.SID,a.major FROM STUDENT S,APPLY A
WHERE S.SID=A.SID ORDER BY S.SID;

-- Name and GPAS whose size less than 1000 and major is CS and college in stanford? (04:19)
	SELECT S.NAME,S.GPA
    FROM STUDENT S,College C, Apply A
    where S.SID = A.SID AND A.CNAME=C.CNAME AND S.SIZEHS<1000 AND A.MAJOR = 'CS' AND C.CNAME = 'Stanford';
	      
 -- Find students with major in biology?
 
 SELECT * FROM STUDENT S,APPLY A
 WHERE S.SID=A.SID AND A.MAJOR like '%biology%';
    
-- Find the cross product of student and college?

SELECT * FROM STUDENT S, COLLEGE C;
--Find the students with scaled GPA?

SELECT S.SID,S.NAME, S.GPA*(S.SIZEHS/1000) AS SCALEDGPA FROM STUDENT S
order by scaledgpa desc


-- Students with the same GPA?

SELECT S1.NAME,S1.SID,S2.SID,S2.NAME,S1.GPA,S2.GPA FROM STUDENT S1,STUDENT S2
WHERE S1.GPA=S2.GPA AND S1.SID<S2.SID


--	3. Find names of students with colleges they applied?(5.53)
--	4. Find ID's of students who applied for major in CS and EE?(6.52)

SELECT S1.SID,A2.NAME FROM APPLY S1,STUDENT A2 WHERE S1.MAJOR='CS' AND S1.SID = A2.SID
INTERSECT
SELECT S2.SID,A1.NAME FROM STUDENT A1,APPLY S2 WHERE S2.MAJOR ='EE' AND S2.SID=A1.SID

--Find students who applied for major in CS and not EE?(08:44)

SELECT S1.SID,A2.NAME FROM APPLY S1,STUDENT A2 WHERE S1.MAJOR='CS' AND S1.SID = A2.SID
EXCEPT
SELECT S2.SID,A1.NAME FROM STUDENT A1,APPLY S2 WHERE S2.MAJOR ='EE' AND S2.SID=A1.SID

--Find the average GPA of students who applied to major in CS
--Right Query
SELECT AVG(GPA) FROM STUDENT S WHERE S.SID IN (SELECT A.SID FROM Apply A where A.MAJOR = 'CS')

--Wrong Query
SELECT AVG(S.GPA) FROM STUDENT S,APPLY A
WHERE S.SID=A.SID AND A.MAJOR = 'CS'

--Find students who applied to major in CS and NOT EE?
SELECT S.SID,S.NAME FROM STUDENT S WHERE S.SID IN (SELECT A.SID FROM APPLY A WHERE A.MAJOR = 'CS')
and NOT S.SID IN (SELECT A.SID FROM APPLY A WHERE A.MAJOR = 'EE'); 

--Find all colleges which are in the same state
SELECT * FROM COLLEGE C1 
WHERE EXISTS (SELECT * FROM COLLEGE C2 WHERE C2.STATE=C1.STATE AND C2.CNAME<>C1.CNAME)
--Find colleges with highest enrollment?
SELECT * FROM COLLEGE C1
WHERE NOT EXISTS (SELECT * FROM COLLEGE C2 WHERE C2.ENROLLMENT>C1.ENROLLMENT)
--Find the student highest gpa
SELECT * FROM STUDENT S1
WHERE NOT EXISTS (SELECT * FROM STUDENT S2 WHERE S2.GPA>S1.GPA)

SELECT * FROM STUDENT S1
WHERE S1.GPA>=ALL(SELECT S2.GPA FROM STUDENT S2)



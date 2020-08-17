--Calculate the count of all grades in the system
select count(*)
from dbo.Grade

--Calculate the count of all grades per Teacher in the system
select TeacherID, count(*) as TotalGrade
from dbo.Grade
Group by TeacherID
--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
select TeacherID , count(*) as TotalGrade
from dbo.Grade g
Where StudentID<100
Group by TeacherId

select t.FirstName  + t.LastName as Teacher , count(*) as TotalGrade
from dbo.Grade g
INNER JOIN dbo.Teacher t on t.ID = g.TeacherID
WHERE g.StudentID < 100
GROUP BY t.FirstName , t.LastName

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
select*
from Grade
select*
from Student

select g.StudentID, s.[FirstName],
max(g.Grade) maxgrade, avg (g.Grade) averagegrade
from dbo.[Grade] as g
inner join dbo.Student as s on s.ID=g.StudentID
group by g.StudentID,s.[FirstName]

SELECT DISTINCT s.FirstName + N' ' + s.LastName as Student, 
MAX(g.Grade) as GradeMax, AVG(g.Grade) as GradeAvg
FROM dbo.Grade g
INNER JOIN dbo.Student s on s.ID = g.StudentID
GROUP BY s.FirstName , s.LastName



--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
select distinct t.ID,t.FirstName + t.LastName  as Teacher, count(*) as GradeTeacher
from dbo.Grade g
--INNER JOIN dbo.Teacher t on g.TeacherID = t.ID
inner join dbo.Teacher t on  t.ID=g.TeacherID
group by t.ID,t.FirstName, t.LastName
HAVING COUNT(*) > 200

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100) and filter teachers with more than 50 Grade count
select t.FirstName+ t.LastName as Teacher, count(*) as TotalGrade
from dbo.Grade g
INNER JOIN dbo.Teacher t on t.ID = g.TeacherID
Where g.StudentID<100
Group by  t.FirstName+ t.LastName 
Having COUNT(*) >50

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
select  s.[FirstName]+ s.LastName,max(g.Grade) as maxgrade, avg (g.Grade)as  averagegrade
from dbo.[Grade]  g
inner join dbo.Student  s on s.ID=g.StudentID
group by s.[FirstName],s.[LastName]
HAVING MAX(g.Grade) = AVG(g.Grade)

--List Student First Name and Last Name next to the other details from previous query
select  s.[FirstName] as FirstName, s.LastName as LastName,max(g.Grade) as maxgrade, avg (g.Grade)as  averagegrade
from dbo.[Grade]  g
inner join dbo.Student  s on s.ID=g.StudentID
group by s.[FirstName],s.[LastName]
HAVING MAX(g.Grade) = AVG(g.Grade)

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
create view dbo.vv_StudentGrades1
as 
select g.StudentID as StudentId  , count(g.Grade) as TotalGrade
from Grade g
group by g.StudentID
Go

select * from vv_StudentGrades1
order by TotalGrade desc
GO

--Change the view to show Student First and Last Names instead of StudentID​
alter view dbo.vv_StudentGrades1
as
select s.FirstName +  s.LastName as Student, count(g.Grade) as TotalGrade
from Grade g
inner join Student s on s.Id= g.StudentID
group by s.FirstName,s.LastName
Go

SELECT * 
FROM dbo.vv_StudentGrades1

--List all rows from view ordered by biggest Grade Count​
select * from vv_StudentGrades1
order by TotalGrade desc
GO

--Create new view (vv_StudentGradeDetails) that will List all Students (FirstName and LastName) and Count the courses he passed through the exam(Ispit)​
select*
from Grade

create view dbo.vv_StudentGradeDetails3
as 
select s.FirstName  +  s.LastName as Student,  count(g.CourseID) as PassedCourses
from Grade g
inner join Course c on c.ID = g.CourseID
inner join Student s on s.Id= g.StudentID
inner join GradeDetails gd on gd.GradeID = g.ID
inner join AchievementType a on a.ID = gd.AchievementTypeID
group by s.FirstName,s.LastName
Go

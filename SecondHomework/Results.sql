
--Find all Students with FirstName = Antonio​

Select *
from Student
Where FirstName= 'Antonio'

--Find all Students with DateOfBirth greater than ‘01.01.1999’​

Select*
from Student
Where DateOfBirth >'1999.01.01'

--Find all Male students​
Select*
from Student
Where Gender='M'

--Find all Students with LastName starting With ‘T’​
Select*
From Student
Where LastName like 'T%'

--Find all Students Enrolled in January/1998​

Select*
From Student
Where EnrolledDate >= '1998-01-01' AND EnrolledDate < '1998-02-01'

--Find all Students with LastName starting With ‘J’ enrolled in January/1998
Select*
From Student
WHERE EnrolledDate >= '1998-01-01' and EnrolledDate < '1998-02-01' and LastName LIKE 'J%'

--Find all Students with FirstName = Antonio ordered by Last Name​

Select*
From Student 
Where FirstName='Antonio'
Order By LastName

--List all Students ordered by FirstName​
Select*
From Student
Order by FirstName

--Find all Male students ordered by EnrolledDate, starting from the last enrolled
Select*
From Student
Where Gender='M'
Order by EnrolledDate Desc

--List all Teacher First Names and Student First Names in single result set with duplicates​
Select FirstName
From dbo.Teacher
Union All
Select FirstName
From dbo.Student
Go

--List all Teacher Last Names and Student Last Names in single result set. Remove duplicates​
Select LastName
From dbo.Teacher
Union 
Select  LastName
From dbo.Student
Go
--List all common First Names for Teachers and Students​
Select FirstName
From dbo.Teacher
Intersect
Select FirstName
From dbo.Student
Go

--Change GradeDetails table always to insert value 100 in AchievementMaxPoints column if no value is provided on insert​
alter table GradeDetails
add constraint  [Grade_Details_Point]
default 100 for [AchievementMaxPoints]
Go

--Change GradeDetails table to prevent inserting AchievementPoints that will more than AchievementMaxPoints​
alter table GradeDetails  with Check
add constraint  [GradeDetails_AchievementPoint]
Check (AchievementPoints<=AchievementMaxPoints​)
Go

--Change AchievementType table to guarantee unique names across the Achievement types


alter table  AchievementType with Check
add constraint [AchievementType_Names] 
Unique (Name) 


--Create Foreign key constraints from diagram or with script​
--With Diagram
--List all possible combinations of Courses names and AchievementType names that can be passed by student​
Select*
From Course
Select*
From AchievementType

Select c.Name as CourseName, a.Name as AchievementTypeName
from Course c
Cross join AchievementType a

--List all Teachers that has any exam Grade​
Select*
From Teacher
Select*
From Grade

Select distinct t.FirstName as Teacher
FROM Grade g
Inner join Teacher t on g.TeacherID = t.ID

--List all Teachers without exam Grade​
Select distinct t.FirstName as Teacher
From Teacher t
left join Grade g on t.ID=g.TeacherID
WHERE g.ID is NULL

--List all Students without exam Grade (using Right Join)
SELECT distinct s.FirstName 
from Grade g
Right join Student s on s.ID = g.StudentID
where g.StudentID is NULL
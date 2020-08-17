--Declare scalar variable for storing FirstName values 
--Assign value ‘Antonio’ to the FirstName variable
--Find all Students having FirstName same as the variable

DECLARE @FirstName nvarchar(100)
set @FirstName = 'Antonio'

SELECT *
FROM dbo.Student
WHERE FirstName = @FirstName
GO

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
--Fill the table variable with all Female students

declare @student table 
(
StudentID int, 
FirstName NVARCHAR(100), 
DateOfBirth date);

INSERT INTO @student (StudentID, FirstName, DateOfBirth)
SELECT ID, FirstName, DateOfBirth
FROM dbo.Student
WHERE Gender = 'F'

select * from @student
GO

--Declare temp table that will contain LastName and EnrolledDate columns
--Fill the temp table with all Male students having First Name starting with ‘A’
--Retrieve the students from the table which last name is with 7 characters
select*
from Student
CREATE TABLE #NewTable111
(LastName NVARCHAR(100), EnrolledDate date);

INSERT INTO #NewTable111
SELECT LastName, EnrolledDate 
from dbo.Student
WHERE Gender = 'M' AND FirstName LIKE 'A%'

SELECT * 
FROM #NewTable111
where Len(LastName) = 7

drop table #NewTable111
GO


--Find all teachers whose FirstName length is less than 5 and
--the first 3 characters of their FirstName and LastName are the same

select *
from dbo.Teacher
where len(FirstName)<5 and SUBSTRING(FirstName, 1, 3) = SUBSTRING(LastName, 1, 3)


--Declare scalar function (fn_FormatStudentName) for retrieving the Student description for specific StudentId in the following format:
--StudentCardNumber without “sc-”
--“ – “
--First character of student FirstName
--“.”
--Student LastName

CREATE FUNCTION dbo.fn_FormatStudentName (@StudentId int)
RETURNS NVARCHAR(100)
AS
BEGIN

declare @result nvarchar(100)
SELECT  @result = REPLACE(StudentCardNumber, 'sc-', '') + ' - ' + LEFT(FirstName, 1) + '.' + LastName
FROM dbo.Student
WHERE ID = @StudentId

RETURN @result
END

GO

SELECT *, dbo.fn_FormatStudentName(ID) as StudentFunc
FROM dbo.Student

--Create Table [Dbo].[Student](
--[Id] [int] Identity( 1,1) not null,
--[FirstName] [nvarchar] (100) not null,
--[LastName] [nvarchar] (100) not null,
--[DateOfBirth] [date]  null,
--[EnrolledDate] [date]  null,
--[Gender] [nchar]  null,
--[NationalIdNumber] [nvarchar](20) NULL,
--[StudentCardNumber] [smallint] not null,
--  CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
--(
--[Id] ASC
--))



--Create Table [Dbo].[Teacher](
--[Id] [smallint] Identity( 1,1) not null,
--[FirstName] [nvarchar] (50) not null,
--[LastName] [nvarchar] (50) not null,
--[DateOfBirth] [date] not null,
--[AcademicRank]  [nvarchar](20)not  null,
--[HireDate] [date] not null
--  CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
--(
--[Id] ASC
--))

--Create Table [Dbo].[Grade](
--[Id] [int]  Identity( 1,1) not null,
--[StudentId] [int]  not null,
--[CourseId] [smallint]  not null,
--[TeacherId] [smallint]not null,
--[Grade] [smallint] not null,
--[Comment] [nvarchar] (max) null,
--[CreatedDate] [date] not null
--  CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
--(
--[Id] ASC
--))

--Create Table [Dbo].[GradeDetails](
--[Id] [int] Identity( 1,1)  not null,
--[GradeId] [smallint] not null,
--[AchievementTypeId] [smallint]  not null,
--[AchievementPoints] [smallint]not null,
--[AchievementMaxPoints] [smallint]not null,
--[AchievementDate] [date] not null
--  CONSTRAINT [PK_GradeDetails] PRIMARY KEY CLUSTERED 
--(
--[Id] ASC
--))



--Create Table [Dbo].[Course](
--[Id] [int] Identity( 1,1)  not null,
--[Name] [nvarchar] (50) not null,
--[Credit] [smallint] not null,
--[AcademicYear] [date] not null,
--[Semester] [smallint] not null,
--  CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
--(
--[Id] ASC
--))


--Create Table [Dbo].[AchievementType](
--[Id] [int] Identity( 1,1)  not null,
--[Name] [nvarchar] (50) not null,
--[Description] [nvarchar] (max) null,
--[ParticipationRate] [smallint],
--  CONSTRAINT [PK_AchievementType] PRIMARY KEY CLUSTERED 
--(
--[Id] ASC
--))



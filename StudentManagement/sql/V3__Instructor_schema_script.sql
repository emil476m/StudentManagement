USE master;

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'StudentManagementDB')
BEGIN
    CREATE DATABASE StudentManagementDB;
END;

GO

USE StudentManagementDB

--Creates Student Table

IF OBJECT_ID('Student', 'U') IS NULL
BEGIN
CREATE TABLE Student
(
    Id             Integer          NOT NULL IDENTITY(1,1) ,
    Firstname      nvarchar(250)    NOT NULL,
    LastName       nvarchar(250)    NOT NULL,
    MiddleName     nvarchar(100)    NOT NULL,
    Email          nvarchar(250)    NOT NULL,
    EnrollmentDate Date             NOT NULL,
    PRIMARY KEY (Id)
)
END

ELSE

IF COL_LENGTH('Student', 'Firstname') IS NULL
BEGIN
ALTER TABLE Student
    Add MiddleName nvarchar(100) NOT NULL;
END

IF COL_LENGTH('Student', 'DateOfBirth') IS NULL
BEGIN
ALTER TABLE Student
    Add DateOfBirth DATETIME NOT NULL DEFAULT '0001-01-01';
END

--Creates Instructor Table

IF OBJECT_ID('Instructor', 'U') IS NULL
BEGIN
CREATE TABLE Instructor
(
    Id             Integer          NOT NULL IDENTITY(1,1),
    Firstname      nvarchar(250)    NOT NULL,
    LastName       nvarchar(250)    NOT NULL,
    Email          nvarchar(250)    NOT NULL,
    HireDate       Date             NOT NULL,
    PRIMARY KEY (Id)
)
END

--Creates Course Table

IF OBJECT_ID('Course', 'U') IS NULL
BEGIN
CREATE TABLE Course
(
    Id             Integer          IDENTITY(1,1) NOT NULL,
    Title          nvarchar(250)    NOT NULL,
    Credits        DECIMAL(5,2)     NOT NULL,
    InstructorId   INTEGER          NOT NULL,
    PRIMARY KEY (Id),
    FOREIGN KEY (InstructorId) REFERENCES  Instructor(Id),
)
END

ELSE

IF COL_LENGTH('Course', 'InstructorId') IS NULL
BEGIN
ALTER TABLE Course
    Add InstructorId   INTEGER          NOT NULL,
    FOREIGN KEY (InstructorId) REFERENCES Instructor(Id);
END

--Creates Enrollment Table

IF OBJECT_ID('Enrollment', 'U') IS NULL
BEGIN
CREATE TABLE Enrollment
(
    Id             Integer            IDENTITY(1,1) NOT NULL UNIQUE ,
    StudentID      INTEGER            NOT NULL,
    CourseID       INTEGER            NOT NULL,
    Grade          nvarchar(10)       NOT NULL,
    PRIMARY KEY (Id),
    FOREIGN KEY (StudentID) REFERENCES Student(Id),
    FOREIGN KEY (CourseID) REFERENCES  Course(Id),

)
END

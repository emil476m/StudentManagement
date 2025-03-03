USE master;

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'StudentManagementDB')
BEGIN
    CREATE DATABASE StudentManagementDB;
END;

GO

USE StudentManagementDB


IF OBJECT_ID('Student', 'U') IS NULL
BEGIN
CREATE TABLE Student
(
    Id             Integer          IDENTITY(1,1) NOT NULL,
    Firstname      nvarchar(250)    NOT NULL,
    LastName       nvarchar(250)    NOT NULL,
    Email          nvarchar(250)    NOT NULL,
    EnrollmentDate Date             NOT NULL,
    PRIMARY KEY (Id)
)
END

IF OBJECT_ID('Course', 'U') IS NULL
BEGIN
CREATE TABLE Course
(
    Id             Integer          IDENTITY(1,1) NOT NULL,
    Title          nvarchar(250)    NOT NULL,
    Credits        DECIMAL(5,2)     NOT NULL,
    PRIMARY KEY (Id)
)
END

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


CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" TEXT NOT NULL CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY,
    "ProductVersion" TEXT NOT NULL
);

BEGIN TRANSACTION;
CREATE TABLE "Courses" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Courses" PRIMARY KEY AUTOINCREMENT,
    "Title" TEXT NOT NULL,
    "Credits" REAL NOT NULL
);

CREATE TABLE "Students" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Students" PRIMARY KEY AUTOINCREMENT,
    "FirstName" TEXT NOT NULL,
    "LastName" TEXT NOT NULL,
    "Email" TEXT NOT NULL,
    "EnrollmentDate" TEXT NOT NULL
);

CREATE TABLE "Enrollments" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Enrollments" PRIMARY KEY AUTOINCREMENT,
    "StudentId" INTEGER NOT NULL,
    "CourseId" INTEGER NOT NULL,
    "Grade" TEXT NOT NULL,
    CONSTRAINT "FK_Enrollments_Courses_CourseId" FOREIGN KEY ("CourseId") REFERENCES "Courses" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_Enrollments_Students_StudentId" FOREIGN KEY ("StudentId") REFERENCES "Students" ("Id") ON DELETE CASCADE
);

CREATE INDEX "IX_Enrollments_CourseId" ON "Enrollments" ("CourseId");

CREATE INDEX "IX_Enrollments_StudentId" ON "Enrollments" ("StudentId");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250224123258_V0__InitialCreate', '9.0.2');

COMMIT;


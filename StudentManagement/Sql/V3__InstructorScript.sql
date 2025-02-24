BEGIN TRANSACTION;
ALTER TABLE "Courses" ADD "InstructorId" INTEGER NOT NULL DEFAULT 0;

CREATE TABLE "Instructors" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Instructors" PRIMARY KEY AUTOINCREMENT,
    "FirstName" TEXT NOT NULL,
    "LastName" TEXT NOT NULL,
    "Email" TEXT NOT NULL,
    "HireDate" TEXT NOT NULL
);

CREATE INDEX "IX_Courses_InstructorId" ON "Courses" ("InstructorId");

CREATE TABLE "ef_temp_Courses" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Courses" PRIMARY KEY AUTOINCREMENT,
    "Credits" REAL NOT NULL,
    "InstructorId" INTEGER NOT NULL,
    "Title" TEXT NOT NULL,
    CONSTRAINT "FK_Courses_Instructors_InstructorId" FOREIGN KEY ("InstructorId") REFERENCES "Instructors" ("Id") ON DELETE CASCADE
);

INSERT INTO "ef_temp_Courses" ("Id", "Credits", "InstructorId", "Title")
SELECT "Id", "Credits", "InstructorId", "Title"
FROM "Courses";

COMMIT;

PRAGMA foreign_keys = 0;

BEGIN TRANSACTION;
DROP TABLE "Courses";

ALTER TABLE "ef_temp_Courses" RENAME TO "Courses";

COMMIT;

PRAGMA foreign_keys = 1;

BEGIN TRANSACTION;
CREATE INDEX "IX_Courses_InstructorId" ON "Courses" ("InstructorId");

COMMIT;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250224131122_V3__Instructor', '9.0.2');


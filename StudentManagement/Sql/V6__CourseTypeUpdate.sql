BEGIN TRANSACTION;
CREATE TABLE "ef_temp_Courses" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Courses" PRIMARY KEY AUTOINCREMENT,
    "Credits" INTEGER NOT NULL,
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
VALUES ('20250227123725_V6__courseTypeUpdate', '9.0.2');


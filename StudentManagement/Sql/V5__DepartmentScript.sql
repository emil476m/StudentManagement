BEGIN TRANSACTION;
CREATE TABLE "Departments" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Departments" PRIMARY KEY AUTOINCREMENT,
    "Name" TEXT NOT NULL,
    "Budget" REAL NOT NULL,
    "StartDate" TEXT NOT NULL,
    "DepartmentHeadId" INTEGER NOT NULL,
    CONSTRAINT "FK_Departments_Instructors_DepartmentHeadId" FOREIGN KEY ("DepartmentHeadId") REFERENCES "Instructors" ("Id") ON DELETE CASCADE
);

CREATE INDEX "IX_Departments_DepartmentHeadId" ON "Departments" ("DepartmentHeadId");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250227121430_V5__Department', '9.0.2');

COMMIT;


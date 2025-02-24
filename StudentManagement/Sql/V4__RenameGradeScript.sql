BEGIN TRANSACTION;
ALTER TABLE "Enrollments" RENAME COLUMN "Grade" TO "FinalGrade";

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250224133305_V4__renameGrade', '9.0.2');

COMMIT;


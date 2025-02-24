BEGIN TRANSACTION;
ALTER TABLE "Students" ADD "MiddleName" TEXT NOT NULL DEFAULT '';

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250224125254_V1__MiddleName', '9.0.2');

COMMIT;


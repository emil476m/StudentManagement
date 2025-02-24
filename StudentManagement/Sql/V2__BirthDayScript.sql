BEGIN TRANSACTION;
ALTER TABLE "Students" ADD "DateOfBirth" TEXT NOT NULL DEFAULT '0001-01-01';

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250224130146_V2__BirthDay', '9.0.2');

COMMIT;


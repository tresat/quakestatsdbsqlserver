IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'DataProcedures')
EXEC sys.sp_executesql N'CREATE SCHEMA [DataProcedures] AUTHORIZATION [dbo]'
GO
GRANT EXECUTE ON SCHEMA::[DataProcedures] TO [public]
GO

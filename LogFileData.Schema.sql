IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'LogFileData')
EXEC sys.sp_executesql N'CREATE SCHEMA [LogFileData] AUTHORIZATION [dbo]'
GO

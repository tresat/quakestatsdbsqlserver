IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'CalculatedData')
EXEC sys.sp_executesql N'CREATE SCHEMA [CalculatedData] AUTHORIZATION [dbo]'
GO

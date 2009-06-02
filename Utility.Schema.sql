IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Utility')
EXEC sys.sp_executesql N'CREATE SCHEMA [Utility] AUTHORIZATION [dbo]'
GO

/****** Object:  Schema [LogFileData]    Script Date: 03/22/2009 17:07:47 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'LogFileData')
EXEC sys.sp_executesql N'CREATE SCHEMA [LogFileData] AUTHORIZATION [dbo]'
GO

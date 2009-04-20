/****** Object:  Schema [LogFileData]    Script Date: 04/19/2009 22:46:55 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'LogFileData')
EXEC sys.sp_executesql N'CREATE SCHEMA [LogFileData] AUTHORIZATION [dbo]'
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'LogFileData')
EXEC sys.sp_executesql N'CREATE SCHEMA [LogFileData] AUTHORIZATION [dbo]'
GO

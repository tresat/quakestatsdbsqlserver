/****** Object:  Schema [CalculatedData]    Script Date: 03/22/2009 17:07:47 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'CalculatedData')
EXEC sys.sp_executesql N'CREATE SCHEMA [CalculatedData] AUTHORIZATION [dbo]'
GO

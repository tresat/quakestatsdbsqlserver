/****** Object:  Schema [GridProcedures]    Script Date: 04/19/2009 22:46:55 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'GridProcedures')
EXEC sys.sp_executesql N'CREATE SCHEMA [GridProcedures] AUTHORIZATION [dbo]'
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'GridProcedures')
EXEC sys.sp_executesql N'CREATE SCHEMA [GridProcedures] AUTHORIZATION [dbo]'
GO

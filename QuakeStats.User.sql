USE [QuakeStats]
GO
/****** Object:  User [QuakeStats]    Script Date: 04/19/2009 22:46:55 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'QuakeStats')
CREATE USER [QuakeStats] FOR LOGIN [QuakeStats] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [QuakeStats]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'QuakeStats')
CREATE USER [QuakeStats] FOR LOGIN [QuakeStats] WITH DEFAULT_SCHEMA=[dbo]
GO

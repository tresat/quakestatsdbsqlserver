USE [QuakeStats]
GO
/****** Object:  User [QuakeStats]    Script Date: 03/22/2009 17:07:47 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'QuakeStats')
CREATE USER [QuakeStats] FOR LOGIN [QuakeStats] WITH DEFAULT_SCHEMA=[dbo]
GO

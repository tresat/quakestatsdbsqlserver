USE [QuakeStats]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'QuakeStats')
CREATE USER [QuakeStats] FOR LOGIN [QuakeStats] WITH DEFAULT_SCHEMA=[dbo]
GO

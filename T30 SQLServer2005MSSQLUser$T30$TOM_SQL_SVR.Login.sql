/****** Object:  Login [T30\SQLServer2005MSSQLUser$T30$TOM_SQL_SVR]    Script Date: 03/22/2009 17:07:47 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'T30\SQLServer2005MSSQLUser$T30$TOM_SQL_SVR')
CREATE LOGIN [T30\SQLServer2005MSSQLUser$T30$TOM_SQL_SVR] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO

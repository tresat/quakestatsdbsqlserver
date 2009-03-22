/****** Object:  Login [T30\ASPNET]    Script Date: 03/22/2009 17:07:47 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'T30\ASPNET')
CREATE LOGIN [T30\ASPNET] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO

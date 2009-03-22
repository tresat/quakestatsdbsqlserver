/****** Object:  Login [T30\Tom]    Script Date: 03/22/2009 17:07:47 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'T30\Tom')
CREATE LOGIN [T30\Tom] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO

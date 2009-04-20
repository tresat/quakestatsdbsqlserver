/****** Object:  Login [QuakeStats]    Script Date: 04/19/2009 22:46:54 ******/
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'QuakeStats')
CREATE LOGIN [QuakeStats] WITH PASSWORD=N'f¬¿≥c[c◊ÊYπk{¿?∂>ı?Ó	)?>¯?`', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [QuakeStats] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'QuakeStats')
CREATE LOGIN [QuakeStats] WITH PASSWORD=N'?ﬂÀÔÅ⁄≥en?I£l8e);»^?l%?/?˜t»b%', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [QuakeStats] DISABLE
GO

/****** Object:  Login [QuakeStats]    Script Date: 03/22/2009 17:07:47 ******/
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'QuakeStats')
CREATE LOGIN [QuakeStats] WITH PASSWORD=N'Vkë¦|²çzÙ~?, ºaJ2]³+yú.è&Ã£&ê¤', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [QuakeStats] DISABLE
GO

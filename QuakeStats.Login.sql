/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'QuakeStats')
CREATE LOGIN [QuakeStats] WITH PASSWORD=N'?Ì˚v√≈ÍQŸŒÙ˙8∞„ÁFU¶sy??§7ﬂÔ‰1]', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [QuakeStats] DISABLE
GO

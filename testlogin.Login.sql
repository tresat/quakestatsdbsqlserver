/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'testlogin')
CREATE LOGIN [testlogin] WITH PASSWORD=N'‰Jæ?‡
∂çydmlE ≈‰-JnB˜ùˆHùÙπ«R', DEFAULT_DATABASE=[tempdb], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [testlogin] DISABLE
GO

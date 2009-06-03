/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'testlogin')
CREATE LOGIN [testlogin] WITH PASSWORD=N'dùT?›WbﬂÅÌ
º=Ï∏?€‰ı?o∞ø”z∑??€', DEFAULT_DATABASE=[tempdb], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [testlogin] DISABLE
GO

/****** Object:  Login [testlogin]    Script Date: 04/19/2009 22:46:52 ******/
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'testlogin')
CREATE LOGIN [testlogin] WITH PASSWORD=N'¥˜‡¢®?Oπ≈{•¸Ø?Ù¨Pp?3d]?Wgcµ4', DEFAULT_DATABASE=[tempdb], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [testlogin] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'testlogin')
CREATE LOGIN [testlogin] WITH PASSWORD=N'≈ÀèÆx∏z?‰&?x?ﬂˆLfo?’&#?bÁ™', DEFAULT_DATABASE=[tempdb], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [testlogin] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'testlogin')
CREATE LOGIN [testlogin] WITH PASSWORD=N'?M]µØ—Ó§ÎT‡/◊%Áﬂ?9?&\—Ωf˜?‰!9', DEFAULT_DATABASE=[tempdb], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [testlogin] DISABLE
GO

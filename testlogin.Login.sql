/****** Object:  Login [testlogin]    Script Date: 04/19/2009 22:46:52 ******/
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'testlogin')
CREATE LOGIN [testlogin] WITH PASSWORD=N'����?O��{���?��Pp?3d]?Wgc�4', DEFAULT_DATABASE=[tempdb], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [testlogin] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'testlogin')
CREATE LOGIN [testlogin] WITH PASSWORD=N'�ˏ�x��z?�&?x?��Lfo?�&#?b�', DEFAULT_DATABASE=[tempdb], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [testlogin] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'testlogin')
CREATE LOGIN [testlogin] WITH PASSWORD=N'?M]�����T�/�%��?9?&\ѽf�?�!9', DEFAULT_DATABASE=[tempdb], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [testlogin] DISABLE
GO

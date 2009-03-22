/****** Object:  Schema [SiteData]    Script Date: 03/22/2009 17:07:47 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'SiteData')
EXEC sys.sp_executesql N'CREATE SCHEMA [SiteData] AUTHORIZATION [dbo]'
GO

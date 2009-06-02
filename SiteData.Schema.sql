IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'SiteData')
EXEC sys.sp_executesql N'CREATE SCHEMA [SiteData] AUTHORIZATION [dbo]'
GO

USE [master]
GO
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'QuakeStats')
BEGIN
CREATE DATABASE [QuakeStats] ON  PRIMARY 
( NAME = N'QuakeStats', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\QuakeStats.mdf' , SIZE = 53120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [CALCULATED_DATA] 
( NAME = N'QuakeStats_CalculatedData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\QuakeStats_CalculatedData.ndf' , SIZE = 103424KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [GAMES_LOG_DATA] 
( NAME = N'QuakesStats_GamesLogData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\QuakesStats_GamesLogData.ndf' , SIZE = 102400KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [SITE_DATA] 
( NAME = N'QuakeStats_SiteData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\QuakeStats_SiteData.ndf' , SIZE = 102400KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuakeStats_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\QuakeStats_log.ldf' , SIZE = 4224KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
EXEC dbo.sp_dbcmptlevel @dbname=N'QuakeStats', @new_cmptlevel=90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuakeStats].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [QuakeStats] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [QuakeStats] SET ANSI_NULLS OFF
GO
ALTER DATABASE [QuakeStats] SET ANSI_PADDING OFF
GO
ALTER DATABASE [QuakeStats] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [QuakeStats] SET ARITHABORT OFF
GO
ALTER DATABASE [QuakeStats] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [QuakeStats] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [QuakeStats] SET AUTO_SHRINK ON
GO
ALTER DATABASE [QuakeStats] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [QuakeStats] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [QuakeStats] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [QuakeStats] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [QuakeStats] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [QuakeStats] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [QuakeStats] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [QuakeStats] SET  ENABLE_BROKER
GO
ALTER DATABASE [QuakeStats] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [QuakeStats] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [QuakeStats] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [QuakeStats] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [QuakeStats] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [QuakeStats] SET  READ_WRITE
GO
ALTER DATABASE [QuakeStats] SET RECOVERY FULL
GO
ALTER DATABASE [QuakeStats] SET  MULTI_USER
GO
ALTER DATABASE [QuakeStats] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [QuakeStats] SET DB_CHAINING OFF
GO
GRANT CONNECT TO [QuakeStats]
GO

/****** Object:  Table [LogFileData].[KillLine]    Script Date: 04/19/2009 22:48:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[LogFileData].[KillLine]') AND type in (N'U'))
BEGIN
CREATE TABLE [LogFileData].[KillLine](
	[LineNumber] [int] NOT NULL,
	[Timestamp] [LogFileData].[udtLogTimestamp] NOT NULL,
	[KillerLogID] [int] NOT NULL,
	[VictimLogID] [int] NOT NULL,
	[WeaponLogID] [int] NOT NULL,
	[KillerName] [varchar](255) NOT NULL,
	[VictimName] [varchar](255) NOT NULL,
	[WeaponName] [varchar](255) NOT NULL,
 CONSTRAINT [PK_KillLine] PRIMARY KEY CLUSTERED 
(
	[LineNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [GAMES_LOG_DATA]
) ON [GAMES_LOG_DATA]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[LogFileData].[KillLine]') AND type in (N'U'))
BEGIN
CREATE TABLE [LogFileData].[KillLine](
	[LineNumber] [int] NOT NULL,
	[Timestamp] [LogFileData].[udtLogTimestamp] NOT NULL,
	[KillerLogID] [int] NOT NULL,
	[VictimLogID] [int] NOT NULL,
	[WeaponLogID] [int] NOT NULL,
	[KillerName] [varchar](255) NOT NULL,
	[VictimName] [varchar](255) NOT NULL,
	[WeaponName] [varchar](255) NOT NULL,
 CONSTRAINT [PK_KillLine] PRIMARY KEY CLUSTERED 
(
	[LineNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [GAMES_LOG_DATA]
) ON [GAMES_LOG_DATA]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[LogFileData].[KillLine]') AND type in (N'U'))
BEGIN
CREATE TABLE [LogFileData].[KillLine](
	[LineNumber] [int] NOT NULL,
	[Timestamp] [LogFileData].[udtLogTimestamp] NOT NULL,
	[KillerLogID] [int] NOT NULL,
	[VictimLogID] [int] NOT NULL,
	[WeaponLogID] [int] NOT NULL,
	[KillerName] [varchar](255) NOT NULL,
	[VictimName] [varchar](255) NOT NULL,
	[WeaponName] [varchar](255) NOT NULL,
 CONSTRAINT [PK_KillLine] PRIMARY KEY CLUSTERED 
(
	[LineNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [GAMES_LOG_DATA]
) ON [GAMES_LOG_DATA]
END
GO
SET ANSI_PADDING OFF
GO

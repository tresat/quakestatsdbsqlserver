/****** Object:  Table [LogFileData].[KillLine]    Script Date: 03/20/2009 07:48:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [LogFileData].[GameDelimiterLine]    Script Date: 04/19/2009 22:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[LogFileData].[GameDelimiterLine]') AND type in (N'U'))
BEGIN
CREATE TABLE [LogFileData].[GameDelimiterLine](
	[LineNumber] [int] NOT NULL,
	[Timestamp] [LogFileData].[udtLogTimestamp] NOT NULL,
	[IsFirstLineInUppage] [bit] NOT NULL CONSTRAINT [DF_GameDelimiterLine_IsFirstLineInUppage]  DEFAULT ((0)),
 CONSTRAINT [PK_GameDelimiterLine] PRIMARY KEY CLUSTERED 
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
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[LogFileData].[GameDelimiterLine]') AND type in (N'U'))
BEGIN
CREATE TABLE [LogFileData].[GameDelimiterLine](
	[LineNumber] [int] NOT NULL,
	[Timestamp] [LogFileData].[udtLogTimestamp] NOT NULL,
	[IsFirstLineInUppage] [bit] NOT NULL CONSTRAINT [DF_GameDelimiterLine_IsFirstLineInUppage]  DEFAULT ((0)),
 CONSTRAINT [PK_GameDelimiterLine] PRIMARY KEY CLUSTERED 
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
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[LogFileData].[GameDelimiterLine]') AND type in (N'U'))
BEGIN
CREATE TABLE [LogFileData].[GameDelimiterLine](
	[LineNumber] [int] NOT NULL,
	[Timestamp] [LogFileData].[udtLogTimestamp] NOT NULL,
	[IsFirstLineInUppage] [bit] NOT NULL CONSTRAINT [DF_GameDelimiterLine_IsFirstLineInUppage]  DEFAULT ((0)),
 CONSTRAINT [PK_GameDelimiterLine] PRIMARY KEY CLUSTERED 
(
	[LineNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [GAMES_LOG_DATA]
) ON [GAMES_LOG_DATA]
END
GO
SET ANSI_PADDING OFF
GO

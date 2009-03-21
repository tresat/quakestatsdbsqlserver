/****** Object:  Table [LogFileData].[GameDelimiterLine]    Script Date: 03/20/2009 07:48:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [LogFileData].[GameDelimiterLine](
	[LineNumber] [int] NOT NULL,
	[Timestamp] [LogFileData].[udtLogTimestamp] NOT NULL,
	[IsFirstLineInUppage] [bit] NOT NULL CONSTRAINT [DF_GameDelimiterLine_IsFirstLineInUppage]  DEFAULT ((0)),
 CONSTRAINT [PK_GameDelimiterLine] PRIMARY KEY CLUSTERED 
(
	[LineNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [GAMES_LOG_DATA]
) ON [GAMES_LOG_DATA]
GO
SET ANSI_PADDING OFF
GO

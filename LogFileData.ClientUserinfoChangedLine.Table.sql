/****** Object:  Table [LogFileData].[ClientUserinfoChangedLine]    Script Date: 03/20/2009 07:48:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [LogFileData].[ClientUserinfoChangedLine](
	[LineNumber] [int] NOT NULL,
	[Timestamp] [LogFileData].[udtLogTimestamp] NOT NULL,
	[ClientLogID] [int] NOT NULL,
	[InfoString] [varchar](max) NULL,
 CONSTRAINT [PK_ClientUserinfoChangedLine] PRIMARY KEY CLUSTERED 
(
	[LineNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [GAMES_LOG_DATA]
) ON [GAMES_LOG_DATA]
GO
SET ANSI_PADDING OFF
GO

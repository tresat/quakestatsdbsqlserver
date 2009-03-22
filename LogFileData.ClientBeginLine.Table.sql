/****** Object:  Table [LogFileData].[ClientBeginLine]    Script Date: 03/22/2009 17:07:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[LogFileData].[ClientBeginLine]') AND type in (N'U'))
BEGIN
CREATE TABLE [LogFileData].[ClientBeginLine](
	[LineNumber] [int] NOT NULL,
	[Timestamp] [LogFileData].[udtLogTimestamp] NOT NULL,
	[ClientLogID] [int] NOT NULL,
 CONSTRAINT [PK_ClientBeginLine] PRIMARY KEY CLUSTERED 
(
	[LineNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [GAMES_LOG_DATA]
) ON [GAMES_LOG_DATA]
END
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [CalculatedData].[Game]    Script Date: 03/20/2009 07:48:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [CalculatedData].[Game](
	[GameID] [int] IDENTITY(1,1) NOT NULL,
	[fkGameDelimiterLineNumberInit] [int] NOT NULL,
	[fkGameDelimiterLineNumberShutdown] [int] NULL,
	[fkInitGameLineNumber] [int] NOT NULL,
	[fkShutdownGameLineNumber] [int] NULL,
	[fkServerUppageID] [int] NOT NULL,
	[ServerInitTime] [LogFileData].[udtLogTimestamp] NOT NULL,
	[ActualInitTime] [datetime] NULL,
	[ServerShutdownTime] [LogFileData].[udtLogTimestamp] NOT NULL,
	[ActualShutdownTime] [datetime] NULL,
	[fkNextGameID] [int] NULL,
	[fkPreviousGameID] [int] NULL,
	[fkGametypeID] [int] NULL,
	[RedScore] [int] NULL,
	[BlueScore] [int] NULL,
	[fkMapID] [int] NULL,
	[IsCompleteInLog] [char](10) NOT NULL CONSTRAINT [DF_Game_IsCompleteInLog]  DEFAULT ((0)),
	[IsFlagCalculationsComplete] [bit] NOT NULL CONSTRAINT [DF_Game_IsFlagCalculationsComplete]  DEFAULT ((0)),
	[IsToBeCounted] [bit] NOT NULL CONSTRAINT [DF_Game_IsToBeCounted]  DEFAULT ((0)),
	[fkResultLineNumber] [int] NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [CalculatedData].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Game_Next] FOREIGN KEY([fkNextGameID])
REFERENCES [CalculatedData].[Game] ([GameID])
GO
ALTER TABLE [CalculatedData].[Game] CHECK CONSTRAINT [FK_Game_Game_Next]
GO
ALTER TABLE [CalculatedData].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Game_Previous] FOREIGN KEY([fkPreviousGameID])
REFERENCES [CalculatedData].[Game] ([GameID])
GO
ALTER TABLE [CalculatedData].[Game] CHECK CONSTRAINT [FK_Game_Game_Previous]
GO
ALTER TABLE [CalculatedData].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_GameDelimiterLine] FOREIGN KEY([fkGameDelimiterLineNumberInit])
REFERENCES [LogFileData].[GameDelimiterLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Game] CHECK CONSTRAINT [FK_Game_GameDelimiterLine]
GO
ALTER TABLE [CalculatedData].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_GameDelimiterLine1] FOREIGN KEY([fkGameDelimiterLineNumberShutdown])
REFERENCES [LogFileData].[GameDelimiterLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Game] CHECK CONSTRAINT [FK_Game_GameDelimiterLine1]
GO
ALTER TABLE [CalculatedData].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Gametype] FOREIGN KEY([fkGametypeID])
REFERENCES [CalculatedData].[Gametype] ([GametypeID])
GO
ALTER TABLE [CalculatedData].[Game] CHECK CONSTRAINT [FK_Game_Gametype]
GO
ALTER TABLE [CalculatedData].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_InitGameLine] FOREIGN KEY([fkInitGameLineNumber])
REFERENCES [LogFileData].[InitGameLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Game] CHECK CONSTRAINT [FK_Game_InitGameLine]
GO
ALTER TABLE [CalculatedData].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Map] FOREIGN KEY([fkMapID])
REFERENCES [CalculatedData].[Map] ([MapID])
GO
ALTER TABLE [CalculatedData].[Game] CHECK CONSTRAINT [FK_Game_Map]
GO
ALTER TABLE [CalculatedData].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_ServerUppage] FOREIGN KEY([fkServerUppageID])
REFERENCES [CalculatedData].[ServerUppage] ([ServerUppageID])
GO
ALTER TABLE [CalculatedData].[Game] CHECK CONSTRAINT [FK_Game_ServerUppage]
GO
ALTER TABLE [CalculatedData].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_ShutdownGameLine] FOREIGN KEY([fkShutdownGameLineNumber])
REFERENCES [LogFileData].[ShutdownGameLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Game] CHECK CONSTRAINT [FK_Game_ShutdownGameLine]
GO

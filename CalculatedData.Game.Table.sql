SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[Game]') AND type in (N'U'))
BEGIN
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
	[IsFlagCalculationsFailed] [bit] NOT NULL CONSTRAINT [DF_Game_IsFlagCalculationsFailed]  DEFAULT ((0)),
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[CalculatedData].[Game]') AND name = N'_dta_index_Game_9_2114106572__K19')
CREATE NONCLUSTERED INDEX [_dta_index_Game_9_2114106572__K19] ON [CalculatedData].[Game] 
(
	[IsToBeCounted] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SITE_DATA]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Game_Game_Next]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Game]'))
ALTER TABLE [CalculatedData].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Game_Next] FOREIGN KEY([fkNextGameID])
REFERENCES [CalculatedData].[Game] ([GameID])
GO
ALTER TABLE [CalculatedData].[Game] CHECK CONSTRAINT [FK_Game_Game_Next]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Game_Game_Previous]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Game]'))
ALTER TABLE [CalculatedData].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Game_Previous] FOREIGN KEY([fkPreviousGameID])
REFERENCES [CalculatedData].[Game] ([GameID])
GO
ALTER TABLE [CalculatedData].[Game] CHECK CONSTRAINT [FK_Game_Game_Previous]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Game_GameDelimiterLine]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Game]'))
ALTER TABLE [CalculatedData].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_GameDelimiterLine] FOREIGN KEY([fkGameDelimiterLineNumberInit])
REFERENCES [LogFileData].[GameDelimiterLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Game] CHECK CONSTRAINT [FK_Game_GameDelimiterLine]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Game_GameDelimiterLine1]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Game]'))
ALTER TABLE [CalculatedData].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_GameDelimiterLine1] FOREIGN KEY([fkGameDelimiterLineNumberShutdown])
REFERENCES [LogFileData].[GameDelimiterLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Game] CHECK CONSTRAINT [FK_Game_GameDelimiterLine1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Game_Gametype]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Game]'))
ALTER TABLE [CalculatedData].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Gametype] FOREIGN KEY([fkGametypeID])
REFERENCES [CalculatedData].[Gametype] ([GametypeID])
GO
ALTER TABLE [CalculatedData].[Game] CHECK CONSTRAINT [FK_Game_Gametype]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Game_InitGameLine]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Game]'))
ALTER TABLE [CalculatedData].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_InitGameLine] FOREIGN KEY([fkInitGameLineNumber])
REFERENCES [LogFileData].[InitGameLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Game] CHECK CONSTRAINT [FK_Game_InitGameLine]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Game_Map]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Game]'))
ALTER TABLE [CalculatedData].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Map] FOREIGN KEY([fkMapID])
REFERENCES [CalculatedData].[Map] ([MapID])
GO
ALTER TABLE [CalculatedData].[Game] CHECK CONSTRAINT [FK_Game_Map]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Game_ServerUppage]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Game]'))
ALTER TABLE [CalculatedData].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_ServerUppage] FOREIGN KEY([fkServerUppageID])
REFERENCES [CalculatedData].[ServerUppage] ([ServerUppageID])
GO
ALTER TABLE [CalculatedData].[Game] CHECK CONSTRAINT [FK_Game_ServerUppage]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Game_ShutdownGameLine]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Game]'))
ALTER TABLE [CalculatedData].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_ShutdownGameLine] FOREIGN KEY([fkShutdownGameLineNumber])
REFERENCES [LogFileData].[ShutdownGameLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Game] CHECK CONSTRAINT [FK_Game_ShutdownGameLine]
GO

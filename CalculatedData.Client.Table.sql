SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[Client]') AND type in (N'U'))
BEGIN
CREATE TABLE [CalculatedData].[Client](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[fkGameID] [int] NOT NULL,
	[ClientFirstAppearLineNumber] [int] NOT NULL,
	[fkClientConnectLineNumber] [int] NULL,
	[fkClientBeginLineNumber] [int] NULL,
	[fkClientDisconnectLineNumber] [int] NULL,
	[fkClientUserinfoLineNumber] [int] NULL,
	[ClientEndLineNumber] [int] NULL,
	[ServerConnectTime] [LogFileData].[udtLogTimestamp] NOT NULL,
	[ActualConnectTime] [datetime] NULL,
	[ServerBeginTime] [LogFileData].[udtLogTimestamp] NULL,
	[ActualBeginTime] [datetime] NULL,
	[ServerEndTime] [LogFileData].[udtLogTimestamp] NULL,
	[ActualEndTime] [datetime] NULL,
	[ServerDisconnectTime] [LogFileData].[udtLogTimestamp] NULL,
	[ActualDisconnectTime] [datetime] NULL,
	[ClientLogID] [int] NOT NULL,
	[ClientName] [varchar](255) NULL,
	[TeamLogID] [int] NULL,
	[Score] [int] NULL,
	[Ping] [int] NULL,
	[fkScoreLineNumber] [int] NULL,
	[fkPreviousClientID] [int] NULL,
	[fkNextClientID] [int] NULL,
	[IsFinalClient] [bit] NOT NULL CONSTRAINT [DF_Client_IsFinalClient]  DEFAULT ((0)),
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[CalculatedData].[Client]') AND name = N'ind_Client_fkGameID')
CREATE NONCLUSTERED INDEX [ind_Client_fkGameID] ON [CalculatedData].[Client] 
(
	[fkGameID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Client_Client_Next]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Client]'))
ALTER TABLE [CalculatedData].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Client_Next] FOREIGN KEY([fkNextClientID])
REFERENCES [CalculatedData].[Client] ([ClientID])
GO
ALTER TABLE [CalculatedData].[Client] CHECK CONSTRAINT [FK_Client_Client_Next]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Client_Client_Previous]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Client]'))
ALTER TABLE [CalculatedData].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Client_Previous] FOREIGN KEY([fkPreviousClientID])
REFERENCES [CalculatedData].[Client] ([ClientID])
GO
ALTER TABLE [CalculatedData].[Client] CHECK CONSTRAINT [FK_Client_Client_Previous]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Client_ClientBeginLine1]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Client]'))
ALTER TABLE [CalculatedData].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_ClientBeginLine1] FOREIGN KEY([fkClientBeginLineNumber])
REFERENCES [LogFileData].[ClientBeginLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Client] CHECK CONSTRAINT [FK_Client_ClientBeginLine1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Client_ClientConnectLine]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Client]'))
ALTER TABLE [CalculatedData].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_ClientConnectLine] FOREIGN KEY([fkClientConnectLineNumber])
REFERENCES [LogFileData].[ClientConnectLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Client] CHECK CONSTRAINT [FK_Client_ClientConnectLine]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Client_ClientDisconnectLine]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Client]'))
ALTER TABLE [CalculatedData].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_ClientDisconnectLine] FOREIGN KEY([fkClientDisconnectLineNumber])
REFERENCES [LogFileData].[ClientDisconnectLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Client] CHECK CONSTRAINT [FK_Client_ClientDisconnectLine]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Client_ClientUserinfoChangedLine]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Client]'))
ALTER TABLE [CalculatedData].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_ClientUserinfoChangedLine] FOREIGN KEY([fkClientUserinfoLineNumber])
REFERENCES [LogFileData].[ClientUserinfoChangedLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Client] CHECK CONSTRAINT [FK_Client_ClientUserinfoChangedLine]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Client_Game]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Client]'))
ALTER TABLE [CalculatedData].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Game] FOREIGN KEY([fkGameID])
REFERENCES [CalculatedData].[Game] ([GameID])
GO
ALTER TABLE [CalculatedData].[Client] CHECK CONSTRAINT [FK_Client_Game]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Client_ScoreLine]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Client]'))
ALTER TABLE [CalculatedData].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_ScoreLine] FOREIGN KEY([fkScoreLineNumber])
REFERENCES [LogFileData].[ScoreLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Client] CHECK CONSTRAINT [FK_Client_ScoreLine]
GO

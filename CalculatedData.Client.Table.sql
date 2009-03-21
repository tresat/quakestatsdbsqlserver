/****** Object:  Table [CalculatedData].[Client]    Script Date: 03/20/2009 07:47:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [CalculatedData].[Client](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[fkGameID] [int] NOT NULL,
	[fkClientConnectLineNumber] [int] NULL,
	[fkClientBeginLineNumber] [int] NULL,
	[fkClientDisconnectLineNumber] [int] NULL,
	[fkClientUserinfoLineNumber] [int] NULL,
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
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [CalculatedData].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Client_Next] FOREIGN KEY([fkNextClientID])
REFERENCES [CalculatedData].[Client] ([ClientID])
GO
ALTER TABLE [CalculatedData].[Client] CHECK CONSTRAINT [FK_Client_Client_Next]
GO
ALTER TABLE [CalculatedData].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Client_Previous] FOREIGN KEY([fkPreviousClientID])
REFERENCES [CalculatedData].[Client] ([ClientID])
GO
ALTER TABLE [CalculatedData].[Client] CHECK CONSTRAINT [FK_Client_Client_Previous]
GO
ALTER TABLE [CalculatedData].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_ClientBeginLine1] FOREIGN KEY([fkClientBeginLineNumber])
REFERENCES [LogFileData].[ClientBeginLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Client] CHECK CONSTRAINT [FK_Client_ClientBeginLine1]
GO
ALTER TABLE [CalculatedData].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_ClientConnectLine] FOREIGN KEY([fkClientConnectLineNumber])
REFERENCES [LogFileData].[ClientConnectLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Client] CHECK CONSTRAINT [FK_Client_ClientConnectLine]
GO
ALTER TABLE [CalculatedData].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_ClientDisconnectLine] FOREIGN KEY([fkClientDisconnectLineNumber])
REFERENCES [LogFileData].[ClientDisconnectLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Client] CHECK CONSTRAINT [FK_Client_ClientDisconnectLine]
GO
ALTER TABLE [CalculatedData].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_ClientUserinfoChangedLine] FOREIGN KEY([fkClientUserinfoLineNumber])
REFERENCES [LogFileData].[ClientUserinfoChangedLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Client] CHECK CONSTRAINT [FK_Client_ClientUserinfoChangedLine]
GO
ALTER TABLE [CalculatedData].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Game] FOREIGN KEY([fkGameID])
REFERENCES [CalculatedData].[Game] ([GameID])
GO
ALTER TABLE [CalculatedData].[Client] CHECK CONSTRAINT [FK_Client_Game]
GO
ALTER TABLE [CalculatedData].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_ScoreLine] FOREIGN KEY([fkScoreLineNumber])
REFERENCES [LogFileData].[ScoreLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Client] CHECK CONSTRAINT [FK_Client_ScoreLine]
GO

/****** Object:  Table [CalculatedData].[Dialog]    Script Date: 03/20/2009 07:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [CalculatedData].[Dialog](
	[DialogID] [int] IDENTITY(1,1) NOT NULL,
	[ServerDialogTime] [bigint] NOT NULL,
	[ActualDialogTime] [datetime] NULL,
	[Message] [varchar](max) NULL,
	[fkSenderClientID] [int] NOT NULL,
	[fkTargetClientID] [int] NULL,
	[IsTeamSpeech] [bit] NOT NULL CONSTRAINT [DF_Dialog_IsTeamSpeech]  DEFAULT ((0)),
	[IsCommand] [bit] NOT NULL CONSTRAINT [DF_Dialog_IsCommand]  DEFAULT ((0)),
	[Action] [varchar](50) NULL,
	[fkGameID] [int] NOT NULL,
	[LineNumber] [int] NOT NULL,
 CONSTRAINT [PK_Dialog] PRIMARY KEY CLUSTERED 
(
	[DialogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [CalculatedData].[Dialog]  WITH CHECK ADD  CONSTRAINT [FK_Dialog_Client_Sender] FOREIGN KEY([fkSenderClientID])
REFERENCES [CalculatedData].[Client] ([ClientID])
GO
ALTER TABLE [CalculatedData].[Dialog] CHECK CONSTRAINT [FK_Dialog_Client_Sender]
GO
ALTER TABLE [CalculatedData].[Dialog]  WITH CHECK ADD  CONSTRAINT [FK_Dialog_Client_Target] FOREIGN KEY([fkTargetClientID])
REFERENCES [CalculatedData].[Client] ([ClientID])
GO
ALTER TABLE [CalculatedData].[Dialog] CHECK CONSTRAINT [FK_Dialog_Client_Target]
GO
ALTER TABLE [CalculatedData].[Dialog]  WITH CHECK ADD  CONSTRAINT [FK_Dialog_Game] FOREIGN KEY([fkGameID])
REFERENCES [CalculatedData].[Game] ([GameID])
GO
ALTER TABLE [CalculatedData].[Dialog] CHECK CONSTRAINT [FK_Dialog_Game]
GO

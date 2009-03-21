/****** Object:  Table [CalculatedData].[ClientToItem]    Script Date: 03/20/2009 07:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CalculatedData].[ClientToItem](
	[ClientToItemID] [int] IDENTITY(1,1) NOT NULL,
	[fkItemID] [int] NOT NULL,
	[fkClientID] [int] NOT NULL,
	[ServerItemTime] [bigint] NOT NULL,
	[ActualItemTime] [datetime] NULL,
	[fkGameID] [int] NOT NULL,
	[IsFlagRecovery] [bit] NOT NULL CONSTRAINT [DF_ClientToItem_IsFlagRecovery]  DEFAULT ((0)),
	[IsFlagSteal] [bit] NOT NULL CONSTRAINT [DF_ClientToItem_IsFlagSteal]  DEFAULT ((0)),
	[IsFlagCapture] [bit] NOT NULL CONSTRAINT [DF_ClientToItem_IsFlagCapture]  DEFAULT ((0)),
	[IsFlagPickup] [bit] NOT NULL CONSTRAINT [DF_ClientToItem_IsFlagPickup]  DEFAULT ((0)),
	[fkItemLineNumber] [int] NOT NULL,
 CONSTRAINT [PK_ClientToItem] PRIMARY KEY CLUSTERED 
(
	[ClientToItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
GO
ALTER TABLE [CalculatedData].[ClientToItem]  WITH CHECK ADD  CONSTRAINT [FK_ClientToItem_Client] FOREIGN KEY([fkClientID])
REFERENCES [CalculatedData].[Client] ([ClientID])
GO
ALTER TABLE [CalculatedData].[ClientToItem] CHECK CONSTRAINT [FK_ClientToItem_Client]
GO
ALTER TABLE [CalculatedData].[ClientToItem]  WITH CHECK ADD  CONSTRAINT [FK_ClientToItem_Game] FOREIGN KEY([fkGameID])
REFERENCES [CalculatedData].[Game] ([GameID])
GO
ALTER TABLE [CalculatedData].[ClientToItem] CHECK CONSTRAINT [FK_ClientToItem_Game]
GO
ALTER TABLE [CalculatedData].[ClientToItem]  WITH CHECK ADD  CONSTRAINT [FK_ClientToItem_Item] FOREIGN KEY([fkItemID])
REFERENCES [CalculatedData].[Item] ([ItemID])
GO
ALTER TABLE [CalculatedData].[ClientToItem] CHECK CONSTRAINT [FK_ClientToItem_Item]
GO
ALTER TABLE [CalculatedData].[ClientToItem]  WITH CHECK ADD  CONSTRAINT [FK_ClientToItem_ItemLine] FOREIGN KEY([fkItemLineNumber])
REFERENCES [LogFileData].[ItemLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[ClientToItem] CHECK CONSTRAINT [FK_ClientToItem_ItemLine]
GO

/****** Object:  Table [CalculatedData].[ClientToItem]    Script Date: 04/19/2009 22:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[ClientToItem]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[CalculatedData].[ClientToItem]') AND name = N'ind_ClientToItem_ClientID')
CREATE NONCLUSTERED INDEX [ind_ClientToItem_ClientID] ON [CalculatedData].[ClientToItem] 
(
	[fkClientID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[CalculatedData].[ClientToItem]') AND name = N'ind_ClientToItem_fkGameID')
CREATE NONCLUSTERED INDEX [ind_ClientToItem_fkGameID] ON [CalculatedData].[ClientToItem] 
(
	[fkGameID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_ClientToItem_Client]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[ClientToItem]'))
ALTER TABLE [CalculatedData].[ClientToItem]  WITH CHECK ADD  CONSTRAINT [FK_ClientToItem_Client] FOREIGN KEY([fkClientID])
REFERENCES [CalculatedData].[Client] ([ClientID])
GO
ALTER TABLE [CalculatedData].[ClientToItem] CHECK CONSTRAINT [FK_ClientToItem_Client]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_ClientToItem_Game]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[ClientToItem]'))
ALTER TABLE [CalculatedData].[ClientToItem]  WITH CHECK ADD  CONSTRAINT [FK_ClientToItem_Game] FOREIGN KEY([fkGameID])
REFERENCES [CalculatedData].[Game] ([GameID])
GO
ALTER TABLE [CalculatedData].[ClientToItem] CHECK CONSTRAINT [FK_ClientToItem_Game]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_ClientToItem_Item]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[ClientToItem]'))
ALTER TABLE [CalculatedData].[ClientToItem]  WITH CHECK ADD  CONSTRAINT [FK_ClientToItem_Item] FOREIGN KEY([fkItemID])
REFERENCES [CalculatedData].[Item] ([ItemID])
GO
ALTER TABLE [CalculatedData].[ClientToItem] CHECK CONSTRAINT [FK_ClientToItem_Item]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_ClientToItem_ItemLine]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[ClientToItem]'))
ALTER TABLE [CalculatedData].[ClientToItem]  WITH CHECK ADD  CONSTRAINT [FK_ClientToItem_ItemLine] FOREIGN KEY([fkItemLineNumber])
REFERENCES [LogFileData].[ItemLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[ClientToItem] CHECK CONSTRAINT [FK_ClientToItem_ItemLine]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[ClientToItem]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[CalculatedData].[ClientToItem]') AND name = N'ind_ClientToItem_ClientID')
CREATE NONCLUSTERED INDEX [ind_ClientToItem_ClientID] ON [CalculatedData].[ClientToItem] 
(
	[fkClientID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[CalculatedData].[ClientToItem]') AND name = N'ind_ClientToItem_fkGameID')
CREATE NONCLUSTERED INDEX [ind_ClientToItem_fkGameID] ON [CalculatedData].[ClientToItem] 
(
	[fkGameID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_ClientToItem_Client]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[ClientToItem]'))
ALTER TABLE [CalculatedData].[ClientToItem]  WITH CHECK ADD  CONSTRAINT [FK_ClientToItem_Client] FOREIGN KEY([fkClientID])
REFERENCES [CalculatedData].[Client] ([ClientID])
GO
ALTER TABLE [CalculatedData].[ClientToItem] CHECK CONSTRAINT [FK_ClientToItem_Client]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_ClientToItem_Game]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[ClientToItem]'))
ALTER TABLE [CalculatedData].[ClientToItem]  WITH CHECK ADD  CONSTRAINT [FK_ClientToItem_Game] FOREIGN KEY([fkGameID])
REFERENCES [CalculatedData].[Game] ([GameID])
GO
ALTER TABLE [CalculatedData].[ClientToItem] CHECK CONSTRAINT [FK_ClientToItem_Game]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_ClientToItem_Item]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[ClientToItem]'))
ALTER TABLE [CalculatedData].[ClientToItem]  WITH CHECK ADD  CONSTRAINT [FK_ClientToItem_Item] FOREIGN KEY([fkItemID])
REFERENCES [CalculatedData].[Item] ([ItemID])
GO
ALTER TABLE [CalculatedData].[ClientToItem] CHECK CONSTRAINT [FK_ClientToItem_Item]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_ClientToItem_ItemLine]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[ClientToItem]'))
ALTER TABLE [CalculatedData].[ClientToItem]  WITH CHECK ADD  CONSTRAINT [FK_ClientToItem_ItemLine] FOREIGN KEY([fkItemLineNumber])
REFERENCES [LogFileData].[ItemLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[ClientToItem] CHECK CONSTRAINT [FK_ClientToItem_ItemLine]
GO

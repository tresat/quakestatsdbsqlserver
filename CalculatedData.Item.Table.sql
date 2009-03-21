/****** Object:  Table [CalculatedData].[Item]    Script Date: 03/20/2009 07:48:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [CalculatedData].[Item](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](100) NOT NULL,
	[IsWeapon] [bit] NOT NULL,
	[IsAmmo] [bit] NOT NULL,
	[IsFlag] [bit] NOT NULL CONSTRAINT [DF_Item_IsFlag]  DEFAULT ((0)),
	[fkFirstEncounteredItemLineNumber] [int] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [CalculatedData].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_ItemLine] FOREIGN KEY([fkFirstEncounteredItemLineNumber])
REFERENCES [LogFileData].[ItemLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Item] CHECK CONSTRAINT [FK_Item_ItemLine]
GO

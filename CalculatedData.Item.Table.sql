/****** Object:  Table [CalculatedData].[Item]    Script Date: 03/22/2009 17:07:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[Item]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Item_ItemLine]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Item]'))
ALTER TABLE [CalculatedData].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_ItemLine] FOREIGN KEY([fkFirstEncounteredItemLineNumber])
REFERENCES [LogFileData].[ItemLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Item] CHECK CONSTRAINT [FK_Item_ItemLine]
GO

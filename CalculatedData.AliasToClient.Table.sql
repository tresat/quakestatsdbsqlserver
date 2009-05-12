SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[AliasToClient]') AND type in (N'U'))
BEGIN
CREATE TABLE [CalculatedData].[AliasToClient](
	[AliasToClientID] [int] IDENTITY(1,1) NOT NULL,
	[fkAliasID] [int] NOT NULL,
	[fkClientID] [int] NOT NULL,
 CONSTRAINT [PK_AliasToClient] PRIMARY KEY CLUSTERED 
(
	[AliasToClientID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_AliasToClient_Alias]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[AliasToClient]'))
ALTER TABLE [CalculatedData].[AliasToClient]  WITH CHECK ADD  CONSTRAINT [FK_AliasToClient_Alias] FOREIGN KEY([fkAliasID])
REFERENCES [CalculatedData].[Alias] ([AliasID])
GO
ALTER TABLE [CalculatedData].[AliasToClient] CHECK CONSTRAINT [FK_AliasToClient_Alias]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_AliasToClient_Client]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[AliasToClient]'))
ALTER TABLE [CalculatedData].[AliasToClient]  WITH CHECK ADD  CONSTRAINT [FK_AliasToClient_Client] FOREIGN KEY([fkClientID])
REFERENCES [CalculatedData].[Client] ([ClientID])
GO
ALTER TABLE [CalculatedData].[AliasToClient] CHECK CONSTRAINT [FK_AliasToClient_Client]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SiteData].[PlayerToClient]') AND type in (N'U'))
BEGIN
CREATE TABLE [SiteData].[PlayerToClient](
	[PlayerToClientID] [int] IDENTITY(1,1) NOT NULL,
	[fkPlayerID] [int] NOT NULL,
	[fkClientID] [int] NOT NULL,
 CONSTRAINT [PK_PlayerToClient] PRIMARY KEY CLUSTERED 
(
	[PlayerToClientID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SITE_DATA]
) ON [SITE_DATA]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[SiteData].[FK_PlayerToClient_Client]') AND parent_object_id = OBJECT_ID(N'[SiteData].[PlayerToClient]'))
ALTER TABLE [SiteData].[PlayerToClient]  WITH CHECK ADD  CONSTRAINT [FK_PlayerToClient_Client] FOREIGN KEY([fkClientID])
REFERENCES [CalculatedData].[Client] ([ClientID])
GO
ALTER TABLE [SiteData].[PlayerToClient] CHECK CONSTRAINT [FK_PlayerToClient_Client]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[SiteData].[FK_PlayerToClient_Player]') AND parent_object_id = OBJECT_ID(N'[SiteData].[PlayerToClient]'))
ALTER TABLE [SiteData].[PlayerToClient]  WITH CHECK ADD  CONSTRAINT [FK_PlayerToClient_Player] FOREIGN KEY([fkPlayerID])
REFERENCES [SiteData].[Player] ([PlayerID])
GO
ALTER TABLE [SiteData].[PlayerToClient] CHECK CONSTRAINT [FK_PlayerToClient_Player]
GO

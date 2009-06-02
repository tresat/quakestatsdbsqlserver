SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SiteData].[DataProcedureSecurity]') AND type in (N'U'))
BEGIN
CREATE TABLE [SiteData].[DataProcedureSecurity](
	[DataProcedureSecurityID] [int] IDENTITY(1,1) NOT NULL,
	[fkDataProcedureID] [int] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_DataProcedureSecurity] PRIMARY KEY CLUSTERED 
(
	[DataProcedureSecurityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SITE_DATA]
) ON [SITE_DATA]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[SiteData].[FK_DataProcedureSecurity_DataProcedure]') AND parent_object_id = OBJECT_ID(N'[SiteData].[DataProcedureSecurity]'))
ALTER TABLE [SiteData].[DataProcedureSecurity]  WITH CHECK ADD  CONSTRAINT [FK_DataProcedureSecurity_DataProcedure] FOREIGN KEY([fkDataProcedureID])
REFERENCES [SiteData].[DataProcedure] ([DataProcedureID])
GO
ALTER TABLE [SiteData].[DataProcedureSecurity] CHECK CONSTRAINT [FK_DataProcedureSecurity_DataProcedure]
GO

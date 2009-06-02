SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SiteData].[DataProcedure]') AND type in (N'U'))
BEGIN
CREATE TABLE [SiteData].[DataProcedure](
	[DataProcedureID] [int] IDENTITY(1,1) NOT NULL,
	[DataProcedureName] [nvarchar](255) NOT NULL,
	[IsGridProcedure] [bit] NOT NULL CONSTRAINT [DF_DataProcedure_IsGridProcedure]  DEFAULT ((0)),
	[IsChartProcedure] [bit] NOT NULL CONSTRAINT [DF_DataProcedure_IsChartProcedure]  DEFAULT ((0)),
 CONSTRAINT [PK_DataProcedure] PRIMARY KEY CLUSTERED 
(
	[DataProcedureID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SITE_DATA]
) ON [SITE_DATA]
END
GO

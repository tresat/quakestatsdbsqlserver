/****** Object:  Table [CalculatedData].[Gametype]    Script Date: 03/22/2009 17:07:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[Gametype]') AND type in (N'U'))
BEGIN
CREATE TABLE [CalculatedData].[Gametype](
	[GametypeID] [int] IDENTITY(1,1) NOT NULL,
	[GametypeLogID] [int] NOT NULL,
	[GametypeName] [varchar](50) NULL,
	[IsTeamGame] [bit] NOT NULL,
 CONSTRAINT [PK_Gametype] PRIMARY KEY CLUSTERED 
(
	[GametypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
END
GO
SET ANSI_PADDING OFF
GO

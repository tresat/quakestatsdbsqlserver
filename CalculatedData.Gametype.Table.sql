/****** Object:  Table [CalculatedData].[Gametype]    Script Date: 03/20/2009 07:48:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CalculatedData].[Gametype](
	[GametypeID] [int] IDENTITY(1,1) NOT NULL,
	[GametypeLogID] [int] NOT NULL,
	[GametypeName] [nchar](45) NULL,
	[IsTeamGame] [bit] NOT NULL,
 CONSTRAINT [PK_Gametype] PRIMARY KEY CLUSTERED 
(
	[GametypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
GO

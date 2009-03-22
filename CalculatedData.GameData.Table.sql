/****** Object:  Table [CalculatedData].[GameData]    Script Date: 03/22/2009 17:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[GameData]') AND type in (N'U'))
BEGIN
CREATE TABLE [CalculatedData].[GameData](
	[GameDataID] [int] IDENTITY(1,1) NOT NULL,
	[fkGameID] [int] NOT NULL,
	[DataKey] [varchar](100) NOT NULL,
	[DataValue] [varchar](255) NULL,
 CONSTRAINT [PK_GameData] PRIMARY KEY CLUSTERED 
(
	[GameDataID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_GameData_Game]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[GameData]'))
ALTER TABLE [CalculatedData].[GameData]  WITH CHECK ADD  CONSTRAINT [FK_GameData_Game] FOREIGN KEY([fkGameID])
REFERENCES [CalculatedData].[Game] ([GameID])
GO
ALTER TABLE [CalculatedData].[GameData] CHECK CONSTRAINT [FK_GameData_Game]
GO

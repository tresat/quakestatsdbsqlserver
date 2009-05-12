/****** Object:  Table [CalculatedData].[SwapPoints]    Script Date: 04/19/2009 22:47:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[SwapPoints]') AND type in (N'U'))
BEGIN
CREATE TABLE [CalculatedData].[SwapPoints](
	[SwapPointID] [int] IDENTITY(1,1) NOT NULL,
	[fkGameID] [int] NOT NULL,
	[LineNumber1] [int] NOT NULL,
	[LineNumber2] [int] NOT NULL,
 CONSTRAINT [PK_SwapPoints] PRIMARY KEY CLUSTERED 
(
	[SwapPointID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_SwapPoints_Game]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[SwapPoints]'))
ALTER TABLE [CalculatedData].[SwapPoints]  WITH CHECK ADD  CONSTRAINT [FK_SwapPoints_Game] FOREIGN KEY([fkGameID])
REFERENCES [CalculatedData].[Game] ([GameID])
GO
ALTER TABLE [CalculatedData].[SwapPoints] CHECK CONSTRAINT [FK_SwapPoints_Game]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[SwapPoints]') AND type in (N'U'))
BEGIN
CREATE TABLE [CalculatedData].[SwapPoints](
	[SwapPointID] [int] IDENTITY(1,1) NOT NULL,
	[fkGameID] [int] NOT NULL,
	[LineNumber1] [int] NOT NULL,
	[LineNumber2] [int] NOT NULL,
 CONSTRAINT [PK_SwapPoints] PRIMARY KEY CLUSTERED 
(
	[SwapPointID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_SwapPoints_Game]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[SwapPoints]'))
ALTER TABLE [CalculatedData].[SwapPoints]  WITH CHECK ADD  CONSTRAINT [FK_SwapPoints_Game] FOREIGN KEY([fkGameID])
REFERENCES [CalculatedData].[Game] ([GameID])
GO
ALTER TABLE [CalculatedData].[SwapPoints] CHECK CONSTRAINT [FK_SwapPoints_Game]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[SwapPoints]') AND type in (N'U'))
BEGIN
CREATE TABLE [CalculatedData].[SwapPoints](
	[SwapPointID] [int] IDENTITY(1,1) NOT NULL,
	[fkGameID] [int] NOT NULL,
	[LineNumber1] [int] NOT NULL,
	[LineNumber2] [int] NOT NULL,
 CONSTRAINT [PK_SwapPoints] PRIMARY KEY CLUSTERED 
(
	[SwapPointID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_SwapPoints_Game]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[SwapPoints]'))
ALTER TABLE [CalculatedData].[SwapPoints]  WITH CHECK ADD  CONSTRAINT [FK_SwapPoints_Game] FOREIGN KEY([fkGameID])
REFERENCES [CalculatedData].[Game] ([GameID])
GO
ALTER TABLE [CalculatedData].[SwapPoints] CHECK CONSTRAINT [FK_SwapPoints_Game]
GO

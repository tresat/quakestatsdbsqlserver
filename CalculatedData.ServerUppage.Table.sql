/****** Object:  Table [CalculatedData].[ServerUppage]    Script Date: 04/19/2009 22:47:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[ServerUppage]') AND type in (N'U'))
BEGIN
CREATE TABLE [CalculatedData].[ServerUppage](
	[ServerUppageID] [int] IDENTITY(1,1) NOT NULL,
	[fkBeginGameDelimiterLineNumber] [int] NOT NULL,
	[fkPreviousServerUppageID] [int] NULL,
	[fkNextServerUppageID] [int] NULL,
	[ActualStartTime] [datetime] NULL,
 CONSTRAINT [PK_ServerUppages] PRIMARY KEY CLUSTERED 
(
	[ServerUppageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_ServerUppages_GameDelimiterLine]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[ServerUppage]'))
ALTER TABLE [CalculatedData].[ServerUppage]  WITH CHECK ADD  CONSTRAINT [FK_ServerUppages_GameDelimiterLine] FOREIGN KEY([fkBeginGameDelimiterLineNumber])
REFERENCES [LogFileData].[GameDelimiterLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[ServerUppage] CHECK CONSTRAINT [FK_ServerUppages_GameDelimiterLine]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_ServerUppages_ServerUppages_Next]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[ServerUppage]'))
ALTER TABLE [CalculatedData].[ServerUppage]  WITH CHECK ADD  CONSTRAINT [FK_ServerUppages_ServerUppages_Next] FOREIGN KEY([fkNextServerUppageID])
REFERENCES [CalculatedData].[ServerUppage] ([ServerUppageID])
GO
ALTER TABLE [CalculatedData].[ServerUppage] CHECK CONSTRAINT [FK_ServerUppages_ServerUppages_Next]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_ServerUppages_ServerUppages_Previous]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[ServerUppage]'))
ALTER TABLE [CalculatedData].[ServerUppage]  WITH CHECK ADD  CONSTRAINT [FK_ServerUppages_ServerUppages_Previous] FOREIGN KEY([fkPreviousServerUppageID])
REFERENCES [CalculatedData].[ServerUppage] ([ServerUppageID])
GO
ALTER TABLE [CalculatedData].[ServerUppage] CHECK CONSTRAINT [FK_ServerUppages_ServerUppages_Previous]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[ServerUppage]') AND type in (N'U'))
BEGIN
CREATE TABLE [CalculatedData].[ServerUppage](
	[ServerUppageID] [int] IDENTITY(1,1) NOT NULL,
	[fkBeginGameDelimiterLineNumber] [int] NOT NULL,
	[fkPreviousServerUppageID] [int] NULL,
	[fkNextServerUppageID] [int] NULL,
	[ActualStartTime] [datetime] NULL,
 CONSTRAINT [PK_ServerUppages] PRIMARY KEY CLUSTERED 
(
	[ServerUppageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_ServerUppages_GameDelimiterLine]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[ServerUppage]'))
ALTER TABLE [CalculatedData].[ServerUppage]  WITH CHECK ADD  CONSTRAINT [FK_ServerUppages_GameDelimiterLine] FOREIGN KEY([fkBeginGameDelimiterLineNumber])
REFERENCES [LogFileData].[GameDelimiterLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[ServerUppage] CHECK CONSTRAINT [FK_ServerUppages_GameDelimiterLine]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_ServerUppages_ServerUppages_Next]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[ServerUppage]'))
ALTER TABLE [CalculatedData].[ServerUppage]  WITH CHECK ADD  CONSTRAINT [FK_ServerUppages_ServerUppages_Next] FOREIGN KEY([fkNextServerUppageID])
REFERENCES [CalculatedData].[ServerUppage] ([ServerUppageID])
GO
ALTER TABLE [CalculatedData].[ServerUppage] CHECK CONSTRAINT [FK_ServerUppages_ServerUppages_Next]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_ServerUppages_ServerUppages_Previous]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[ServerUppage]'))
ALTER TABLE [CalculatedData].[ServerUppage]  WITH CHECK ADD  CONSTRAINT [FK_ServerUppages_ServerUppages_Previous] FOREIGN KEY([fkPreviousServerUppageID])
REFERENCES [CalculatedData].[ServerUppage] ([ServerUppageID])
GO
ALTER TABLE [CalculatedData].[ServerUppage] CHECK CONSTRAINT [FK_ServerUppages_ServerUppages_Previous]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[ServerUppage]') AND type in (N'U'))
BEGIN
CREATE TABLE [CalculatedData].[ServerUppage](
	[ServerUppageID] [int] IDENTITY(1,1) NOT NULL,
	[fkBeginGameDelimiterLineNumber] [int] NOT NULL,
	[fkPreviousServerUppageID] [int] NULL,
	[fkNextServerUppageID] [int] NULL,
	[ActualStartTime] [datetime] NULL,
 CONSTRAINT [PK_ServerUppages] PRIMARY KEY CLUSTERED 
(
	[ServerUppageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_ServerUppages_GameDelimiterLine]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[ServerUppage]'))
ALTER TABLE [CalculatedData].[ServerUppage]  WITH CHECK ADD  CONSTRAINT [FK_ServerUppages_GameDelimiterLine] FOREIGN KEY([fkBeginGameDelimiterLineNumber])
REFERENCES [LogFileData].[GameDelimiterLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[ServerUppage] CHECK CONSTRAINT [FK_ServerUppages_GameDelimiterLine]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_ServerUppages_ServerUppages_Next]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[ServerUppage]'))
ALTER TABLE [CalculatedData].[ServerUppage]  WITH CHECK ADD  CONSTRAINT [FK_ServerUppages_ServerUppages_Next] FOREIGN KEY([fkNextServerUppageID])
REFERENCES [CalculatedData].[ServerUppage] ([ServerUppageID])
GO
ALTER TABLE [CalculatedData].[ServerUppage] CHECK CONSTRAINT [FK_ServerUppages_ServerUppages_Next]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_ServerUppages_ServerUppages_Previous]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[ServerUppage]'))
ALTER TABLE [CalculatedData].[ServerUppage]  WITH CHECK ADD  CONSTRAINT [FK_ServerUppages_ServerUppages_Previous] FOREIGN KEY([fkPreviousServerUppageID])
REFERENCES [CalculatedData].[ServerUppage] ([ServerUppageID])
GO
ALTER TABLE [CalculatedData].[ServerUppage] CHECK CONSTRAINT [FK_ServerUppages_ServerUppages_Previous]
GO

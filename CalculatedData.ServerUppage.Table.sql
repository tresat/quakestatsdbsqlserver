/****** Object:  Table [CalculatedData].[ServerUppage]    Script Date: 03/20/2009 07:48:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CalculatedData].[ServerUppage](
	[ServerUppageID] [int] IDENTITY(1,1) NOT NULL,
	[fkBeginGameDelimiterLineNumber] [int] NOT NULL,
	[fkPreviousServerUppageID] [int] NULL,
	[fkNextServerUppageID] [int] NULL,
	[ActualStartTime] [timestamp] NULL,
 CONSTRAINT [PK_ServerUppages] PRIMARY KEY CLUSTERED 
(
	[ServerUppageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
GO
ALTER TABLE [CalculatedData].[ServerUppage]  WITH CHECK ADD  CONSTRAINT [FK_ServerUppages_GameDelimiterLine] FOREIGN KEY([fkBeginGameDelimiterLineNumber])
REFERENCES [LogFileData].[GameDelimiterLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[ServerUppage] CHECK CONSTRAINT [FK_ServerUppages_GameDelimiterLine]
GO
ALTER TABLE [CalculatedData].[ServerUppage]  WITH CHECK ADD  CONSTRAINT [FK_ServerUppages_ServerUppages_Next] FOREIGN KEY([fkNextServerUppageID])
REFERENCES [CalculatedData].[ServerUppage] ([ServerUppageID])
GO
ALTER TABLE [CalculatedData].[ServerUppage] CHECK CONSTRAINT [FK_ServerUppages_ServerUppages_Next]
GO
ALTER TABLE [CalculatedData].[ServerUppage]  WITH CHECK ADD  CONSTRAINT [FK_ServerUppages_ServerUppages_Previous] FOREIGN KEY([fkPreviousServerUppageID])
REFERENCES [CalculatedData].[ServerUppage] ([ServerUppageID])
GO
ALTER TABLE [CalculatedData].[ServerUppage] CHECK CONSTRAINT [FK_ServerUppages_ServerUppages_Previous]
GO

/****** Object:  Table [CalculatedData].[ClientData]    Script Date: 03/20/2009 07:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [CalculatedData].[ClientData](
	[ClientDataID] [int] IDENTITY(1,1) NOT NULL,
	[fkClientID] [int] NOT NULL,
	[DataKey] [varchar](100) NOT NULL,
	[DataValue] [varchar](255) NULL,
 CONSTRAINT [PK_ClientData] PRIMARY KEY CLUSTERED 
(
	[ClientDataID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [CalculatedData].[ClientData]  WITH CHECK ADD  CONSTRAINT [FK_ClientData_Client] FOREIGN KEY([fkClientID])
REFERENCES [CalculatedData].[Client] ([ClientID])
GO
ALTER TABLE [CalculatedData].[ClientData] CHECK CONSTRAINT [FK_ClientData_Client]
GO

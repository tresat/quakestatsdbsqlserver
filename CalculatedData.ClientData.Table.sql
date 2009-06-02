SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[ClientData]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_ClientData_Client]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[ClientData]'))
ALTER TABLE [CalculatedData].[ClientData]  WITH CHECK ADD  CONSTRAINT [FK_ClientData_Client] FOREIGN KEY([fkClientID])
REFERENCES [CalculatedData].[Client] ([ClientID])
GO
ALTER TABLE [CalculatedData].[ClientData] CHECK CONSTRAINT [FK_ClientData_Client]
GO

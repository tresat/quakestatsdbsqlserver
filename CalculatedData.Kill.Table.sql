/****** Object:  Table [CalculatedData].[Kill]    Script Date: 03/20/2009 07:48:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CalculatedData].[Kill](
	[KillID] [int] IDENTITY(1,1) NOT NULL,
	[fkKillLineNumber] [int] NOT NULL,
	[fkGameID] [int] NOT NULL,
	[fkKillerClientID] [int] NULL,
	[fkVictimClientID] [int] NOT NULL,
	[fkWeaponID] [int] NOT NULL,
	[ServerKillTime] [bigint] NOT NULL,
	[ActualKillTime] [datetime] NULL,
	[IsCarrierKill] [bit] NOT NULL CONSTRAINT [DF_Kill_IsCarrierKill]  DEFAULT ((0)),
 CONSTRAINT [PK_Kill] PRIMARY KEY CLUSTERED 
(
	[KillID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
GO
ALTER TABLE [CalculatedData].[Kill]  WITH CHECK ADD  CONSTRAINT [FK_Kill_Client_Killer] FOREIGN KEY([fkKillerClientID])
REFERENCES [CalculatedData].[Client] ([ClientID])
GO
ALTER TABLE [CalculatedData].[Kill] CHECK CONSTRAINT [FK_Kill_Client_Killer]
GO
ALTER TABLE [CalculatedData].[Kill]  WITH CHECK ADD  CONSTRAINT [FK_Kill_Client_Victim] FOREIGN KEY([fkVictimClientID])
REFERENCES [CalculatedData].[Client] ([ClientID])
GO
ALTER TABLE [CalculatedData].[Kill] CHECK CONSTRAINT [FK_Kill_Client_Victim]
GO
ALTER TABLE [CalculatedData].[Kill]  WITH CHECK ADD  CONSTRAINT [FK_Kill_Game] FOREIGN KEY([fkGameID])
REFERENCES [CalculatedData].[Game] ([GameID])
GO
ALTER TABLE [CalculatedData].[Kill] CHECK CONSTRAINT [FK_Kill_Game]
GO
ALTER TABLE [CalculatedData].[Kill]  WITH CHECK ADD  CONSTRAINT [FK_Kill_KillLine] FOREIGN KEY([fkKillLineNumber])
REFERENCES [LogFileData].[KillLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Kill] CHECK CONSTRAINT [FK_Kill_KillLine]
GO
ALTER TABLE [CalculatedData].[Kill]  WITH CHECK ADD  CONSTRAINT [FK_Kill_Weapon] FOREIGN KEY([fkWeaponID])
REFERENCES [CalculatedData].[Weapon] ([WeaponID])
GO
ALTER TABLE [CalculatedData].[Kill] CHECK CONSTRAINT [FK_Kill_Weapon]
GO

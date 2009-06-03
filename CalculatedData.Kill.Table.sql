SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[Kill]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[CalculatedData].[Kill]') AND name = N'_dta_index_Kill_9_1637580872__K3_K1_K6')
CREATE NONCLUSTERED INDEX [_dta_index_Kill_9_1637580872__K3_K1_K6] ON [CalculatedData].[Kill] 
(
	[fkGameID] ASC,
	[KillID] ASC,
	[fkWeaponID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SITE_DATA]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[CalculatedData].[Kill]') AND name = N'ind_Kill_fkGameID')
CREATE NONCLUSTERED INDEX [ind_Kill_fkGameID] ON [CalculatedData].[Kill] 
(
	[fkGameID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[CalculatedData].[Kill]') AND name = N'ind_Kill_fkWeaponID')
CREATE NONCLUSTERED INDEX [ind_Kill_fkWeaponID] ON [CalculatedData].[Kill] 
(
	[fkWeaponID] ASC
)WITH (PAD_INDEX  = ON, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[CalculatedData].[Kill]') AND name = N'ind_Kill_KillerID')
CREATE NONCLUSTERED INDEX [ind_Kill_KillerID] ON [CalculatedData].[Kill] 
(
	[fkKillerClientID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[CalculatedData].[Kill]') AND name = N'ind_Kill_VictimID')
CREATE NONCLUSTERED INDEX [ind_Kill_VictimID] ON [CalculatedData].[Kill] 
(
	[fkVictimClientID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Kill_Client_Killer]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Kill]'))
ALTER TABLE [CalculatedData].[Kill]  WITH CHECK ADD  CONSTRAINT [FK_Kill_Client_Killer] FOREIGN KEY([fkKillerClientID])
REFERENCES [CalculatedData].[Client] ([ClientID])
GO
ALTER TABLE [CalculatedData].[Kill] CHECK CONSTRAINT [FK_Kill_Client_Killer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Kill_Client_Victim]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Kill]'))
ALTER TABLE [CalculatedData].[Kill]  WITH CHECK ADD  CONSTRAINT [FK_Kill_Client_Victim] FOREIGN KEY([fkVictimClientID])
REFERENCES [CalculatedData].[Client] ([ClientID])
GO
ALTER TABLE [CalculatedData].[Kill] CHECK CONSTRAINT [FK_Kill_Client_Victim]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Kill_Game]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Kill]'))
ALTER TABLE [CalculatedData].[Kill]  WITH CHECK ADD  CONSTRAINT [FK_Kill_Game] FOREIGN KEY([fkGameID])
REFERENCES [CalculatedData].[Game] ([GameID])
GO
ALTER TABLE [CalculatedData].[Kill] CHECK CONSTRAINT [FK_Kill_Game]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Kill_KillLine]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Kill]'))
ALTER TABLE [CalculatedData].[Kill]  WITH CHECK ADD  CONSTRAINT [FK_Kill_KillLine] FOREIGN KEY([fkKillLineNumber])
REFERENCES [LogFileData].[KillLine] ([LineNumber])
GO
ALTER TABLE [CalculatedData].[Kill] CHECK CONSTRAINT [FK_Kill_KillLine]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Kill_Weapon]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Kill]'))
ALTER TABLE [CalculatedData].[Kill]  WITH CHECK ADD  CONSTRAINT [FK_Kill_Weapon] FOREIGN KEY([fkWeaponID])
REFERENCES [CalculatedData].[Weapon] ([WeaponID])
GO
ALTER TABLE [CalculatedData].[Kill] CHECK CONSTRAINT [FK_Kill_Weapon]
GO

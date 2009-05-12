/****** Object:  Table [CalculatedData].[Weapon]    Script Date: 04/19/2009 22:47:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[Weapon]') AND type in (N'U'))
BEGIN
CREATE TABLE [CalculatedData].[Weapon](
	[WeaponID] [int] IDENTITY(1,1) NOT NULL,
	[WeaponLogID] [int] NOT NULL,
	[WeaponName] [varchar](45) NULL,
	[fkItemID] [int] NULL,
 CONSTRAINT [PK_Weapon] PRIMARY KEY CLUSTERED 
(
	[WeaponID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Weapon_Item]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Weapon]'))
ALTER TABLE [CalculatedData].[Weapon]  WITH CHECK ADD  CONSTRAINT [FK_Weapon_Item] FOREIGN KEY([fkItemID])
REFERENCES [CalculatedData].[Item] ([ItemID])
GO
ALTER TABLE [CalculatedData].[Weapon] CHECK CONSTRAINT [FK_Weapon_Item]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[Weapon]') AND type in (N'U'))
BEGIN
CREATE TABLE [CalculatedData].[Weapon](
	[WeaponID] [int] IDENTITY(1,1) NOT NULL,
	[WeaponLogID] [int] NOT NULL,
	[WeaponName] [varchar](45) NULL,
	[fkItemID] [int] NULL,
 CONSTRAINT [PK_Weapon] PRIMARY KEY CLUSTERED 
(
	[WeaponID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Weapon_Item]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Weapon]'))
ALTER TABLE [CalculatedData].[Weapon]  WITH CHECK ADD  CONSTRAINT [FK_Weapon_Item] FOREIGN KEY([fkItemID])
REFERENCES [CalculatedData].[Item] ([ItemID])
GO
ALTER TABLE [CalculatedData].[Weapon] CHECK CONSTRAINT [FK_Weapon_Item]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[Weapon]') AND type in (N'U'))
BEGIN
CREATE TABLE [CalculatedData].[Weapon](
	[WeaponID] [int] IDENTITY(1,1) NOT NULL,
	[WeaponLogID] [int] NOT NULL,
	[WeaponName] [varchar](45) NULL,
	[fkItemID] [int] NULL,
 CONSTRAINT [PK_Weapon] PRIMARY KEY CLUSTERED 
(
	[WeaponID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [CALCULATED_DATA]
) ON [CALCULATED_DATA]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[CalculatedData].[FK_Weapon_Item]') AND parent_object_id = OBJECT_ID(N'[CalculatedData].[Weapon]'))
ALTER TABLE [CalculatedData].[Weapon]  WITH CHECK ADD  CONSTRAINT [FK_Weapon_Item] FOREIGN KEY([fkItemID])
REFERENCES [CalculatedData].[Item] ([ItemID])
GO
ALTER TABLE [CalculatedData].[Weapon] CHECK CONSTRAINT [FK_Weapon_Item]
GO

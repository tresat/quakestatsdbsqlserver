SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SiteData].[WeaponToWeaponGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [SiteData].[WeaponToWeaponGroup](
	[WeaponToWeaponGroupID] [int] IDENTITY(1,1) NOT NULL,
	[fkWeaponID] [int] NOT NULL,
	[fkWeaponGroupID] [int] NOT NULL,
 CONSTRAINT [PK_WeaponToWeaponGroup] PRIMARY KEY CLUSTERED 
(
	[WeaponToWeaponGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SITE_DATA]
) ON [SITE_DATA]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[SiteData].[FK_WeaponToWeaponGroup_Weapon]') AND parent_object_id = OBJECT_ID(N'[SiteData].[WeaponToWeaponGroup]'))
ALTER TABLE [SiteData].[WeaponToWeaponGroup]  WITH CHECK ADD  CONSTRAINT [FK_WeaponToWeaponGroup_Weapon] FOREIGN KEY([fkWeaponID])
REFERENCES [CalculatedData].[Weapon] ([WeaponID])
GO
ALTER TABLE [SiteData].[WeaponToWeaponGroup] CHECK CONSTRAINT [FK_WeaponToWeaponGroup_Weapon]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[SiteData].[FK_WeaponToWeaponGroup_WeaponGroup]') AND parent_object_id = OBJECT_ID(N'[SiteData].[WeaponToWeaponGroup]'))
ALTER TABLE [SiteData].[WeaponToWeaponGroup]  WITH CHECK ADD  CONSTRAINT [FK_WeaponToWeaponGroup_WeaponGroup] FOREIGN KEY([fkWeaponGroupID])
REFERENCES [SiteData].[WeaponGroup] ([WeaponGroupID])
GO
ALTER TABLE [SiteData].[WeaponToWeaponGroup] CHECK CONSTRAINT [FK_WeaponToWeaponGroup_WeaponGroup]
GO

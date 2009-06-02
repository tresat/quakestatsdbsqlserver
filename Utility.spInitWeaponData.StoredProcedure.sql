SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Utility].[spInitWeaponData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 5/31/09
-- Description:	Sets up weapon relationships, groups, pretty names.
-- =============================================
CREATE PROCEDURE [Utility].[spInitWeaponData]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- First, update the weapons with pretty print display names
	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''BFG (Direct Hit)''   
	WHERE WeaponName = ''MOD_BFG''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''BFG (Splash Damage)''   
	WHERE WeaponName = ''MOD_BFG_SPLASH''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Crushing''   
	WHERE WeaponName = ''MOD_CRUSH''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Falling''   
	WHERE WeaponName = ''MOD_FALLING''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Gauntlet''   
	WHERE WeaponName = ''MOD_GAUNTLET''
	
	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Grenade Launcher (Direct Hit)''   
	WHERE WeaponName = ''MOD_GRENADE''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Grenade Launcher (Splash Damage)''   
	WHERE WeaponName = ''MOD_GRENADE_SPLASH''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Juicing''   
	WHERE WeaponName = ''MOD_JUICED''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''The Bomb''   
	WHERE WeaponName = ''MOD_KAMIKAZE''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Lava''   
	WHERE WeaponName = ''MOD_LAVA''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Lightning Gun''   
	WHERE WeaponName = ''MOD_LIGHTNING''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Machine Gun''   
	WHERE WeaponName = ''MOD_MACHINEGUN''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Nailgun''   
	WHERE WeaponName = ''MOD_NAIL''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Plasma Gun (Direct Hit)''   
	WHERE WeaponName = ''MOD_PLASMA''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Plasma Gun (Splash Damage)''   
	WHERE WeaponName = ''MOD_PLASMA_SPLASH''
	
	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Proximity Mine''   
	WHERE WeaponName = ''MOD_PROXIMITY_MINE''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Railgun''   
	WHERE WeaponName = ''MOD_RAILGUN''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Rocket Launcher (Direct Hit)''   
	WHERE WeaponName = ''MOD_ROCKET''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Rocket Launcher (Splash Damage)''   
	WHERE WeaponName = ''MOD_ROCKET_SPLASH''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Shotgun''   
	WHERE WeaponName = ''MOD_SHOTGUN''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Suicide''   
	WHERE WeaponName = ''MOD_SUICIDE''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Tele-Fragging''   
	WHERE WeaponName = ''MOD_TELEFRAG''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Other''   
	WHERE WeaponName = ''MOD_TRIGGER_HURT''

	UPDATE CalculatedData.Weapon   
	SET DisplayName = ''Water''   
	WHERE WeaponName = ''MOD_WATER''

	--Next, create weapon groups
	DECLARE @GroupID INT
	DECLARE @WeaponID INT

	DELETE FROM SiteData.WeaponToWeaponGroup
	DELETE FROM SiteData.WeaponGroup
	
	--Group: BFG
	INSERT INTO SiteData.WeaponGroup (WeaponGroupName)
	VALUES (''BFG'')

	SET @GroupID = @@IDENTITY

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_BFG''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)
	
	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_BFG_SPLASH''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	--Group: Chaingun
	INSERT INTO SiteData.WeaponGroup (WeaponGroupName)
	VALUES (''Chaingun'')

	SET @GroupID = @@IDENTITY

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''XXX''

	--INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	--VALUES (@WeaponID, @GroupID)

	--Group: Gauntlet
	INSERT INTO SiteData.WeaponGroup (WeaponGroupName)
	VALUES (''Gauntlet'')

	SET @GroupID = @@IDENTITY

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_GAUNTLET''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	--Group: Grenade Gun
	INSERT INTO SiteData.WeaponGroup (WeaponGroupName)
	VALUES (''Grenade Gun'')

	SET @GroupID = @@IDENTITY

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_GRENADE''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_GRENADE_SPLASH''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	--Group: The Bomb
	INSERT INTO SiteData.WeaponGroup (WeaponGroupName)
	VALUES (''The Bomb'')

	SET @GroupID = @@IDENTITY

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_KAMIKAZE''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_SUICIDE''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	--Group: Lightning Gun
	INSERT INTO SiteData.WeaponGroup (WeaponGroupName)
	VALUES (''Lightning Gun'')

	SET @GroupID = @@IDENTITY

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_LIGHTNING''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	--Group: Machine Gun
	INSERT INTO SiteData.WeaponGroup (WeaponGroupName)
	VALUES (''Machine Gun'')

	SET @GroupID = @@IDENTITY

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_MACHINEGUN''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	--Group: Nailgun
	INSERT INTO SiteData.WeaponGroup (WeaponGroupName)
	VALUES (''Nailgun'')

	SET @GroupID = @@IDENTITY

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_NAIL''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	--Group: Plasma Gun
	INSERT INTO SiteData.WeaponGroup (WeaponGroupName)
	VALUES (''Plasma Gun'')

	SET @GroupID = @@IDENTITY

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_PLASMA''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_PLASMA_SPLASH''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	--Group: Proximity Mine
	INSERT INTO SiteData.WeaponGroup (WeaponGroupName)
	VALUES (''Proximity Mine'')

	SET @GroupID = @@IDENTITY

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_PROXIMITY_MINE''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	--Group: Railgun
	INSERT INTO SiteData.WeaponGroup (WeaponGroupName)
	VALUES (''Railgun'')

	SET @GroupID = @@IDENTITY

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_RAILGUN''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	--Group: Rocket Launcher
	INSERT INTO SiteData.WeaponGroup (WeaponGroupName)
	VALUES (''Rocket Launcher'')

	SET @GroupID = @@IDENTITY

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_ROCKET''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_ROCKET_SPLASH''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	--Group: Shotgun
	INSERT INTO SiteData.WeaponGroup (WeaponGroupName)
	VALUES (''Shotgun'')

	SET @GroupID = @@IDENTITY

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_SHOTGUN''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	--Group: Telefrag
	INSERT INTO SiteData.WeaponGroup (WeaponGroupName)
	VALUES (''Tele-Frag'')

	SET @GroupID = @@IDENTITY

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_TELEFRAG''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	--Group: The World
	INSERT INTO SiteData.WeaponGroup (WeaponGroupName)
	VALUES (''The World'')

	SET @GroupID = @@IDENTITY

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_CRUSH''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_FALLING''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_JUICED''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)
	
	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_LAVA''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_TRIGGER_HURT''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	SELECT @WeaponID = w.WeaponID
	FROM CalculatedData.Weapon w
	WHERE w.WeaponName = ''MOD_WATER''

	INSERT INTO SiteData.WeaponToWeaponGroup (fkWeaponID, fkWeaponGroupID)
	VALUES (@WeaponID, @GroupID)

	--Finally, link weapons to items
	DECLARE @ItemID INT

	SELECT @ItemID = i.ItemID
	FROM CalculatedData.Item i
	WHERE i.ItemName = ''WEAPON_LIGHTNING''

	UPDATE CalculatedData.Weapon 
	SET fkItemID = @ItemID
	WHERE WeaponName IN (''MOD_LIGHTNING'')

	SELECT @ItemID = i.ItemID
	FROM CalculatedData.Item i
	WHERE i.ItemName = ''WEAPON_PLASMAGUN''

	UPDATE CalculatedData.Weapon 
	SET fkItemID = @ItemID
	WHERE WeaponName IN (''MOD_PLASMA'', ''MOD_PLASMA_SPLASH'')

	SELECT @ItemID = i.ItemID
	FROM CalculatedData.Item i
	WHERE i.ItemName = ''WEAPON_ROCKETLAUNCHER''

	UPDATE CalculatedData.Weapon 
	SET fkItemID = @ItemID
	WHERE WeaponName IN (''MOD_ROCKET'', ''MOD_ROCKET_SPLASH'')

	SELECT @ItemID = i.ItemID
	FROM CalculatedData.Item i
	WHERE i.ItemName = ''WEAPON_SHOTGUN''

	UPDATE CalculatedData.Weapon 
	SET fkItemID = @ItemID
	WHERE WeaponName IN (''MOD_SHOTGUN'')

	SELECT @ItemID = i.ItemID
	FROM CalculatedData.Item i
	WHERE i.ItemName = ''WEAPON_GRENADELAUNCHER''

	UPDATE CalculatedData.Weapon 
	SET fkItemID = @ItemID
	WHERE WeaponName IN (''MOD_GRENADE'', ''MOD_GRENADE_SPLASH'')

	SELECT @ItemID = i.ItemID
	FROM CalculatedData.Item i
	WHERE i.ItemName = ''WEAPON_RAILGUN''

	UPDATE CalculatedData.Weapon 
	SET fkItemID = @ItemID
	WHERE WeaponName IN (''MOD_RAILGUN'')

	SELECT @ItemID = i.ItemID
	FROM CalculatedData.Item i
	WHERE i.ItemName = ''WEAPON_CHAINGUN''

	UPDATE CalculatedData.Weapon 
	SET fkItemID = @ItemID
	WHERE WeaponName IN (''MOD_CHAINGUN'')

	SELECT @ItemID = i.ItemID
	FROM CalculatedData.Item i
	WHERE i.ItemName = ''WEAPON_PROX_LAUNCHER''

	UPDATE CalculatedData.Weapon 
	SET fkItemID = @ItemID
	WHERE WeaponName IN (''MOD_PROXIMITY_MINE'')

	SELECT @ItemID = i.ItemID
	FROM CalculatedData.Item i
	WHERE i.ItemName = ''WEAPON_NAILGUN''

	UPDATE CalculatedData.Weapon 
	SET fkItemID = @ItemID
	WHERE WeaponName IN (''MOD_NAIL'')

	SELECT @ItemID = i.ItemID
	FROM CalculatedData.Item i
	WHERE i.ItemName = ''WEAPON_MACHINEGUN''

	UPDATE CalculatedData.Weapon 
	SET fkItemID = @ItemID
	WHERE WeaponName IN (''MOD_MACHINEGUN'')

	SELECT @ItemID = i.ItemID
	FROM CalculatedData.Item i
	WHERE i.ItemName = ''WEAPON_BFG''

	UPDATE CalculatedData.Weapon 
	SET fkItemID = @ItemID
	WHERE WeaponName IN (''MOD_BFG'', ''MOD_BFG_SPLASH'')

	SELECT @ItemID = i.ItemID
	FROM CalculatedData.Item i
	WHERE i.ItemName = ''HOLDABLE_KAMIKAZE''

	UPDATE CalculatedData.Weapon 
	SET fkItemID = @ItemID
	WHERE WeaponName IN (''MOD_KAMIKAZE'', ''MOD_SUICIDE'')









END
' 
END
GO

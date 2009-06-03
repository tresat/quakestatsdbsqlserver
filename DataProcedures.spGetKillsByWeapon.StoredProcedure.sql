SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DataProcedures].[spGetKillsByWeapon]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 5/31/09
-- Description:	Retrieves number of kills by weapon.
-- =============================================
CREATE PROCEDURE [DataProcedures].[spGetKillsByWeapon]
	@pProcSpecificParam0 bit = 1, --SortCountedGamesOnly
	@pProcSpecificParam1 int = NULL --Map ID
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @TotalKills float

	SELECT @TotalKills = CAST(COUNT(*) as float)
	FROM CalculatedData.[Kill] k
		INNER JOIN CalculatedData.Game g ON k.fkGameID = g.GameID
	WHERE g.IsToBeCounted = @pProcSpecificParam0
		AND (@pProcSpecificParam1 IS NULL OR g.fkMapID = @pProcSpecificParam1)

	SELECT w.WeaponName, CAST((CAST(COUNT(*) as float) / @TotalKills) * 100 AS decimal(5, 2)) AS Kills
	FROM CalculatedData.[Kill] k
		INNER JOIN CalculatedData.Weapon w ON k.fkWeaponID = w.WeaponID
		INNER JOIN CalculatedData.Game g ON k.fkGameID = g.GameID
	WHERE g.IsToBeCounted = @pProcSpecificParam0
		AND (@pProcSpecificParam1 IS NULL OR g.fkMapID = @pProcSpecificParam1)
	GROUP BY w.WeaponName
	ORDER BY w.WeaponName
END
' 
END
GO

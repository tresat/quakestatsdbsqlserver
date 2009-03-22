/****** Object:  StoredProcedure [Calculations].[spCreateMaps]    Script Date: 03/22/2009 17:07:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Calculations].[spCreateMaps]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 3/22/09
-- Description:	Creates Map records for all games, links them to game records.
-- =============================================
CREATE PROCEDURE [Calculations].[spCreateMaps]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Create a new map record for each distinct map name in gameinfo,
	-- which doesn''t already exist in the maps table
	INSERT INTO CalculatedData.Map(MapName)
	SELECT DISTINCT gd.DataValue
	FROM CalculatedData.GameData gd
	WHERE gd.DataKey = ''mapname''
		AND NOT gd.DataValue IN (
			SELECT DISTINCT m.MapName
			FROM CalculatedData.Map m
		)

	-- Assign each game not already assigned to a map to its map
	UPDATE CalculatedData.Game
	SET fkMapID = (
		SELECT m.MapID
		FROM CalculatedData.Map m
		WHERE m.MapName = gd.DataValue
	)
	FROM CalculatedData.Game g
		INNER JOIN CalculatedData.GameData gd ON gd.fkGameID = g.GameID
	WHERE gd.DataKey = ''mapname''
END
' 
END
GO

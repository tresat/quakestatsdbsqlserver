SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Calculations].[spGetFlagEvents]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 3/21/09
-- Description:	gets ordered list of flag-relevant events
-- =============================================
CREATE PROCEDURE [Calculations].[spGetFlagEvents] 
	-- Add the parameters for the stored procedure here
	@GameID int = 0
WITH EXECUTE AS ''dbo''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Ensure GameEvents doesn''t exist, so the select into will work
	IF EXISTS (
		SELECT 1
		FROM sys.objects 
		WHERE object_id = OBJECT_ID(N''CalculatedData.GameEvents'') 
			AND type in (N''U'')
	)
		BEGIN
			DROP TABLE CalculatedData.GameEvents
		END

	--Populate GameEvents table
	SELECT * 
	INTO CalculatedData.GameEvents
	FROM (
		-- Get all flag captures (item pickups where item is the flag)
		SELECT NULL AS PrimaryID, ci.ClientToItemID AS EventID, ci.fkGameID AS GameID,
			ci.ServerItemTime AS EventTime, ci.fkItemLineNumber AS [LineNo], ''ITEM'' AS EventType,
			ci.fkClientID AS ClientID1, Calculations.fnGetTeamColor(c1.TeamLogID) AS ClientTeam1,
			NULL AS ClientID2, NULL AS ClientTeam2,
			i.ItemName AS ItemName, NULL AS WeaponName
		FROM CalculatedData.ClientToItem ci
			INNER JOIN CalculatedData.Item i ON i.ItemID = ci.fkItemID 
			INNER JOIN CalculatedData.Client c1 ON c1.ClientID = ci.fkClientID 
		WHERE(ci.fkGameID = @GameID) 
			AND ItemName IN (''team_CTF_redflag'', ''team_CTF_blueflag'') 
	UNION  
		-- Get all kills
		SELECT NULL AS PrimaryID, k.KillID AS EventID, k.fkGameID AS GameID,  
			k.ServerKillTime AS EventTime, k.fkKillLineNumber AS [LineNo], ''KILL'' AS EventType,  
			k.fkKillerClientID AS ClientID1, Calculations.fnGetTeamColor(c1.TeamLogID) AS ClientTeam1, 
			k.fkVictimClientID AS ClientID2, Calculations.fnGetTeamColor(c2.TeamLogID) AS ClientTeam2,  
			NULL AS ItemName, w.WeaponName  
		FROM CalculatedData.[Kill] k  
			LEFT JOIN CalculatedData.Client c1 ON c1.ClientID = k.fkKillerClientID  
			INNER JOIN CalculatedData.Client c2 ON c2.ClientID = k.fkVictimClientID  
			INNER JOIN CalculatedData.Weapon w ON w.weaponID = k.fkweaponID  
		WHERE(k.fkGameID = @GameID)  
	UNION  
		-- Get all final end of a client (where client does not continue on)
		SELECT NULL AS PrimaryID, c.ClientID AS EventID, c.fkGameID AS GameID,  
			c.ServerEndTime AS EventTime, c.ClientEndLineNumber AS [LineNo], ''END'' AS EventType,  
			c.ClientID AS ClientID1, Calculations.fnGetTeamColor(c.TeamLogID) AS ClientTeam1,  
			NULL AS ClientID2, NULL AS ClientTeam2,  
			NULL AS ItemName, NULL AS WeaponName 
		FROM CalculatedData.Client c 
		WHERE(c.fkGameID = @GameID) 
			AND c.ServerEndTime IS NOT NULL
			AND c.fkNextClientID IS NULL
	UNION
		-- Get all client name/other info changes, where team remains the same
		SELECT NULL AS PrimaryID, c.ClientID AS EventID, c.fkGameID AS GameID,  
			c.ServerEndTime AS EventTime, c.ClientEndLineNumber AS [LineNo], ''NUMBERCHANGE'' AS EventType,  
			c.ClientID AS ClientID1, Calculations.fnGetTeamColor(c.TeamLogID) AS ClientTeam1,  
			nc.ClientID AS ClientID2, Calculations.fnGetTeamColor(nc.TeamLogID) AS ClientTeam2,  
			NULL AS ItemName, NULL AS WeaponName 
		FROM CalculatedData.Client c 
			INNER JOIN CalculatedData.Client nc ON nc.ClientID = c.fkNextClientID
		WHERE(c.fkGameID = @GameID) 
			AND c.ServerEndTime IS NOT NULL
			AND c.TeamLogID = nc.TeamLogID
	UNION
		-- Get all client team changes
		SELECT NULL AS PrimaryID, c.ClientID AS EventID, c.fkGameID AS GameID,  
			c.ServerEndTime AS EventTime, c.ClientEndLineNumber AS [LineNo], ''TEAMCHANGE'' AS EventType,  
			c.ClientID AS ClientID1, Calculations.fnGetTeamColor(c.TeamLogID) AS ClientTeam1,  
			nc.ClientID AS ClientID2, Calculations.fnGetTeamColor(nc.TeamLogID) AS ClientTeam2,  
			NULL AS ItemName, NULL AS WeaponName 
		FROM CalculatedData.Client c 
			INNER JOIN CalculatedData.Client nc ON nc.ClientID = c.fkNextClientID
		WHERE(c.fkGameID = @GameID) 
			AND c.ServerEndTime IS NOT NULL
			AND c.fkNextClientID IS NULL
			AND c.TeamLogID <> nc.TeamLogID
	) AS Events
	ORDER BY EventTime, [LineNo]

	--Populate primary IDs on game events table, starting at 0 and incrementing for each row
	-- NOTE: we start at 0 because the row indexing of the data table we''ll later be loading this
	-- data into uses 0-based row indexing
	DECLARE curEvent CURSOR FOR SELECT [LineNo], [EventID] FROM CalculatedData.GameEvents
	DECLARE @LineNo int
	DECLARE @EventID int
	DECLARE @CurrentID int 
	SET @CurrentID = 0

	OPEN curEvent

	FETCH NEXT FROM curEvent INTO @LineNo, @EventID

	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		UPDATE CalculatedData.GameEvents 
		SET PrimaryID = @CurrentID
		WHERE [LineNo] = @LineNo
			AND EventID = @EventID

		SET @CurrentID = @CurrentID + 1

		FETCH NEXT FROM curEvent INTO @LineNo, @EventID
	END

	CLOSE curEvent
	DEALLOCATE curEvent

	--Set up table with primary key on column PrimaryID, CRUD access so we can use this key
	--later for finding/swapping rows
	ALTER TABLE CalculatedData.GameEvents ALTER COLUMN PrimaryID int NOT NULL 
	--ALTER TABLE CalculatedData.GameEvents ADD CONSTRAINT pk_events PRIMARY KEY (PrimaryID)
	GRANT SELECT, UPDATE, INSERT, DELETE ON CalculatedData.GameEvents TO PUBLIC
	
	--Return game events
	SELECT *
	FROM CalculatedData.GameEvents
END' 
END
GO

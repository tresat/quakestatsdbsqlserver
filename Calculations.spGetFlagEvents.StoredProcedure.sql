/****** Object:  StoredProcedure [Calculations].[spGetFlagEvents]    Script Date: 03/22/2009 17:07:52 ******/
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
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT ci.ClientToItemID AS EventID, ci.fkGameID AS GameID,
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
	SELECT k.KillID AS EventID, k.fkGameID AS GameID,  
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
	SELECT c.ClientID AS EventID, c.fkGameID AS GameID,  
	   c.ServerEndTime AS EventTime, c.ClientEndLineNumber AS [LineNo], ''END'' AS EventType,  
	   c.ClientID AS ClientID1, Calculations.fnGetTeamColor(c.TeamLogID) AS ClientTeam1,  
	   NULL AS ClientID2, NULL AS ClientTeam2,  
	   NULL AS ItemName, NULL AS WeaponName 
	FROM CalculatedData.Client c 
	WHERE(c.fkGameID = @GameID) 
	   AND c.ServerEndTime IS NOT NULL
	ORDER BY EventTime, [LineNo]
END
' 
END
GO

/****** Object:  UserDefinedFunction [Calculations].[fnGetPreviousGame]    Script Date: 03/22/2009 17:07:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Calculations].[fnGetPreviousGame]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 3/22/09
-- Description:	Links a game to its previous game.
-- =============================================
CREATE FUNCTION [Calculations].[fnGetPreviousGame] 
(
	-- Add the parameters for the function here
	@GameID int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	SET @Result = (
		IsNull(
			(
				/* First try selecting to same uppage */
				SELECT g2.GameID
				FROM CalculatedData.Game g
					INNER JOIN CalculatedData.Game g2 ON g.fkServerUppageID = g2.fkServerUppageID
				WHERE g.GameID <> g2.GameID
					AND g2.ServerInitTime <= g.ServerInitTime
					AND NOT EXISTS (
					  SELECT 1
					  FROM CalculatedData.Game g3
					  WHERE g3.fkServerUppageID = g.fkServerUppageID
						AND g3.GameID <> g.GameID
						AND g3.GameID <> g2.GameID
						AND g3.ServerInitTime BETWEEN g2.ServerInitTime AND g.ServerInitTime
					)
					AND g.GameID = @GameID
			), (
				/* If that fails, select last game from previous uppage */
				SELECT g.GameID
				FROM CalculatedData.Game g
				WHERE g.fkServerUppageID = (
					SELECT su.ServerUppageID
					FROM CalculatedData.ServerUppage su
					WHERE su.ServerUppageID = (
						SELECT su2.fkPreviousServerUppageID
						FROM CalculatedData.Game g2
							INNER JOIN CalculatedData.ServerUppage su2 ON su2.ServerUppageID = g2.fkServerUppageID
						WHERE g2.GameID = @GameID
					)
				)
					AND g.ServerInitTime = (
						SELECT Max(g2.ServerInitTime)
						FROM games g2
						WHERE g2.fkServerUppageID = g.fkServerUppageID
					)
			)
		)
	)

	-- Return the result of the function
	RETURN @Result
END
' 
END
GO

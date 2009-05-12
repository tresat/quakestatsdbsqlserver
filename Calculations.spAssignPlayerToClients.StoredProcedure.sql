SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Calculations].[spAssignPlayerToClients]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 4/30/09
-- Description:	Adds an association between a player and a client (and all linked clients forwards and backwards).
-- =============================================
CREATE PROCEDURE [Calculations].[spAssignPlayerToClients] 
	-- Add the parameters for the stored procedure here
	@PlayerID int,
	@StartClientID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON

	DECLARE @ClientID INT

	/* Insert the start client ID */
	INSERT INTO SiteData.PlayerToClient (fkPlayerID, fkClientID)
	VALUES (@PlayerID, @StartClientID)

	/* Train backwards from given client using previous ids. */
	SET @ClientID = @StartClientID
    WHILE 1 = 1
		BEGIN
			SET @ClientID = (
				SELECT c.fkPreviousClientID 
				FROM CalculatedData.Client c 
				WHERE c.ClientID = @ClientID
			)

			IF @ClientID IS NULL BREAK
			
			INSERT INTO SiteData.PlayerToClient (fkPlayerID, fkClientID)
			VALUES (@PlayerID, @ClientID);
		END

	/* Train forwards from given client using next ids. */
	SET @ClientID = @StartClientID
    WHILE 1 = 1
		BEGIN
			SET @ClientID = (
				SELECT c.fkNextClientID 
				FROM CalculatedData.Client c 
				WHERE c.ClientID = @ClientID
			)

			IF @ClientID IS NULL BREAK
			
			INSERT INTO SiteData.PlayerToClient (fkPlayerID, fkClientID)
			VALUES (@PlayerID, @ClientID);
		END
END
' 
END
GO

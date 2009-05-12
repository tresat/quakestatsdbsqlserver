SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Calculations].[spLinkClientsToAliases]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 4/29/09
-- Description:	Will assign the specified client, and all connected clients (which can be determined) of the same name to the same alias, creating that alias if nessecary.
-- =============================================
CREATE PROCEDURE [Calculations].[spLinkClientsToAliases]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON	

	DECLARE @ClientID INT
	DECLARE @ClientName VARCHAR(255)
	DECLARE @PreviousClientID INT
	DECLARE @NextClientID INT

	DECLARE @AliasID INT
	DECLARE @PreviousAliasID INT

	DECLARE curClients CURSOR FOR
	SELECT c.ClientID, c.ClientName, c.fkPreviousClientID, c.fkNextClientID
	FROM CalculatedData.Client c
	WHERE NOT EXISTS (
		SELECT 1
		FROM CalculatedData.AliasToClient ac
		WHERE ac.fkClientID = c.clientID
	)
	ORDER BY c.fkGameID, c.clientID

	OPEN curClients

	FETCH NEXT FROM curClients 
	INTO @ClientID, @ClientName, @PreviousClientID, @NextClientID

	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		/* Select a CURRENT alias (nextID not yet set) which matches the client name,
		if it exists. */
		SET @AliasID = IsNull(
			(
				SELECT a.AliasID
				FROM CalculatedData.Alias a
				WHERE a.AliasName = @ClientName
					AND a.fkNextAliasID IS NULL
			), 0
		)

		IF @AliasID = 0 
			BEGIN
				/* Create an alias for the client name, since one doesn''t already exist. */
				INSERT INTO CalculatedData.Alias (AliasName)
				VALUES (@ClientName);

				-- Get the created alias ID
				SET @AliasID = @@IDENTITY;

				-- Link the current client to it
				INSERT INTO CalculatedData.AliasToClient (fkAliasID, fkClientID)
				VALUES (@AliasID, @ClientID);

				-- Check to update the next/previous alias IDs
				IF NOT @PreviousClientID IS NULL
					BEGIN
						-- The current client has a previous client, grab its alias info
						SET @PreviousAliasID = (
							SELECT ac.fkAliasID 
							FROM CalculatedData.AliasToClient ac 
							WHERE ac.fkClientID = @PreviousClientID
						)
					END

				-- Update the next/previous fields on the previous/current aliases
				UPDATE CalculatedData.Alias 
				SET fkNextAliasID = @AliasID 
				WHERE AliasID = @PreviousAliasID
			
				UPDATE CalculatedData.Alias 
				SET fkPreviousAliasID = @PreviousAliasID 
				WHERE AliasID = @AliasID;
			END
		ELSE
			BEGIN
				/* Link the client to the alias we grabbed. */
				INSERT INTO CalculatedData.AliasToClient (fkAliasID, fkClientID)
				VALUES (@AliasID, @ClientID);
			END

		FETCH NEXT FROM curClients
		INTO @ClientID, @ClientName, @PreviousClientID, @NextClientID
	END

	CLOSE curClients
	DEALLOCATE curClients
END
' 
END
GO

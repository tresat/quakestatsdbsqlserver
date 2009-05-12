SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Utility].[spResetFlagCalculations]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 4/26/09
-- Description:	Clears ALL flag-calculation related information from the DB
-- =============================================
CREATE PROCEDURE [Utility].[spResetFlagCalculations] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE CalculatedData.Game
	SET IsFlagCalculationsComplete = 0,
		IsFlagCalculationsFailed = 0

	UPDATE CalculatedData.ClientToItem
	SET IsFlagRecovery = 0,
		IsFlagSteal = 0,
		IsFlagCapture = 0,
		IsFlagPickup = 0

	UPDATE CalculatedData.[Kill]
	SET IsCarrierKill = 0

	DELETE FROM CalculatedData.SwapPoints
END
' 
END
GO
GRANT EXECUTE ON [Utility].[spResetFlagCalculations] TO [public]
GO

/****** Object:  UserDefinedFunction [Calculations].[fnGetMapName]    Script Date: 04/19/2009 22:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Calculations].[fnGetMapName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 3/22/09
-- Description:	Gets the map name in formatted form.
-- =============================================
CREATE FUNCTION [Calculations].[fnGetMapName] 
(
	-- Add the parameters for the function here
	@MapID int,
	@IncludeFileName bit = 0
)
RETURNS varchar(100)
AS
BEGIN
	DECLARE @Result varchar(100)

	SET @Result = (
		SELECT IsNull(m.MapAlias, m.MapName) + (
			CASE WHEN @IncludeFileName = 1 AND m.MapAlias IS NOT NULL THEN '' ('' + m.MapName + '')''
			ELSE '''' END
		)
		FROM CalculatedData.Map m
		WHERE m.MapID = @MapID
	)

	RETURN @Result
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Calculations].[fnGetMapName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 3/22/09
-- Description:	Gets the map name in formatted form.
-- =============================================
CREATE FUNCTION [Calculations].[fnGetMapName] 
(
	-- Add the parameters for the function here
	@MapID int,
	@IncludeFileName bit = 0
)
RETURNS varchar(100)
AS
BEGIN
	DECLARE @Result varchar(100)

	SET @Result = (
		SELECT IsNull(m.MapAlias, m.MapName) + (
			CASE WHEN @IncludeFileName = 1 AND m.MapAlias IS NOT NULL THEN '' ('' + m.MapName + '')''
			ELSE '''' END
		)
		FROM CalculatedData.Map m
		WHERE m.MapID = @MapID
	)

	RETURN @Result
END
' 
END
GO

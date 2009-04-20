/****** Object:  UserDefinedDataType [LogFileData].[udtLogTimestamp]    Script Date: 04/19/2009 22:46:58 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udtLogTimestamp' AND ss.name = N'LogFileData')
CREATE TYPE [LogFileData].[udtLogTimestamp] FROM [varchar](7) NOT NULL
GO
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udtLogTimestamp' AND ss.name = N'LogFileData')
CREATE TYPE [LogFileData].[udtLogTimestamp] FROM [varchar](7) NOT NULL
GO

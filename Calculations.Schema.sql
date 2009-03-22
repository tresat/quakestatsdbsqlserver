/****** Object:  Schema [Calculations]    Script Date: 03/22/2009 17:07:47 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Calculations')
EXEC sys.sp_executesql N'CREATE SCHEMA [Calculations] AUTHORIZATION [dbo]'
GO
GRANT ALTER ON SCHEMA::[Calculations] TO [QuakeStats]
GO
GRANT CONTROL ON SCHEMA::[Calculations] TO [QuakeStats]
GO
GRANT DELETE ON SCHEMA::[Calculations] TO [QuakeStats]
GO
GRANT EXECUTE ON SCHEMA::[Calculations] TO [QuakeStats]
GO
GRANT INSERT ON SCHEMA::[Calculations] TO [QuakeStats]
GO
GRANT REFERENCES ON SCHEMA::[Calculations] TO [QuakeStats]
GO
GRANT SELECT ON SCHEMA::[Calculations] TO [QuakeStats]
GO
GRANT UPDATE ON SCHEMA::[Calculations] TO [QuakeStats]
GO
GRANT VIEW DEFINITION ON SCHEMA::[Calculations] TO [QuakeStats]
GO

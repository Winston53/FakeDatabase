CREATE PROCEDURE [dbo].[sp_GetDatabaseInfo]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        DB_NAME() AS DatabaseName,
        @@SERVERNAME AS ServerName,
        GETDATE() AS CurrentDateTime,
        'PR validation test' AS Note;
END;
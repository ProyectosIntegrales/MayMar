-- =============================================
-- Author:		Gabriel Estrada
-- Create date: 2020-04-25
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spServers]
	-- Add the parameters for the stored procedure here
	@Action char(3),
	@id int = 0,
	@ServerName nvarchar(200) = '',
	@DatabaseName nvarchar(200) = ''
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @Action = 'ADD'
	BEGIN
		INSERT INTO tblServers (ServerName, DatabaseName)
			VALUES(@ServerName, @DatabaseName)
	END

	IF @Action = 'UPD'
	BEGIN
		UPDATE tblServers
			SET ServerName = @ServerName,
				DatabaseName = @DatabaseName
			WHERE ID = @id
	END

	IF @Action = 'DEL'
	BEGIN
		DELETE tblServers WHERE ID = @id
	END
END



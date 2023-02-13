-- =============================================
-- Author:		Gabriel Estrada
-- Create date: 2020-04-25
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUsers]
	-- Add the parameters for the stored procedure here
	@Action char(3),
	@Username varchar(50),
	@Nombre varchar(150) = '',
	@Email varchar(300) = '',
	@Server int = 0,
	@Password varchar(50) = '',
	@Priv Int = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @Action = 'ADD'
	BEGIN
		INSERT INTO tblUsers (Username, Nombre, Email, [Password], Priv, ServerID)
			VALUES(@Nombre, @Username, @Email, @Password, @Priv, @Server)
	END

	IF @Action = 'UPD'
	BEGIN
		UPDATE tblUsers
			SET Nombre = @Nombre,
				Email = @Email,
				Priv = @Priv,
				ServerID = @Server
			WHERE Username = @Username
	END

	IF @Action = 'DEL'
	BEGIN
		DELETE tblUsers WHERE Username = @Username
	END

	IF @Action = 'PWD'
	BEGIN
		UPDATE tblUsers
			SET [Password] = @Password
		WHERE Username = @Username
	END
END


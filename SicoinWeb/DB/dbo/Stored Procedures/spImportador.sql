-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE spImportador
	-- Add the parameters for the stored procedure here
	@Action char(3),
	@Clave char(5),
	@Nombre char(80) = '',
	@Direccion char(80) = ''
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @Action = 'ADD'
	BEGIN
		INSERT INTO Importador (Clave, Nombre, Direccion)
			VALUES(@Clave, @Nombre, @Direccion)
	END

	IF @Action = 'UPD'
	BEGIN
		UPDATE Importador
			SET Nombre = @Nombre,
				Direccion = @Direccion
			WHERE Clave = @Clave
	END

	IF @Action = 'DEL'
	BEGIN
		DELETE Importador WHERE Clave = @Clave
	END
END

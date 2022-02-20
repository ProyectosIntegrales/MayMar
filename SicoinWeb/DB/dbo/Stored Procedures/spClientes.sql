-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE spClientes
	-- Add the parameters for the stored procedure here
	@Action char(3),
	@Clave char(5),
	@Nombre char(80) = '',
	@RSocial char(80) = '',
	@Rfc char(14) = '',
	@Direccion char(110) = '',
	@Patente char(4) = ''
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @Action = 'ADD'
	BEGIN
		INSERT INTO Clientes (Clave, Nombre, RSocial, Rfc, Direccion, Patente)
			VALUES(@Clave, @Nombre, @RSocial, @Rfc, @Direccion, @Patente)
	END

	IF @Action = 'UPD'
	BEGIN
		UPDATE Clientes
			SET Nombre = @Nombre,
				RSocial = @RSocial,
				Rfc = @Rfc,
				Direccion = @Direccion,
				Patente = @Patente
			WHERE Clave = @Clave
	END

	IF @Action = 'DEL'
	BEGIN
		DELETE Clientes WHERE Clave = @Clave
	END
END

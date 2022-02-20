-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE spMedidas
	-- Add the parameters for the stored procedure here
	@Action char(3),
	@Clave char(5),
	@Descripcion char(20) = ''
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @Action = 'ADD'
	BEGIN
		INSERT INTO Medidas (Clave, Descripcion)
			VALUES(@Clave, @Descripcion)
	END

	IF @Action = 'UPD'
	BEGIN
		UPDATE Medidas
			SET Descripcion = @Descripcion
			WHERE Clave = @Clave
	END

	IF @Action = 'DEL'
	BEGIN
		DELETE Medidas WHERE Clave = @Clave
	END
END

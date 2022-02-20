
-- =============================================
-- Author:		Gabriel Estrada
-- Create date: Octubre 18
-- Description:	Agrega o Actualiza tabla de Exportadores
-- =============================================
CREATE PROCEDURE [dbo].[spAddUpdateExportadores]
	-- Add the parameters for the stored procedure here
	@ID int,
	@NombreExp varchar(100),
	@Direccion varchar(100),
	@Ciudad varchar(50),
	@RFC varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM tblExportadores WHERE ID = @ID)
		BEGIN
			UPDATE tblExportadores 
			SET NombreExp = @NombreExp,
				Direccion = @Direccion,
				Ciudad = @Ciudad,
				RFC = @RFC
			WHERE ID = @ID
		END
	ELSE
		BEGIN
			INSERT INTO tblExportadores
				(NombreExp, Direccion, Ciudad, RFC)
			VALUES (@NombreExp, @Direccion, @Ciudad, @RFC)
		END
END



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInventario_Ab]
	-- Add the parameters for the stored procedure here
	@Operacion char(20),
	@FechaDeclAb datetime,
	@FechaSalidaAb datetime = null,
	@NotaAb text = null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	SET NOCOUNT ON;
		 
    -- Insert statements for procedure here 

	UPDATE Inventario 
		SET FechaDeclAb = @FechaDeclAb,
			FechaSalidaAb = @FechaSalidaAb,
			NotaAb = @NotaAb
		WHERE Operacion = @Operacion

END


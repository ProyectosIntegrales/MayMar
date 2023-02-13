
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInventario_CFDI]
	-- Add the parameters for the stored procedure here
	@Operacion char(20),
	@Factura nchar(10),
	@CFDI nchar(36),
	@MontoCFDI float,
	@MontoCFDIDlls float,
	@Aprovechamiento float

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE Inventario 
		SET	Factura = @Factura,
			CFDI = @CFDI,
			MontoCFDI = @MontoCFDI,
			MontoCFDIDlls = @MontoCFDIDlls,
			Aprovechamiento = @Aprovechamiento,
			[Status] = 2
		WHERE Operacion = @Operacion

END



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInventario_All]
	-- Add the parameters for the stored procedure here
	@Operacion char(20),
	@NewOper char(20),
	@Caja char(10),
	@Mercancia char(70),
	@Fechain datetime,
	@Peso char(10),
	@Cajas float,
	@Cliente char(5),
	@Nombre char(100),
	@Rsocial char(120),
	@Valorc float,
	@Fraccion varchar(50),
	@UM numeric(18,0),
	@Importador char(100),
	@ClavePed char(10),
	@FechaAb datetime,
	@Contenedor char(90),
	@DirImp char(90),
	@Bultos char(90),
	@Fechaout datetime,
	@Descargado float,
	@Remanente float,
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
	Declare @hh int = datepart(Hour,@fechaout)
	Declare @hi int = datepart(Hour,@fechain)

	Declare @ap char(1), @api char(1)

	IF @hh > 12 
		BEGIN
			SET @hh = @hh -12
			SET @ap = 'p'
		END
		ELSE
			SET @ap = 'a'
		
	IF @hh = 0
		BEGIN
		SET @hh = 12
		SET @ap = 'a'
		END

	IF @hi > 12 
		BEGIN
			SET @hi = @hi -12
			SET @api = 'p'
		END
		ELSE
			SET @api = 'a'
		
	IF @hi = 0
		BEGIN
		SET @hi = 12
		SET @ap = 'a'
		END
		 
    -- Insert statements for procedure here 
	Declare @Horaout char(10) = replace(str(@hh,2),' ','0') + ':' +  replace(str(datepart(minute,@fechaout),2),' ','0') + ':' + replace(str(datepart(second,@fechaout),2),' ','0') + ' ' + @ap
	Declare @Horain char(10) = replace(str(@hi,2),' ','0') + ':' +  replace(str(datepart(minute,@fechain),2),' ','0') + ':' + replace(str(datepart(second,@fechain),2),' ','0') + ' ' + @api

	UPDATE Inventario 
		SET 
			Operacion = @NewOper,
			Caja = @Caja,
			Mercancia = @Mercancia,
			Fechain = @Fechain,
			@Horain = @Horain,
			Peso = @Peso,
			Cliente = @Cliente,
			Nombre = @Nombre,
			Cajas = @Cajas,
			RSocial = @Rsocial,
			Valorc  =@Valorc,
			Fraccion = @Fraccion,
			UM = @UM,
			Importador = @Importador,
			ClavePed = @ClavePed,
			Fechaab = @FechaAb,
			Contenedor = @Contenedor,
			DirImp = @DirImp,
			Bultos = @Bultos,
			Fechaout = @Fechaout,
			Horaout = @Horaout,
			Descargado = @Descargado,
			Remanente = @Remanente,
			Factura = @Factura,
			CFDI = @CFDI,
			MontoCFDI = @MontoCFDI,
			MontoCFDIDlls = @MontoCFDIDlls,
			Aprovechamiento = @Aprovechamiento
		WHERE Operacion = @Operacion

END


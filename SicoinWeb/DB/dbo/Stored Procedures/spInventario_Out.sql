-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInventario_Out]
	-- Add the parameters for the stored procedure here
	@Operacion char(20),
	@Caja char(20),
	@User char(50),
	@Fechaout datetime,
	@Descargado float,
	@Remanente float,
	@Terminado bit

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @hh int = datepart(Hour,@fechaout)
	Declare @ap char(1)

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
		 
    -- Insert statements for procedure here 
	Declare @Horaout char(10) = replace(str(@hh,2),' ','0') + ':' +  replace(str(datepart(minute,@fechaout),2),' ','0') + ':' + replace(str(datepart(second,@fechaout),2),' ','0') + ' ' + @ap

	UPDATE Inventario 
		SET Fechaout = @Fechaout,
			Horaout = @Horaout,
			DiasAlmacen = DATEDIFF(DAY,@Fechaout, Fechain) ,
			Descargado = @Descargado,
			Remanente = @Remanente,
			Terminado = @Terminado,
			[Status] = 1
		WHERE Operacion = @Operacion

	IF @Terminado = 1
		BEGIN
		INSERT INTO tblSalidas (Operacion, Caja, FechaTerminado, UserTerminado)
		VALUES (@Operacion, @Caja, @Fechaout, @User)
		END
END

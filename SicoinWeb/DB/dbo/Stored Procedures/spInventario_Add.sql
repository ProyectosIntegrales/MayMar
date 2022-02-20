-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInventario_Add]
-- Add the parameters for the stored procedure here
@Operacion char(20),
@Caja char(10),
@Mercancia char(70),
@Fechain datetime,
@Peso char(10),
@Cliente char(5),
@Nombre char(100),
@Rsocial char(120),
@Valorc float,
@Fraccion varchar(50),
@Cajas float,
@UM numeric(18,0),
@Importador char(100),
@ClavePed char(10),
@FechaAb datetime,
@Contenedor char(90),
@DirImp char(90),
@Bultos char(90)

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;
Declare @hh int = datepart(Hour,@fechain)
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
Declare @Horain char(10) = replace(str(@hh,2),' ','0') + ':' +  replace(str(datepart(minute,@fechain),2),' ','0') + ':' + replace(str(datepart(second,@fechain),2),' ','0') + ' ' + @ap

INSERT INTO Inventario (Operacion, Caja, Mercancia, Cajas, Fechain, Horain, Peso, Cliente, Nombre, RSocial, Valorc, Fraccion, UM, Importador, DirImp, ClavePed, Fechaab, Contenedor, Bultos, Remanente)
VALUES (@Operacion, @Caja, @Mercancia, @Cajas, @Fechain, @Horain,  @Peso, @Cliente, @Nombre, @Rsocial, @Valorc, @Fraccion, @UM, @Importador, @DirImp, @ClavePed, @FechaAb, @Contenedor, @Bultos, @Peso)

END
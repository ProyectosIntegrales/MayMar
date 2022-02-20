


-- =============================================
-- Author:		Gabriel Estrada
-- Create date: Octubre, 12,2017
-- Description:	Actualiza tabla tblAnexo29
-- =============================================
CREATE PROCEDURE [dbo].[spAnexo29] 
	-- Add the parameters for the stored procedure here
	@Action char(3),
	@Folio int,
	@FolioTipo nchar(10),
	@FolioTexto varchar(50),
	@Fecha datetime = GETDATE,
	@Descripcion varchar(max) = '',
	@PesoNeto decimal(18, 3) = 0,
	@Regimen nchar(10) = '',
	@Pedimento varchar(50) = '',
	@Motivo varchar(max) = '',
	@NoContenedor varchar(50) = '',
	@Medida varchar(50) = '',
	@Tipo varchar(50) = '',
	@Sellos varchar(50) = '',
	@PesoBruto int = 0,
	@NombreExp varchar(100) = '',
	@Direccion varchar(100) = '',
	@Ciudad varchar(50) = '',
	@RFC varchar(50) = '',
	@NombreTransporte varchar(100) = '',
	@Placas varchar(50) = '',
	@NoEconomico varchar(50) = '',
	@CAAT varchar(50) = '',
	@NombreOperador varchar(100) = '',
	@NoLicencia varchar(50) = '',
	@NombreAgente varchar(100) = '',
	@Patente nchar(10) = '',
	@Username varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @Action = 'A'
		BEGIN
			INSERT INTO [dbo].[tblAnexo29]
					   ([Year]
					   ,[Folio]
					   ,[FolioTipo]
					   ,[FolioTexto]
					   ,[Fecha]
					   ,[Descripcion]
					   ,[PesoNeto]
					   ,[Regimen]
					   ,[Pedimento]
					   ,[Motivo]
					   ,[NoContenedor]
					   ,[Medida]
					   ,[Tipo]
					   ,[Sellos]
					   ,[PesoBruto]
					   ,[NombreExp]
					   ,[Direccion]
					   ,[Ciudad]
					   ,[RFC]
					   ,[NombreTransporte]
					   ,[Placas]
					   ,[NoEconomico]
					   ,[CAAT]
					   ,[NombreOperador]
					   ,[NoLicencia]
					   ,[NombreAgente]
					   ,[Patente]
					   ,[Username])
				 VALUES
					   (DATEPART(YYYY, GETDATE())
					   ,@Folio
					   ,@FolioTipo
					   ,@FolioTexto
					   ,@Fecha
					   ,@Descripcion
					   ,@PesoNeto
					   ,@Regimen
					   ,@Pedimento
					   ,@Motivo
					   ,@NoContenedor
					   ,@Medida
					   ,@Tipo
					   ,@Sellos
					   ,@PesoBruto
					   ,@NombreExp
					   ,@Direccion
					   ,@Ciudad
					   ,@RFC
					   ,@NombreTransporte
					   ,@Placas
					   ,@NoEconomico
					   ,@CAAT
					   ,@NombreOperador
					   ,@NoLicencia
					   ,@NombreAgente
					   ,@Patente
					   ,@Username)


		END
	IF @Action = 'U'
		BEGIN

			UPDATE [dbo].[tblAnexo29]
			   SET [Descripcion] = @Descripcion
				  ,[Fecha] = @Fecha
				  ,[FolioTipo] = @FolioTipo
				  ,[PesoNeto] = @PesoNeto
				  ,[Regimen] = @Regimen
				  ,[Pedimento] = @Pedimento
				  ,[Motivo] = @Motivo
				  ,[NoContenedor] = @NoContenedor
				  ,[Medida] = @Medida
				  ,[Tipo] = @Tipo
				  ,[Sellos] = @Sellos
				  ,[PesoBruto] = @PesoBruto
				  ,[NombreExp] = @NombreExp
				  ,[Direccion] = @Direccion
				  ,[Ciudad] = @Ciudad
				  ,[RFC] = @RFC
				  ,[NombreTransporte] = @NombreTransporte
				  ,[Placas] = @Placas
				  ,[NoEconomico] = @NoEconomico
				  ,[CAAT] = @CAAT
				  ,[NombreOperador] = @NombreOperador
				  ,[NoLicencia] = @NoLicencia
				  ,[NombreAgente] = @NombreAgente
				  ,[Patente] = @Patente
				  ,[Username] = @Username
			 WHERE FolioTexto = @FolioTexto
		END
	IF @Action = 'D'
		BEGIN

			DELETE FROM [dbo].[tblAnexo29]
				  WHERE FolioTexto = @FolioTexto

		END
END




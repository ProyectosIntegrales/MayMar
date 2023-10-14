Imports Microsoft.VisualBasic

Public Class Migrations
    Public Sub ImplementMigrations()
        Migrations_2022()
        Migrations_2023()
    End Sub

    Public Sub Migrations_2022()
        NewMigration(
            MigrationName:="20220219100000_Crear Tabla tblSalidas",
            MigrationCommand:=
                "CREATE TABLE [dbo].[tblSalidas](" &
                "[ID] [int] IDENTITY(1,1) NOT NULL," &
                "[Operacion] [nvarchar](max) NOT NULL," &
                "[Caja] [nchar](10) NULL," &
                "[FechaTerminado] [datetime] NULL," &
                "[UserTerminado] [nvarchar](50) NULL," &
                "[FechaSalida] [datetime] NULL," &
                "[UserSalida] [nvarchar](50) NULL" &
                ") ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]"
                )

        NewMigration(
            MigrationName:="20220219110000_Alter spInventario_Out",
            MigrationCommand:=
                "ALTER PROCEDURE [dbo].[spInventario_Out] @Operacion char(20), @Caja char(20), @User char(50), @Fechaout datetime, @Descargado float, @Remanente float, @Terminado bit AS " &
                "BEGIN " &
                "SET NOCOUNT ON; " &
                "Declare @hh int = datepart(Hour,@fechaout) " &
                "Declare @ap char(1) " &
                "IF @hh > 12 " &
                "BEGIN " &
                "SET @hh = @hh -12 " &
                "SET @ap = 'p' " &
                "END " &
                "ELSE " &
                "SET @ap = 'a' " &
                "IF @hh = 0 " &
                "BEGIN " &
                "SET @hh = 12 " &
                "SET @ap = 'a' " &
                "END " &
                "Declare @Horaout char(10) = replace(str(@hh,2),' ','0') + ':' +  replace(str(datepart(minute,@fechaout),2),' ','0') + ':' + replace(str(datepart(second,@fechaout),2),' ','0') + ' ' + @ap " &
                "UPDATE Inventario " &
                "SET Fechaout = @Fechaout," &
                "Horaout = @Horaout," &
                "DiasAlmacen = DATEDIFF(DAY,@Fechaout, Fechain) ," &
                "Descargado = @Descargado," &
                "Remanente = @Remanente," &
                "Terminado = @Terminado," &
                "[Status] = 1 " &
                "WHERE Operacion = @Operacion " &
                "If @Terminado = 1 " &
                "BEGIN " &
                "INSERT INTO tblSalidas (Operacion, Caja, FechaTerminado, UserTerminado) " &
                "VALUES (@Operacion, @Caja, @Fechaout, @User) " &
                "END END"
            )

        NewMigration(
            MigrationName:="20220221100100_vSalidas",
            MigrationCommand:=
                "CREATE VIEW [dbo].[vSalidas] " &
                "AS SELECT " &
                "dbo.tblSalidas.ID, dbo.tblSalidas.Operacion, dbo.tblSalidas.Caja, dbo.tblSalidas.FechaTerminado, UsersTerminado.Nombre AS NombreTerminado, dbo.tblSalidas.FechaSalida, dbo.tblUsers.Nombre AS NombreSalida " &
                "FROM dbo.tblSalidas INNER JOIN " &
                         "dbo.tblUsers AS UsersTerminado ON dbo.tblSalidas.UserTerminado = UsersTerminado.Username LEFT OUTER JOIN " &
                         "dbo.tblUsers ON dbo.tblSalidas.UserSalida = dbo.tblUsers.Username WHERE        (dbo.tblSalidas.FechaSalida IS NULL) OR " &
                         "(CAST(dbo.tblSalidas.FechaSalida AS date) = CAST(GETDATE() AS date))"
            )

        NewMigration(
            MigrationName:="20220221100100_tblErrors",
            MigrationCommand:=
                "CREATE TABLE [dbo].[tblErrors](" &
                "[ID] [int] IDENTITY(1,1) NOT NULL," &
                "[ErrorDate] [datetime] NULL," &
                "[ErrorText] [nvarchar](max) NULL" &
                ") ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]"
            )

        NewMigration(
            MigrationName:="20220221100200_StoredProcedureForErrors",
            MigrationCommand:=
                "CREATE PROCEDURE spErrorLog " &
                "@logText nvarchar(max) " &
                "AS " &
                "BEGIN " &
                "SET NOCOUNT ON; " &
                "INSERT INTO tblErrors VALUES (@logText, GETDATE()) " &
                "END"
            )

        NewMigration(
            MigrationName:="20220221100300_InsertNewPriv",
            MigrationCommand:="INSERT INTO tblPrivs VALUES (4,'CASETA')"
            )

        NewMigration(
            MigrationName:="20220221124900_AlterViewSalidas",
            MigrationCommand:=
            "ALTER VIEW [dbo].[vSalidas] " &
            "AS SELECT " &
            "dbo.tblSalidas.ID, dbo.tblSalidas.Operacion, dbo.tblSalidas.Caja, dbo.tblSalidas.FechaTerminado, UsersTerminado.Nombre AS NombreTerminado, dbo.tblSalidas.FechaSalida, dbo.tblUsers.Nombre AS NombreSalida " &
            "FROM            dbo.tblSalidas INNER JOIN " &
                         "dbo.tblUsers AS UsersTerminado ON dbo.tblSalidas.UserTerminado = UsersTerminado.Username LEFT OUTER JOIN " &
                         "dbo.tblUsers ON dbo.tblSalidas.UserSalida = dbo.tblUsers.Username "
            )

        NewMigration(
            MigrationName:="20220221142600_New StoredProcedure spAcceptOut",
            MigrationCommand:=
            "CREATE PROCEDURE spAcceptOut @id int, @username nvarchar(50) AS " &
            "BEGIN " &
            "SET NOCOUNT ON; " &
            "UPDATE tblSalidas " &
            "SET FechaSalida = GETDATE(), UserSalida = @username	WHERE ID = @id " &
            "END"
            )

        NewMigration(
            MigrationName:="20220222162600_Correcion a Insert de tblUsers",
            MigrationCommand:=
            "-- ============================================= " & vbCr &
            "-- Author:		Gabriel Estrada " & vbCr &
            "-- Create date: 2020-04-25 " & vbCr &
            "-- Description:	<Description,,> " & vbCr &
            "-- ============================================= " & vbCr &
            "ALTER PROCEDURE [dbo].[spUsers] " & vbCr &
            "	-- Add the parameters for the stored procedure here " & vbCr &
            "	@Action char(3), " & vbCr &
            "	@Username varchar(50), " & vbCr &
            "	@Nombre varchar(150) = '', " & vbCr &
            "	@Email varchar(300) = '', " & vbCr &
            "  	@Server int = 0, " & vbCr &
            "	@Password varchar(50) = '', " & vbCr &
            "	@Priv Int = 0 " & vbCr &
            "AS " & vbCr &
            "BEGIN " & vbCr &
            "	-- SET NOCOUNT ON added to prevent extra result sets from " & vbCr &
            "	-- interfering with SELECT statements. " & vbCr &
            "	SET NOCOUNT ON; " & vbCr &
            "    -- Insert statements for procedure here " & vbCr &
            "	IF @Action = 'ADD' " & vbCr &
            "	BEGIN " & vbCr &
            "		INSERT INTO tblUsers (Username, Nombre, Email, [Password], Priv, ServerID) " & vbCr &
            "			VALUES(@Username, @Nombre, @Email, @Password, @Priv, @Server) " & vbCr &
            "	END " & vbCr &
            "	IF @Action = 'UPD' " & vbCr &
            "	BEGIN " & vbCr &
            "		UPDATE tblUsers " & vbCr &
            "			SET Nombre = @Nombre, " & vbCr &
            "				Email = @Email, " & vbCr &
            "				Priv = @Priv, " & vbCr &
            "				ServerID = @Server " & vbCr &
            "			WHERE Username = @Username " & vbCr &
            "	END " & vbCr &
            "	IF @Action = 'DEL' " & vbCr &
            "	BEGIN " & vbCr &
            "		DELETE tblUsers WHERE Username = @Username " & vbCr &
            "	END " & vbCr &
            " " & vbCr &
            "	IF @Action = 'PWD' " & vbCr &
            "	BEGIN " & vbCr &
            "		UPDATE tblUsers " & vbCr &
            "			SET [Password] = @Password " & vbCr &
            "		WHERE Username = @Username " & vbCr &
            "	END " & vbCr &
            "END "
            )
    End Sub
    Sub Migrations_2023()
        NewMigration(
                MigrationName:="20230204103100_Se agregan campos para CDFI compartido",
                MigrationCommand:=
                "ALTER TABLE dbo.Inventario ADD " & vbCr &
                "	Compartido bit NULL, " & vbCr &
                "	CompartidoCon nchar(20) NULL "
            )

        NewMigration(
            MigrationName:="20230204132000_Modifica Procedimiento almacenado para Actualizar CFDI Compartidos",
            MigrationCommand:=
                "ALTER PROCEDURE [dbo].[spInventario_CFDI] " & vbCr &
                "   @Operacion Char(20), " & vbCr &
                "   @Factura nchar(10), " & vbCr &
                "   @CFDI nchar(36), " & vbCr &
                "   @MontoCFDI float, " & vbCr &
                "   @MontoCFDIDlls float, " & vbCr &
                "   @Aprovechamiento float, " & vbCr &
                "   @Compartido bit, " & vbCr &
                "   @CompartidoCon nchar(20) " & vbCr &
                "AS " & vbCr &
                "BEGIN " & vbCr &
                "   UPDATE Inventario  " & vbCr &
                "       SET	Factura = @Factura, " & vbCr &
                "           CFDI = @CFDI, " & vbCr &
                "           MontoCFDI = @MontoCFDI, " & vbCr &
                "           MontoCFDIDlls = @MontoCFDIDlls, " & vbCr &
                "           Aprovechamiento = @Aprovechamiento, " & vbCr &
                "           Compartido = @Compartido, " & vbCr &
                "           CompartidoCon = @CompartidoCon, " & vbCr &
                "           [Status] = 2 " & vbCr &
                "       WHERE Operacion = @Operacion " & vbCr &
                "END"
        )

        NewMigration(
            MigrationName:="20231014122500_Modificar SP de Usuarios",
            MigrationCommand:=<![CDATA[
                ALTER TABLE dbo.tblUsers ADD
	            SuperAdmin bit NULL
            ]]>.Value
        )

        NewMigration(
            MigrationName:="",
            MigrationCommand:=<![CDATA[
            ALTER PROCEDURE [dbo].[spUsers] 
	            -- Add the parameters for the stored procedure here 
	            @Action char(3), 
	            @Username varchar(50), 
	            @Nombre varchar(150) = '', 
	            @Email varchar(300) = '', 
  	            @Server int = 0, 
	            @Password varchar(50) = '', 
	            @Priv Int = 0,
	            @SuperAdmin bit = 0
            AS 
            BEGIN 
	            -- SET NOCOUNT ON added to prevent extra result sets from 
	            -- interfering with SELECT statements. 
	            SET NOCOUNT ON; 
                -- Insert statements for procedure here 
	            IF @Action = 'ADD' 
	            BEGIN 
		            INSERT INTO tblUsers (Username, Nombre, Email, [Password], Priv, ServerID, SuperAdmin) 
			            VALUES(@Username, @Nombre, @Email, @Password, @Priv, @Server, @SuperAdmin) 
	            END 
	            IF @Action = 'UPD' 
	            BEGIN 
		            UPDATE tblUsers 
			            SET Nombre = @Nombre, 
				            Email = @Email, 
				            Priv = @Priv, 
				            ServerID = @Server ,
				            SuperAdmin = @SuperAdmin
			            WHERE Username = @Username 
	            END 
	            IF @Action = 'DEL' 
	            BEGIN 
		            DELETE tblUsers WHERE Username = @Username 
	            END 
 
	            IF @Action = 'PWD' 
	            BEGIN 
		            UPDATE tblUsers 
			            SET [Password] = @Password 
		            WHERE Username = @Username 
	            END 
            END 
            ]]>.Value)

    End Sub

End Class

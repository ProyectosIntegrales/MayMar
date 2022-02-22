Imports Microsoft.VisualBasic

Public Class Migrations
    Public Sub ImplementMigrations()
        Migrations_Feb2022()
    End Sub

    Public Sub Migrations_Feb2022()
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
    End Sub

End Class

Imports Microsoft.VisualBasic

Public Class Migrations
    Public Sub ImplementMigrations()
        Migrations_Feb2022()
    End Sub

    Public Sub Migrations_Feb2022()
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

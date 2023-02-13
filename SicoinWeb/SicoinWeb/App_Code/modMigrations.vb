Imports Microsoft.VisualBasic

Public Module modMigrations
    Public Sub AddMigrations()
        CrearTablaMigrations()
        Dim migrations As New Migrations()
        migrations.ImplementMigrations()
    End Sub

    'Crea tabla de Migraciones
    Private Sub CrearTablaMigrations()
        Dim cmd As String =
            "IF OBJECT_ID (N'_migrations', N'U') IS NULL " &
            "CREATE TABLE [dbo].[_migrations](" &
            "[migrationName] [nvarchar](250) NOT NULL, " &
            "[migrationDate] [datetime] NULL, " &
            "CONSTRAINT [PK__migrations] PRIMARY KEY CLUSTERED " &
            "([migrationName] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]" &
            ") ON [PRIMARY] "
        Dim result = doSQLProcedure(cmd, Data.CommandType.Text)
        Console.Write(result)
    End Sub

    Public Sub NewMigration(MigrationName As String, MigrationCommand As String)
        Dim check = SQLDataTable("SELECT * FROM _migrations WHERE migrationName = '" & MigrationName & "'")
        If check.Rows.Count = 0 Then
            Dim result = doSQLProcedure(MigrationCommand, Data.CommandType.Text)
            If (result Is Nothing) Then
                doSQLProcedure(
                "INSERT INTO _migrations (migrationName, migrationDate) " &
                "VALUES ('" & MigrationName & "', GETDATE())", Data.CommandType.Text)
            End If
        End If
    End Sub

End Module

Imports Microsoft.VisualBasic

Public Module modMigrations
    Public Function AddMigrations()
        CrearTablaMigrations()
    End Function

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
End Module

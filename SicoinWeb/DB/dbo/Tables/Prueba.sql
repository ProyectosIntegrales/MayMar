CREATE TABLE [dbo].[Prueba] (
    [Nombre]   CHAR (10)    NULL,
    [Apellido] CHAR (10)    NULL,
    [Edad]     NUMERIC (18) NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_Prueba]
    ON [dbo].[Prueba]([Nombre] ASC) WITH (FILLFACTOR = 90);


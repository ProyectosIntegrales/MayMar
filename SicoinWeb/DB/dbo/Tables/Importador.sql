CREATE TABLE [dbo].[Importador] (
    [Clave]     CHAR (6)  NOT NULL,
    [Nombre]    CHAR (80) CONSTRAINT [DF_Importador_Nombre] DEFAULT ('None') NULL,
    [Direccion] CHAR (80) CONSTRAINT [DF_Importador_Direccion_1] DEFAULT ('none') NULL,
    CONSTRAINT [PK_Importador] PRIMARY KEY CLUSTERED ([Clave] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Clave de Importador', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Importador', @level2type = N'COLUMN', @level2name = N'Clave';


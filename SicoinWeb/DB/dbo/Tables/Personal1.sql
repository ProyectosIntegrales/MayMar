CREATE TABLE [dbo].[Personal1] (
    [Claveper]   CHAR (13) CONSTRAINT [DF_Personal_Claveper] DEFAULT ('none') NULL,
    [Nombre]     CHAR (80) CONSTRAINT [DF_Personal_Nombre] DEFAULT ('none') NULL,
    [Rfc]        CHAR (13) CONSTRAINT [DF_Personal_Rfc] DEFAULT ('none') NULL,
    [Empresa]    CHAR (80) CONSTRAINT [DF_Personal_Empresa] DEFAULT ('none') NULL,
    [Puesto]     CHAR (15) CONSTRAINT [DF_Personal_Puesto] DEFAULT ('none') NULL,
    [Direccion]  CHAR (80) CONSTRAINT [DF_Personal_Direccion] DEFAULT ('none') NULL,
    [Telefono]   CHAR (15) CONSTRAINT [DF_Personal_Telefono] DEFAULT ('none') NULL,
    [Activo]     CHAR (1)  CONSTRAINT [DF_Personal_Activado] DEFAULT (1) NULL,
    [Foto]       IMAGE     NULL,
    [Imss]       CHAR (13) CONSTRAINT [DF_Personal1_Imss] DEFAULT ('none') NULL,
    [DireccionP] CHAR (80) CONSTRAINT [DF_Personal1_DireccionP] DEFAULT ('none') NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Clave de Personal', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Personal1', @level2type = N'COLUMN', @level2name = N'Claveper';


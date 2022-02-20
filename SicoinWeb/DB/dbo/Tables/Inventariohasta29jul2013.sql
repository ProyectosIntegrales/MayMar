CREATE TABLE [dbo].[Inventariohasta29jul2013] (
    [Operacion]   CHAR (20)    CONSTRAINT [DF_Inventario16ene_Operacion] DEFAULT (0) NOT NULL,
    [Caja]        CHAR (10)    NULL,
    [Mercancia]   CHAR (70)    NULL,
    [Cajas]       FLOAT (53)   NULL,
    [Fechain]     DATETIME     NULL,
    [Horain]      CHAR (10)    NULL,
    [Fechaout]    DATETIME     CONSTRAINT [DF_Inventario16ene_Fechaout] DEFAULT (1 / 1 / 1900) NULL,
    [Horaout]     CHAR (10)    CONSTRAINT [DF_Inventario16ene_Horaout] DEFAULT ('00:00:00') NULL,
    [Descargado]  FLOAT (53)   CONSTRAINT [DF_Inventario16ene_Descargado] DEFAULT (0) NULL,
    [Remanente]   FLOAT (53)   CONSTRAINT [DF_Inventario16ene_Remanente] DEFAULT (0) NULL,
    [Peso]        CHAR (10)    CONSTRAINT [DF_Inventario16ene_Peso] DEFAULT (0) NULL,
    [Cliente]     CHAR (5)     CONSTRAINT [DF_Inventario16ene_Cliente] DEFAULT ('None') NULL,
    [Nombre]      CHAR (100)   CONSTRAINT [DF_Inventario16ene_Nombre] DEFAULT ('None') NULL,
    [RSocial]     CHAR (120)   CONSTRAINT [DF_Inventario16ene_RSocial] DEFAULT ('None') NULL,
    [Terminado]   NUMERIC (18) CONSTRAINT [DF_Inventario16ene_Terminado] DEFAULT (0) NULL,
    [Valorc]      FLOAT (53)   CONSTRAINT [DF_Inventario16ene_Valorc] DEFAULT (0) NULL,
    [Fraccion]    NUMERIC (18) CONSTRAINT [DF_Inventario16ene_Fraccion] DEFAULT (0) NULL,
    [UM]          NUMERIC (18) CONSTRAINT [DF_Inventario16ene_UM] DEFAULT (0) NULL,
    [Importador]  CHAR (100)   CONSTRAINT [DF_Inventario16ene_Importador] DEFAULT ('none') NULL,
    [ClavePed]    CHAR (10)    CONSTRAINT [DF_Inventario16ene_ClavePed] DEFAULT ('none') NULL,
    [DiasAlmacen] CHAR (25)    CONSTRAINT [DF_Inventario16ene_DiasAlmacen] DEFAULT ('none') NULL,
    [AvisoAb]     CHAR (50)    CONSTRAINT [DF_Inventario16ene_AvisoAb] DEFAULT ('none') NULL,
    [Fechaab]     DATETIME     CONSTRAINT [DF_Inventario16ene_Fechaab] DEFAULT (1 / 1 / 1900) NULL,
    [NoAplica]    CHAR (10)    CONSTRAINT [DF_Inventario16ene_NoAplica] DEFAULT ('N/A') NULL,
    [Gratis]      CHAR (10)    CONSTRAINT [DF_Inventario16ene_Gratis] DEFAULT ('No') NULL,
    [Contenedor]  CHAR (90)    CONSTRAINT [DF_Inventario16ene_Contenedor] DEFAULT ('none') NULL,
    [DirImp]      CHAR (90)    CONSTRAINT [DF_Inventario16ene_DirImp] DEFAULT ('none') NULL,
    [Bultos]      CHAR (90)    CONSTRAINT [DF_Inventario16ene_Bultos] DEFAULT ('none') NULL,
    CONSTRAINT [PK_Inventario16ene] PRIMARY KEY CLUSTERED ([Operacion] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Numero de Operacio o Pedimento', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Inventariohasta29jul2013', @level2type = N'COLUMN', @level2name = N'Operacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Numero de caja', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Inventariohasta29jul2013', @level2type = N'COLUMN', @level2name = N'Caja';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tipo de Mercancia', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Inventariohasta29jul2013', @level2type = N'COLUMN', @level2name = N'Mercancia';


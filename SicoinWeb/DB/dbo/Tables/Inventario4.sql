CREATE TABLE [dbo].[Inventario4] (
    [Operacion]  CHAR (11)        CONSTRAINT [DF_Inventario_Operacion] DEFAULT (0) NULL,
    [Caja]       CHAR (10)        NULL,
    [Mercancia]  CHAR (70)        NULL,
    [Cajas]      FLOAT (53)       NULL,
    [Fechain]    DATETIME         NULL,
    [Horain]     CHAR (10)        NULL,
    [Fechaout]   DATETIME         CONSTRAINT [DF_Inventario_Fechaout] DEFAULT (1 / 1 / 2006) NULL,
    [Horaout]    CHAR (10)        CONSTRAINT [DF_Inventario_Horaout] DEFAULT ('00:00:00') NULL,
    [Descargado] FLOAT (53)       CONSTRAINT [DF_Inventario_Descargado] DEFAULT (0) NULL,
    [Remanente]  FLOAT (53)       CONSTRAINT [DF_Inventario_Remanente] DEFAULT (0) NULL,
    [Peso]       CHAR (10)        CONSTRAINT [DF_Inventario_Peso] DEFAULT (0) NULL,
    [Cliente]    CHAR (5)         CONSTRAINT [DF_Inventario_Cliente] DEFAULT ('None') NULL,
    [Nombre]     CHAR (100)       CONSTRAINT [DF_Inventario_Nombre] DEFAULT ('None') NULL,
    [RSocial]    CHAR (120)       CONSTRAINT [DF_Inventario_RSocial] DEFAULT ('None') NULL,
    [Terminado]  NUMERIC (18)     CONSTRAINT [DF_Inventario_Terminado] DEFAULT (0) NULL,
    [Valorc]     FLOAT (53)       CONSTRAINT [DF_Inventario_Valorc] DEFAULT (0) NULL,
    [Fraccion]   NUMERIC (18)     CONSTRAINT [DF_Inventario_Fraccion] DEFAULT (0) NULL,
    [UM]         NUMERIC (18)     CONSTRAINT [DF_Inventario_UM] DEFAULT (0) NULL,
    [Importador] CHAR (100)       CONSTRAINT [DF_Inventario_Importador] DEFAULT ('none') NULL,
    [Contador]   UNIQUEIDENTIFIER NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Numero de Operacio o Pedimento', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Inventario4', @level2type = N'COLUMN', @level2name = N'Operacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Numero de caja', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Inventario4', @level2type = N'COLUMN', @level2name = N'Caja';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tipo de Mercancia', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Inventario4', @level2type = N'COLUMN', @level2name = N'Mercancia';


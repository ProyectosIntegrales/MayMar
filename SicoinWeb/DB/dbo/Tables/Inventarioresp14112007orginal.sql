CREATE TABLE [dbo].[Inventarioresp14112007orginal] (
    [Operacion]  CHAR (11)    CONSTRAINT [DF_inventarioresp_Operacion] DEFAULT (0) NULL,
    [Caja]       CHAR (10)    NULL,
    [Mercancia]  CHAR (70)    NULL,
    [Cajas]      FLOAT (53)   NULL,
    [Fechain]    DATETIME     NULL,
    [Horain]     CHAR (10)    NULL,
    [Fechaout]   DATETIME     CONSTRAINT [DF_inventarioresp_Fechaout] DEFAULT (1 / 1 / 2006) NULL,
    [Horaout]    CHAR (10)    CONSTRAINT [DF_inventarioresp_Horaout] DEFAULT ('00:00:00') NULL,
    [Descargado] FLOAT (53)   CONSTRAINT [DF_inventarioresp_Descargado] DEFAULT (0) NULL,
    [Remanente]  FLOAT (53)   CONSTRAINT [DF_inventarioresp_Remanente] DEFAULT (0) NULL,
    [Peso]       CHAR (10)    CONSTRAINT [DF_inventarioresp_Peso] DEFAULT (0) NULL,
    [Cliente]    CHAR (5)     CONSTRAINT [DF_inventarioresp_Cliente] DEFAULT ('None') NULL,
    [Nombre]     CHAR (100)   CONSTRAINT [DF_inventarioresp_Nombre] DEFAULT ('None') NULL,
    [RSocial]    CHAR (120)   CONSTRAINT [DF_inventarioresp_RSocial] DEFAULT ('None') NULL,
    [Terminado]  NUMERIC (18) CONSTRAINT [DF_inventarioresp_Terminado] DEFAULT (0) NULL,
    [Valorc]     FLOAT (53)   CONSTRAINT [DF_inventarioresp_Valorc] DEFAULT (0) NULL,
    [Fraccion]   NUMERIC (18) CONSTRAINT [DF_inventarioresp_Fraccion] DEFAULT (0) NULL,
    [UM]         NUMERIC (18) CONSTRAINT [DF_inventarioresp_UM] DEFAULT (0) NULL,
    [Importador] CHAR (100)   CONSTRAINT [DF_inventarioresp_Importador] DEFAULT ('none') NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Numero de Operacio o Pedimento', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Inventarioresp14112007orginal', @level2type = N'COLUMN', @level2name = N'Operacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Numero de caja', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Inventarioresp14112007orginal', @level2type = N'COLUMN', @level2name = N'Caja';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tipo de Mercancia', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Inventarioresp14112007orginal', @level2type = N'COLUMN', @level2name = N'Mercancia';


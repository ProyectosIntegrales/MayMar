CREATE TABLE [dbo].[Inventario] (
    [Operacion]       CHAR (20)      CONSTRAINT [DF_VacioInv_Operacion] DEFAULT ((0)) NOT NULL,
    [Caja]            CHAR (10)      NULL,
    [Mercancia]       CHAR (70)      NULL,
    [Cajas]           FLOAT (53)     NULL,
    [Fechain]         DATETIME       NULL,
    [Horain]          CHAR (10)      NULL,
    [Fechaout]        DATETIME       CONSTRAINT [DF_VacioInv_Fechaout] DEFAULT (((1)/(1))/(1900)) NULL,
    [Horaout]         CHAR (10)      CONSTRAINT [DF_VacioInv_Horaout] DEFAULT ('00:00:00') NULL,
    [Descargado]      FLOAT (53)     CONSTRAINT [DF_VacioInv_Descargado] DEFAULT ((0)) NULL,
    [Remanente]       FLOAT (53)     CONSTRAINT [DF_VacioInv_Remanente] DEFAULT ((0)) NULL,
    [Peso]            FLOAT (53)     CONSTRAINT [DF_VacioInv_Peso] DEFAULT ((0)) NULL,
    [Cliente]         CHAR (5)       CONSTRAINT [DF_VacioInv_Cliente] DEFAULT ('None') NULL,
    [Nombre]          CHAR (100)     CONSTRAINT [DF_VacioInv_Nombre] DEFAULT ('None') NULL,
    [RSocial]         CHAR (120)     CONSTRAINT [DF_VacioInv_RSocial] DEFAULT ('None') NULL,
    [Terminado]       NUMERIC (18)   CONSTRAINT [DF_VacioInv_Terminado] DEFAULT ((0)) NULL,
    [Valorc]          FLOAT (53)     CONSTRAINT [DF_VacioInv_Valorc] DEFAULT ((0)) NULL,
    [Fraccion]        NVARCHAR (50)  CONSTRAINT [DF_VacioInv_Fraccion] DEFAULT ((0)) NULL,
    [UM]              NUMERIC (18)   CONSTRAINT [DF_VacioInv_UM] DEFAULT ((0)) NULL,
    [Importador]      CHAR (100)     CONSTRAINT [DF_VacioInv_Importador] DEFAULT ('none') NULL,
    [ClavePed]        CHAR (10)      CONSTRAINT [DF_VacioInv_ClavePed] DEFAULT ('none') NULL,
    [DiasAlmacen]     CHAR (25)      CONSTRAINT [DF_VacioInv_DiasAlmacen] DEFAULT ('none') NULL,
    [AvisoAb]         CHAR (50)      CONSTRAINT [DF_VacioInv_AvisoAb] DEFAULT ('none') NULL,
    [Fechaab]         DATETIME       CONSTRAINT [DF_VacioInv_Fechaab] DEFAULT (((1)/(1))/(1900)) NULL,
    [FechaDeclAb]     DATETIME       NULL,
    [FechaSalidaAb]   DATETIME       NULL,
    [NotaAb]          VARCHAR (1000) NULL,
    [NoAplica]        CHAR (10)      CONSTRAINT [DF_VacioInv_NoAplica] DEFAULT ('N/A') NULL,
    [Gratis]          CHAR (10)      CONSTRAINT [DF_VacioInv_Gratis] DEFAULT ('No') NULL,
    [Contenedor]      CHAR (90)      CONSTRAINT [DF_VacioInv_Contenedor] DEFAULT ('none') NULL,
    [DirImp]          CHAR (90)      CONSTRAINT [DF_VacioInv_DirImp] DEFAULT ('none') NULL,
    [Bultos]          CHAR (90)      CONSTRAINT [DF_VacioInv_Bultos] DEFAULT ('none') NULL,
    [Factura]         NCHAR (10)     NULL,
    [CFDI]            NCHAR (36)     NULL,
    [MontoCFDI]       FLOAT (53)     NULL,
    [MontoCFDIDlls]   FLOAT (53)     NULL,
    [Aprovechamiento] FLOAT (53)     NULL,
    [Status]          INT            NULL,
    CONSTRAINT [PK_VacioInv] PRIMARY KEY CLUSTERED ([Operacion] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Numero de Operacio o Pedimento', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Inventario', @level2type = N'COLUMN', @level2name = N'Operacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Numero de caja', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Inventario', @level2type = N'COLUMN', @level2name = N'Caja';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tipo de Mercancia', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Inventario', @level2type = N'COLUMN', @level2name = N'Mercancia';


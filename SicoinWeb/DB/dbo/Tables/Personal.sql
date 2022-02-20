CREATE TABLE [dbo].[Personal] (
    [Claveper]   CHAR (13)  CONSTRAINT [DF_Personal_Claverper] DEFAULT ('None') NOT NULL,
    [Nombre]     CHAR (80)  CONSTRAINT [DF_Personal_Nombre_1] DEFAULT ('None') NULL,
    [RFC]        CHAR (13)  CONSTRAINT [DF_Personal_RFC_1] DEFAULT ('None') NULL,
    [Empresa]    CHAR (100) CONSTRAINT [DF_Personal_Empresa_1] DEFAULT ('None') NULL,
    [Puesto]     CHAR (20)  CONSTRAINT [DF_Personal_Puesto_1] DEFAULT ('None') NULL,
    [Direccion]  CHAR (300) CONSTRAINT [DF_Personal_Direccion_1] DEFAULT ('None') NULL,
    [Telefono]   CHAR (15)  CONSTRAINT [DF_Personal_Telefono_1] DEFAULT ('None') NULL,
    [Activado]   CHAR (1)   CONSTRAINT [DF_Personal_Activado_1] DEFAULT (1) NULL,
    [Foto]       IMAGE      NULL,
    [Imss]       CHAR (13)  CONSTRAINT [DF_Personal_Imss] DEFAULT ('None') NULL,
    [DireccionP] CHAR (80)  CONSTRAINT [DF_Personal_DireccionP] DEFAULT ('None') NULL,
    [Link]       CHAR (70)  NULL,
    CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED ([Claveper] ASC) WITH (FILLFACTOR = 90)
);


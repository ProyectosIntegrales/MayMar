CREATE TABLE [dbo].[tblExportadores] (
    [ID]        INT           IDENTITY (1, 1) NOT NULL,
    [NombreExp] VARCHAR (100) NULL,
    [Direccion] VARCHAR (100) NULL,
    [Ciudad]    VARCHAR (50)  NULL,
    [RFC]       VARCHAR (50)  NULL,
    CONSTRAINT [PK_tblExportadores] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90)
);


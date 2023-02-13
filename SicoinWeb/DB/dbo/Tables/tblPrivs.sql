CREATE TABLE [dbo].[tblPrivs] (
    [Priv]        INT          NOT NULL,
    [Descripcion] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_tblPrivs] PRIMARY KEY CLUSTERED ([Priv] ASC) WITH (FILLFACTOR = 90)
);


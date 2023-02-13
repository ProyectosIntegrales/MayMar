CREATE TABLE [dbo].[tblUsers] (
    [Username] VARCHAR (50)  NOT NULL,
    [Nombre]   VARCHAR (150) NULL,
    [Email]    VARCHAR (300) NULL,
    [Password] VARCHAR (50)  NULL,
    [Priv]     INT           NULL,
    [ServerID] INT           NULL,
    CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED ([Username] ASC) WITH (FILLFACTOR = 90)
);


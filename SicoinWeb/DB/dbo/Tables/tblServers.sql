CREATE TABLE [dbo].[tblServers] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [ServerName]   NVARCHAR (200) NULL,
    [DatabaseName] NVARCHAR (200) NULL,
    CONSTRAINT [PK_tblServers] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90)
);


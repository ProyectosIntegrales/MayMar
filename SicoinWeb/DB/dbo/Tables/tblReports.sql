CREATE TABLE [dbo].[tblReports] (
    [reportID]           INT           NOT NULL,
    [reportFile]         VARCHAR (50)  NULL,
    [reportTitle]        VARCHAR (150) NULL,
    [reportType]         NCHAR (10)    NULL,
    [reportIcon]         VARCHAR (50)  NULL,
    [reportDescription]  TEXT          NULL,
    [sort]               INT           NULL,
    [DatabaseServerName] VARCHAR (50)  NULL,
    [DatabaseName]       VARCHAR (50)  NULL,
    [allowDOC]           BIT           NULL,
    [allowPDF]           BIT           NULL,
    [allowXLS]           BIT           NULL,
    [allowXLT]           BIT           NULL,
    CONSTRAINT [PK_tblReports] PRIMARY KEY CLUSTERED ([reportID] ASC) WITH (FILLFACTOR = 90)
);


CREATE TABLE [dbo].[tblReportParametersType] (
    [paramType]    NCHAR (10) NOT NULL,
    [paramControl] NCHAR (10) NULL,
    CONSTRAINT [PK_tblReportParametersType] PRIMARY KEY CLUSTERED ([paramType] ASC) WITH (FILLFACTOR = 90)
);


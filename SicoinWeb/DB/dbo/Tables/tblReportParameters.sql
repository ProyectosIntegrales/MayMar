CREATE TABLE [dbo].[tblReportParameters] (
    [reportID]        INT           NOT NULL,
    [paramID]         INT           NOT NULL,
    [paramName]       VARCHAR (50)  NULL,
    [paramType]       NCHAR (10)    NULL,
    [paramTitle]      VARCHAR (200) NULL,
    [paramVisible]    BIT           NULL,
    [paramIsID]       BIT           NULL,
    [paramIsOptional] BIT           NULL,
    [paramOptionalID] INT           NULL,
    [paramSetting]    BIT           NULL,
    [paramValue]      FLOAT (53)    NULL,
    CONSTRAINT [PK_tblReportParameters] PRIMARY KEY NONCLUSTERED ([reportID] ASC, [paramID] ASC) WITH (FILLFACTOR = 90)
);


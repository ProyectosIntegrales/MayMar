CREATE TABLE [dbo].[tblSalidas] (
    [ID]             INT            IDENTITY (1, 1) NOT NULL,
    [Operacion]      NVARCHAR (MAX) NOT NULL,
    [Caja]           NCHAR (10)     NULL,
    [FechaTerminado] DATETIME       NULL,
    [UserTerminado]  NVARCHAR (50)  NULL,
    [FechaSalida]    DATETIME       NULL,
    [UserSalida]     NVARCHAR (50)  NULL
);


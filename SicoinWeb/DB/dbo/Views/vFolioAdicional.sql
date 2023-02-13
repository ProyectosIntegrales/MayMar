
CREATE VIEW [dbo].[vFolioAdicional]
AS
SELECT        FolioNumero, MAX(FolioAdicional) AS FolioAdicional
FROM            (SELECT        LEFT(MAX(FolioTexto), 9) AS FolioNumero, LEFT(MAX(FolioTexto), 9) + CHAR(ASCII(RIGHT(MAX(FolioTexto), 1)) + 1) AS FolioAdicional
                          FROM            dbo.tblAnexo29
                          GROUP BY Year, Folio, FolioTipo
                          HAVING         (FolioTipo = N'N') AND (Year = DATEPART(yyyy, GETDATE())) OR
                                                    (FolioTipo = N'A') OR
                                                    (FolioTipo = N'U')) AS derivedtbl_1
GROUP BY FolioNumero


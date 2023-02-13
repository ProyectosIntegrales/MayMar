

CREATE VIEW [dbo].[vUltimoFolio]
AS
SELECT        MAX(Folio) AS Folio
FROM            dbo.tblAnexo29
GROUP BY Year
HAVING        (Year = DATEPART(yyyy, GETDATE()))




CREATE VIEW [dbo].[vFechasAb]
AS
SELECT        TOP (100) PERCENT CAST(DATEPART(YEAR, Fechain) AS VARCHAR(4)) + '/' + RIGHT('00' + CAST(DATEPART(MM, Fechain) AS VARCHAR(2)), 2) AS M, SUBSTRING('ENE FEB MAR ABR MAY JUN JUL AGO SEP OCT NOV DIC ', 
                         DATEPART(MM, Fechain) * 4 - 3, 3) + ' - ' + CAST(DATEPART(YEAR, Fechain) AS VARCHAR(4)) AS DisplayDate
FROM            (SELECT        Fechain
                          FROM            dbo.Inventario
                          WHERE        (Fechain < DATEADD(month, DATEDIFF(month, 0, GETDATE()), 0))) AS derivedtbl_1
GROUP BY CAST(DATEPART(YEAR, Fechain) AS VARCHAR(4)) + '/' + RIGHT('00' + CAST(DATEPART(MM, Fechain) AS VARCHAR(2)), 2), SUBSTRING('ENE FEB MAR ABR MAY JUN JUL AGO SEP OCT NOV DIC ', DATEPART(MM, Fechain) * 4 - 3, 
                         3) + ' - ' + CAST(DATEPART(YEAR, Fechain) AS VARCHAR(4))
ORDER BY M DESC



CREATE VIEW [dbo].[vInventario]
AS
SELECT        Operacion, Caja, Mercancia, Cajas, Fechain, Horain, Fechaout, Horaout, Descargado, Remanente, Peso, Cliente, Nombre, RSocial, Terminado, Valorc, Fraccion, UM, Importador, ClavePed, DiasAlmacen, AvisoAb, Fechaab, 
                         NoAplica, Gratis, Contenedor, DirImp, Bultos, Factura, CFDI, MontoCFDI, MontoCFDIDlls, Aprovechamiento
FROM            dbo.Inventario


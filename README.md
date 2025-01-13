CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscarNombreBienxArea`(
     IN vAreaId INT, -- Cambié el tipo a INT, suponiendo que el id es un número entero
   IN vnombre VARCHAR(45)
)
BEGIN
    SELECT 
        b.idbienes, b.verificar, b.codigoBien, b.nombrebien, b.marca, b.modelo, b.nroSerie, 
        b.valorCompra, b.descripcion, c.nombreCategoria, c.idcategorias, a.nombreAreas, 
        r.nombreResponsable, r.idresponsable, b.estado, p.nombreprov, p.idproveedores, 
        b.fechaAdquisicion, mp.nombre AS medioPagoNombre, mp.numerom AS medioPagoNumero,
        tc.nombre AS tipoComprobanteNombre, cp.numero AS comprobanteNumero
    FROM bienes b
    INNER JOIN categorias c ON b.idcategorias = c.idcategorias
    INNER JOIN responsable r ON b.idresponsable = r.idresponsable
    INNER JOIN area a ON r.idarea = a.idarea
    INNER JOIN proveedores p ON b.idproveedores = p.idproveedores
    LEFT JOIN comprobantepago cp ON b.idcomprobantepago = cp.idcomprobantepago
    LEFT JOIN mediopago mp ON cp.idmediopago = mp.idmediopago
    LEFT JOIN tipocomprobante tc ON cp.idtipocomprobante = tc.idtipocomprobante
    WHERE a.idarea = vAreaId
      and b.nombrebien LIKE CONCAT('%', vnombre, '%');  -- Cambié esto para comparar con el ID del área
END

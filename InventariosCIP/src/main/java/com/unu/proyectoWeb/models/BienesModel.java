package com.unu.proyectoWeb.models;

import com.unu.proyectoWeb.beans.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BienesModel extends Conexion {

	java.sql.CallableStatement cs;
	ResultSet rs;

	public List<Bienes> listarBienes() throws SQLException {
		try {
			List<Bienes> lista = new ArrayList<>();
			String sql = "CALL sp_listarBienes";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			while (rs.next()) {
				Bienes bienes = new Bienes();
				bienes.setIdbienes(rs.getInt("idbienes"));
				bienes.setVerificar(rs.getInt("verificar"));
				bienes.setCodigoBien(rs.getString("codigoBien"));
				bienes.setNombrebien(rs.getString("nombrebien"));
				bienes.setMarca(rs.getString("marca"));
				bienes.setModelo(rs.getString("modelo"));
				bienes.setNroSerie(rs.getString("nroSerie"));
				bienes.setIdcategorias(rs.getString("nombreCategoria"));
				bienes.setIdresponsable(rs.getString("nombreResponsable"));
				bienes.setNombreArea(rs.getString("nombreAreas"));
				bienes.setIdproveedores(rs.getString("nombreprov"));
				bienes.setFechaAdquisicion(rs.getString("fechaAdquisicion"));
				bienes.setValorCompra(rs.getString("valorCompra"));
				bienes.setDescripcion(rs.getString("descripcion"));
				bienes.setNombreMedioPago(rs.getString("medioPagoNombre"));
				bienes.setNumeroMedioPago(rs.getString("medioPagoNumero"));
				bienes.setNombreTipoComprobante(rs.getString("tipoComprobanteNombre"));
				bienes.setNumeroComprobante(rs.getString("comprobanteNumero"));
				bienes.setEstado(rs.getInt("estado"));
				lista.add(bienes);

			}
			this.cerrarConexion();
			return lista;
		} catch (Exception ex) {
			ex.getMessage();
			this.cerrarConexion();

			return null;

		}
	}

	public List<Bienes> listarBienesPorPaginacion(int pagina, int tamanoPagina) {
		List<Bienes> lista = new ArrayList<>();
		try {
			int offset = (pagina - 1) * tamanoPagina; // Calculamos el offset basado en la página y el tamaño de página

			String sql = "CALL sp_listarBienesPaginados(?, ?)"; // Procedimiento almacenado para paginación

			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, offset); // Offset
			cs.setInt(2, tamanoPagina); // Tamaño de página

			rs = cs.executeQuery();
			while (rs.next()) {
				Bienes bienes = new Bienes();
				bienes.setIdbienes(rs.getInt("idbienes"));
				bienes.setVerificar(rs.getInt("verificar"));
				bienes.setCodigoBien(rs.getString("codigoBien"));
				bienes.setNombrebien(rs.getString("nombrebien"));
				bienes.setMarca(rs.getString("marca"));
				bienes.setModelo(rs.getString("modelo"));
				bienes.setNroSerie(rs.getString("nroSerie"));
				bienes.setIdcategorias(rs.getString("nombreCategoria"));
				bienes.setIdresponsable(rs.getString("nombreResponsable"));
				bienes.setNombreArea(rs.getString("nombreAreas"));
				bienes.setIdproveedores(rs.getString("nombreprov"));
				bienes.setFechaAdquisicion(rs.getString("fechaAdquisicion"));
				bienes.setValorCompra(rs.getString("valorCompra"));
				bienes.setDescripcion(rs.getString("descripcion"));
				bienes.setNombreMedioPago(rs.getString("medioPagoNombre"));
				bienes.setNumeroMedioPago(rs.getString("medioPagoNumero"));
				bienes.setNombreTipoComprobante(rs.getString("tipoComprobanteNombre"));
				bienes.setNumeroComprobante(rs.getString("comprobanteNumero"));
				bienes.setEstado(rs.getInt("estado"));
				lista.add(bienes);
			}
		} catch (SQLException ex) {
			ex.printStackTrace(); // Manejo de errores
		} finally {
			this.cerrarConexion(); // Asegura que la conexión siempre se cierre
		}
		return lista;
	}

	public int contarTotalBienes() {
		int total = 0;
		try {
			String sql = "CALL sp_contarTotalBienes()"; // Procedimiento almacenado que devuelve el total de bienes
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			if (rs.next()) {
				total = rs.getInt("total");
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			this.cerrarConexion();
		}
		return total;
	}

	public int insertarBien(Bienes bienes) throws SQLException {
		try {
			int filasAfectadas = 0;

			String sql = "CALL sp_insertarBienes(?,?,?,?,?,?,?,?,?,?,?,?,?)"; // 13
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setString(1, bienes.getNombrebien());
			cs.setString(2, bienes.getMarca());
			cs.setString(3, bienes.getModelo());
			cs.setString(4, bienes.getNroSerie());
			cs.setString(5, bienes.getFechaAdquisicion());
			cs.setString(6, bienes.getValorCompra());
			cs.setInt(7, bienes.getEstado());
			cs.setString(8, bienes.getDescripcion());
			cs.setString(9, bienes.getCodigoBien());
			cs.setString(10, bienes.getIdcategorias());
			cs.setString(11, bienes.getIdproveedores());
			cs.setString(12, bienes.getIdresponsable());
			cs.setString(13, bienes.getIdcomprobante());

			filasAfectadas = cs.executeUpdate();
			this.cerrarConexion();
			return filasAfectadas;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			this.cerrarConexion();
			return 0;
		}
	}

	public int actualizarEstadoCheckbox(int idBien, int nuevoEstado) throws SQLException {
		try {
			int filasAfectadas = 0;

			String sql = "CALL sp_verificar(?, ?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, nuevoEstado);
			cs.setInt(2, idBien);

			filasAfectadas = cs.executeUpdate();
			this.cerrarConexion();
			return filasAfectadas;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			this.cerrarConexion();
			return 0;
		}
	}

	public List<Categorias> listarCategorias() throws SQLException {
		try {
			List<Categorias> lista = new ArrayList<>();
			String sql = "CALL sp_listarCategorias()";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			while (rs.next()) {
				Categorias categoria = new Categorias();
				categoria.setIdcategorias(rs.getInt("idcategorias"));
				categoria.setNombreCategoria(rs.getString("nombreCategoria"));
				lista.add(categoria);
			}
			this.cerrarConexion();
			return lista;
		} catch (Exception ex) {
			ex.printStackTrace();
			ex.getMessage();
			this.cerrarConexion();
			return null;
		}
	}

	public List<Proveedores> listarProveedores() throws SQLException {
		try {
			List<Proveedores> lista = new ArrayList<>();
			String sql = "CALL sp_listaProveedores()";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			while (rs.next()) {
				Proveedores proveedores = new Proveedores();
				proveedores.setIdproveedores(rs.getInt("idproveedores"));
				proveedores.setNombreprov(rs.getString("nombreprov"));
				lista.add(proveedores);
			}
			this.cerrarConexion();
			return lista;
		} catch (Exception ex) {
			ex.printStackTrace();
			ex.getMessage();
			this.cerrarConexion();
			return null;
		}
	}

	public List<Responsable> listarResponsables() throws SQLException {
		try {
			List<Responsable> lista = new ArrayList<>();
			String sql = "CALL sp_listarResponsables()";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			while (rs.next()) {
				Responsable responsable = new Responsable();
				responsable.setIdresponsable(rs.getInt("idresponsable"));
				responsable.setNombreResponsable(rs.getString("nombreResponsable"));
				lista.add(responsable);
			}
			this.cerrarConexion();
			return lista;
		} catch (Exception ex) {
			ex.printStackTrace();
			ex.getMessage();
			this.cerrarConexion();
			return null;
		}
	}

	public List<Area> listarAreas() throws SQLException {
		try {
			List<Area> lista = new ArrayList<>();
			String sql = "CALL sp_listarAreas()";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			while (rs.next()) {
				Area area = new Area();
				area.setIdarea(rs.getInt("idarea"));
				area.setNombreAreas(rs.getString("nombreAreas"));
				lista.add(area);
			}
			this.cerrarConexion();
			return lista;
		} catch (Exception ex) {
			ex.printStackTrace();
			ex.getMessage();
			this.cerrarConexion();
			return null;
		}
	}

	// para probar
	public List<Tipocomprobante> listarTipo() throws SQLException {
		try {
			List<Tipocomprobante> lista = new ArrayList<>();
			String sql = "CALL sp_listarTipoComprobante()";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			while (rs.next()) {
				Tipocomprobante tipo = new Tipocomprobante();
				tipo.setIdTipocomprobante(rs.getInt("idtipocomprobante"));
				tipo.setNombre(rs.getString("nombre"));
				lista.add(tipo);

			}
			this.cerrarConexion();
			return lista;
		} catch (Exception ex) {
			ex.getMessage();
			this.cerrarConexion();

			return null;

		}
	}

	public List<Mediopago> listarMediopago() throws SQLException {
		try {
			List<Mediopago> lista = new ArrayList<>();
			String sql = "CALL sp_listarMediopago()";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			while (rs.next()) {
				Mediopago medio = new Mediopago();
				medio.setidMediopago(rs.getInt("idmediopago"));
				medio.setNombre(rs.getString("nombre"));
				medio.setNumerom(rs.getString("numerom"));
				lista.add(medio);

			}
			this.cerrarConexion();
			return lista;
		} catch (Exception ex) {
			ex.getMessage();
			this.cerrarConexion();

			return null;

		}
	}

	public List<Comprobantepago> listarComprobante() throws SQLException {
		List<Comprobantepago> lista = new ArrayList<>(); // Siempre inicializa la lista
		try {
			String sql = "CALL sp_listarComprobante()";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			while (rs.next()) {
				Comprobantepago cp = new Comprobantepago();
				cp.setIdcomprobantePago(rs.getInt("idcomprobantepago"));
				cp.setIdmediopago(rs.getString("nombre_mediopago"));
				cp.setNumeroMedioPago(rs.getString("numero_mediopago"));
				cp.setIdtipoComprobante(rs.getString("nombre_tipocomprobante"));
				cp.setNumero(rs.getString("numero_comprobante"));
				lista.add(cp);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			this.cerrarConexion();
		}
		return lista;
	}

	public int eliminarBienes(int idbienes) throws SQLException {
		try {
			int filasAfectadas = 0;
			String sql = "CALL sp_eliminarBienes(?)";
			this.abrirConexion();
			System.out.println("Llamando al procedimiento con ID: " + idbienes);
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idbienes);
			filasAfectadas = cs.executeUpdate();
			System.out.println("Filas afectadas: " + filasAfectadas);
			this.cerrarConexion();
			return filasAfectadas;

		} catch (SQLException e) {
			e.printStackTrace();
			this.cerrarConexion();
			return 0;
		}
	}

	public List<Bienes> buscar(String buscar) throws SQLException {
		try {
			List<Bienes> lista = new ArrayList<>();
			String sql = "CALL sp_buscarNombreArea(?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setString(1, buscar);
			rs = cs.executeQuery();
			while (rs.next()) {
				Bienes bienes = new Bienes();
				bienes.setIdbienes(rs.getInt("idbienes"));
				bienes.setVerificar(rs.getInt("verificar"));
				bienes.setCodigoBien(rs.getString("codigoBien"));
				bienes.setNombrebien(rs.getString("nombrebien"));
				bienes.setMarca(rs.getString("marca"));
				bienes.setModelo(rs.getString("modelo"));
				bienes.setNroSerie(rs.getString("nroSerie"));
				bienes.setIdcategorias(rs.getString("nombreCategoria"));
				bienes.setIdresponsable(rs.getString("nombreResponsable"));
				bienes.setNombreArea(rs.getString("nombreAreas"));
				bienes.setIdproveedores(rs.getString("nombreprov"));
				bienes.setFechaAdquisicion(rs.getString("fechaAdquisicion"));
				bienes.setValorCompra(rs.getString("valorCompra"));
				bienes.setDescripcion(rs.getString("descripcion"));
				bienes.setEstado(rs.getInt("estado"));
				lista.add(bienes);
			}
			this.cerrarConexion();
			return lista;
		} catch (Exception ex) {
			ex.getMessage();
			this.cerrarConexion();

			return null;

		}
	}

	public Bienes obtenerBienes(int idbienes) {
		Bienes bienes = new Bienes();
		try {
			String sql = "CALL sp_obtenerBienes(?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idbienes);
			rs = cs.executeQuery();
			if (rs.next()) {
				bienes.setIdbienes(rs.getInt("idbienes"));
				bienes.setCodigoBien(rs.getString("codigoBien"));
				bienes.setNombrebien(rs.getString("nombrebien"));
				bienes.setMarca(rs.getString("marca"));
				bienes.setModelo(rs.getString("modelo"));
				bienes.setNroSerie(rs.getString("nroSerie"));
				bienes.setIdcategorias(rs.getString("nombreCategoria"));
				bienes.setIdcategoriass(Integer.parseInt(rs.getString("idcategorias")));
				bienes.setIdproveedoress(Integer.parseInt(rs.getString("idproveedores")));
				bienes.setIdresponsables(Integer.parseInt(rs.getString("idresponsable")));
				bienes.setIdresponsable(rs.getString("nombreResponsable"));
				bienes.setNombreArea(rs.getString("nombreAreas"));
				bienes.setIdproveedores(rs.getString("nombreprov"));
				bienes.setFechaAdquisicion(rs.getString("fechaAdquisicion"));
				bienes.setValorCompra(rs.getString("valorCompra"));
				bienes.setDescripcion(rs.getString("descripcion"));
				bienes.setEstado(rs.getInt("estado"));
				bienes.setIdcomprobantes(rs.getInt("idcomprobantePago"));
				this.cerrarConexion();
			}

		} catch (Exception e) {
			this.cerrarConexion();
			return null;
		}
		return bienes;
	}

	public int modificarBienes(Bienes bienes) throws SQLException {
		try {
			int filasAfectadas = 0;

			// Imprimir el estado de 'bienes' en la consola
			System.out.println("Estado del objeto Bienes antes de la modificación:");
			System.out.println("ID: " + bienes.getIdbienes());
			System.out.println("Nombre: " + bienes.getNombrebien());
			System.out.println("Marca: " + bienes.getMarca());
			System.out.println("Modelo: " + bienes.getModelo());
			System.out.println("Número de Serie: " + bienes.getNroSerie());
			System.out.println("Fecha de Adquisición: " + bienes.getFechaAdquisicion());
			System.out.println("Valor de Compra: " + bienes.getValorCompra());
			System.out.println("Estado: " + bienes.getEstado());
			System.out.println("Descripción: " + bienes.getDescripcion());
			System.out.println("Código del Bien: " + bienes.getCodigoBien());
			System.out.println("ID Categoría: " + bienes.getIdcategorias());
			System.out.println("ID Proveedores: " + bienes.getIdproveedores());
			System.out.println(
					"ID Responsable: " + (bienes.getIdresponsable().isEmpty() ? "0" : bienes.getIdresponsable()));
			System.out.println("ID Comprobante: " + bienes.getIdcomprobantes());

			String sql = "CALL sp_editarBienes(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, bienes.getIdbienes());
			cs.setString(2, bienes.getNombrebien());
			cs.setString(3, bienes.getMarca());
			cs.setString(4, bienes.getModelo());
			cs.setString(5, bienes.getNroSerie());
			cs.setString(6, bienes.getFechaAdquisicion());
			cs.setString(7, bienes.getValorCompra());
			cs.setInt(8, bienes.getEstado());
			cs.setString(9, bienes.getDescripcion());
			cs.setString(10, bienes.getCodigoBien());
			cs.setString(11, bienes.getIdcategorias());
			cs.setString(12, bienes.getIdproveedores());
			cs.setString(13, bienes.getIdresponsable().isEmpty() ? "0" : bienes.getIdresponsable());
			cs.setInt(14, bienes.getIdcomprobantes());
			filasAfectadas = cs.executeUpdate();
			this.cerrarConexion();
			return filasAfectadas;

		} catch (SQLException e) {
			e.printStackTrace();
			this.cerrarConexion();
			return 0;
		}
	}

	public List<Bienes> buscarNombre(String buscar) throws SQLException {
		try {
			List<Bienes> lista = new ArrayList<>();
			String sql = "CALL sp_buscarNombreBien(?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setString(1, buscar);
			rs = cs.executeQuery();
			while (rs.next()) {
				Bienes bienes = new Bienes();
				bienes.setIdbienes(rs.getInt("idbienes"));
				bienes.setVerificar(rs.getInt("verificar"));
				bienes.setCodigoBien(rs.getString("codigoBien"));
				bienes.setNombrebien(rs.getString("nombrebien"));
				bienes.setMarca(rs.getString("marca"));
				bienes.setModelo(rs.getString("modelo"));
				bienes.setNroSerie(rs.getString("nroSerie"));
				bienes.setIdcategorias(rs.getString("nombreCategoria"));

				bienes.setIdcategoriass(Integer.parseInt(rs.getString("idcategorias")));
				bienes.setIdresponsables(Integer.parseInt(rs.getString("idresponsable")));
				bienes.setIdproveedoress(Integer.parseInt(rs.getString("idproveedores")));

				bienes.setIdresponsable(rs.getString("nombreResponsable"));
				bienes.setNombreArea(rs.getString("nombreAreas"));
				bienes.setIdproveedores(rs.getString("nombreprov"));
				bienes.setFechaAdquisicion(rs.getString("fechaAdquisicion"));
				bienes.setValorCompra(rs.getString("valorCompra"));
				bienes.setDescripcion(rs.getString("descripcion"));
				bienes.setNombreMedioPago(rs.getString("medioPagoNombre"));
				bienes.setNumeroMedioPago(rs.getString("medioPagoNumero"));
				bienes.setNombreTipoComprobante(rs.getString("tipoComprobanteNombre"));
				bienes.setNumeroComprobante(rs.getString("comprobanteNumero"));
				bienes.setEstado(rs.getInt("estado"));
				lista.add(bienes);
			}
			this.cerrarConexion();
			return lista;
		} catch (Exception ex) {
			ex.getMessage();
			this.cerrarConexion();

			return null;

		}
	}

	public List<Bienes> buscarNombreBienxArea(String buscar, String area) throws SQLException {
		try {
			List<Bienes> lista = new ArrayList<>();
			// Consulta SQL con los dos parámetros
			String sql = "CALL sp_buscarNombreBienxArea(?, ?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);

			
			cs.setString(1, area); 
			cs.setString(2, buscar); 

	
			rs = cs.executeQuery();

		
			while (rs.next()) {
				Bienes bienes = new Bienes();
				bienes.setIdbienes(rs.getInt("idbienes"));
				bienes.setVerificar(rs.getInt("verificar"));
				bienes.setCodigoBien(rs.getString("codigoBien"));
				bienes.setNombrebien(rs.getString("nombrebien"));
				bienes.setMarca(rs.getString("marca"));
				bienes.setModelo(rs.getString("modelo"));
				bienes.setNroSerie(rs.getString("nroSerie"));
				bienes.setIdcategorias(rs.getString("nombreCategoria"));
				bienes.setIdcategoriass(Integer.parseInt(rs.getString("idcategorias")));
				bienes.setIdresponsables(Integer.parseInt(rs.getString("idresponsable")));
				bienes.setIdproveedoress(Integer.parseInt(rs.getString("idproveedores")));
				bienes.setIdresponsable(rs.getString("nombreResponsable"));
				bienes.setNombreArea(rs.getString("nombreAreas"));
				bienes.setIdproveedores(rs.getString("nombreprov"));
				bienes.setFechaAdquisicion(rs.getString("fechaAdquisicion"));
				bienes.setValorCompra(rs.getString("valorCompra"));
				bienes.setDescripcion(rs.getString("descripcion"));
				bienes.setNombreMedioPago(rs.getString("medioPagoNombre"));
				bienes.setNumeroMedioPago(rs.getString("medioPagoNumero"));
				bienes.setNombreTipoComprobante(rs.getString("tipoComprobanteNombre"));
				bienes.setNumeroComprobante(rs.getString("comprobanteNumero"));
				bienes.setEstado(rs.getInt("estado"));

				// Agregar el bien a la lista
				lista.add(bienes);
			}

			// Cerrar la conexión
			this.cerrarConexion();
			return lista;

		} catch (Exception ex) {
			// Manejo de la excepción
			ex.printStackTrace(); // Imprimir el error para depuración
			this.cerrarConexion();
			return null;
		}
	}

}

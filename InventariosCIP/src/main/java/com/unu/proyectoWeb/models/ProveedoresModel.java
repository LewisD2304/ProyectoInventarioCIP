package com.unu.proyectoWeb.models;

import com.unu.proyectoWeb.beans.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProveedoresModel extends Conexion {

	java.sql.CallableStatement cs;
	ResultSet rs;

	public List<Proveedores> listarProveedores() throws SQLException {
		try {
			List<Proveedores> lista = new ArrayList<>();
			String sql = "CALL sp_listarProveedores()";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			while (rs.next()) {
				Proveedores proveedores = new Proveedores();
				proveedores.setIdproveedores(rs.getInt("idproveedores"));
				proveedores.setNombreprov(rs.getString("nombreprov"));
				proveedores.setClasificacion(rs.getString("clasificacion"));
				proveedores.setRuc(rs.getString("ruc"));
				proveedores.setDireccion(rs.getString("direccion"));
				proveedores.setTelefono(rs.getString("telefono"));
				proveedores.setCorreo(rs.getString("correo"));
				lista.add(proveedores);

			}
			this.cerrarConexion();
			return lista;
		} catch (Exception ex) {
			ex.getMessage();
			this.cerrarConexion();

			return null;

		}
	}

	public int insertarProveedores(Proveedores proveedores) throws SQLException {
		try {
			int filasAfectadas = 0;

			String sql = "CALL sp_insertarProveedores(?,?,?,?,?,?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setString(1, proveedores.getNombreprov());
			cs.setString(2, proveedores.getClasificacion());
			cs.setString(3, proveedores.getRuc());
			cs.setString(4, proveedores.getDireccion());
			cs.setString(5, proveedores.getTelefono());
			cs.setString(6, proveedores.getCorreo());

			filasAfectadas = cs.executeUpdate();
			this.cerrarConexion();
			return filasAfectadas;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			this.cerrarConexion();
			return 0;
		}
	}

	public List<Proveedores> buscar(String buscar) throws SQLException {
		try {
			List<Proveedores> lista = new ArrayList<>();
			String sql = "CALL sp_buscarNombreProv(?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setString(1, buscar);
			rs = cs.executeQuery();
			while (rs.next()) {
				Proveedores proveedores = new Proveedores();
				proveedores.setIdproveedores(rs.getInt("idproveedores"));
				proveedores.setNombreprov(rs.getString("nombreprov"));
				proveedores.setClasificacion(rs.getString("clasificacion"));
				proveedores.setRuc(rs.getString("ruc"));
				proveedores.setDireccion(rs.getString("direccion"));
				proveedores.setTelefono(rs.getString("telefono"));
				proveedores.setCorreo(rs.getString("correo"));

				lista.add(proveedores);
			}
			this.cerrarConexion();
			return lista;
		} catch (Exception ex) {
			ex.getMessage();
			this.cerrarConexion();

			return null;

		}
	}

	public Proveedores obtenerProv(int idprov) {
		Proveedores proveedores = new Proveedores();
		try {
			String sql = "CALL sp_obtenerProveedores(?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idprov);
			rs = cs.executeQuery();
			if (rs.next()) {
				proveedores.setIdproveedores(rs.getInt("idproveedores"));
				proveedores.setNombreprov(rs.getString("nombreprov"));
				proveedores.setClasificacion(rs.getString("clasificacion"));
				proveedores.setRuc(rs.getString("ruc"));
				proveedores.setDireccion(rs.getString("direccion"));
				proveedores.setTelefono(rs.getString("telefono"));
				proveedores.setCorreo(rs.getString("correo"));

				this.cerrarConexion();
			}

		} catch (Exception e) {
			this.cerrarConexion();
			return null;
		}
		return proveedores;
	}

	public int modificarProveedor(Proveedores proveedores) throws SQLException {
		try {
			int filasAfectadas = 0;
			String sql = "CALL sp_editarProveedor(?,?,?,?,?,?,?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, proveedores.getIdproveedores());
			cs.setString(2, proveedores.getNombreprov());
			cs.setString(3, proveedores.getClasificacion());
			cs.setString(4, proveedores.getRuc());
			cs.setString(5, proveedores.getDireccion());
			cs.setString(6, proveedores.getTelefono());
			cs.setString(7, proveedores.getCorreo());
			filasAfectadas = cs.executeUpdate();
			this.cerrarConexion();
			return filasAfectadas;

		} catch (SQLException e) {
			e.printStackTrace();
			this.cerrarConexion();
			return 0;
		}
	}
	/*
	 * public List<Categorias> listarCategorias() throws SQLException { try {
	 * List<Categorias> lista = new ArrayList<>(); String sql =
	 * "CALL sp_listarCategorias()"; this.abrirConexion(); cs =
	 * conexion.prepareCall(sql); rs = cs.executeQuery(); while (rs.next()) {
	 * Categorias categoria = new Categorias();
	 * categoria.setIdcategorias(rs.getInt("idcategorias"));
	 * categoria.setNombreCategoria(rs.getString("nombreCategoria"));
	 * lista.add(categoria); } this.cerrarConexion(); return lista; } catch
	 * (Exception ex) { ex.printStackTrace(); ex.getMessage();
	 * this.cerrarConexion(); return null; } }
	 * 
	 * public List<Proveedores> listarProveedores() throws SQLException { try {
	 * List<Proveedores> lista = new ArrayList<>(); String sql =
	 * "CALL sp_listaProveedores()"; this.abrirConexion(); cs =
	 * conexion.prepareCall(sql); rs = cs.executeQuery(); while (rs.next()) {
	 * Proveedores proveedores = new Proveedores();
	 * proveedores.setIdproveedores(rs.getInt("idproveedores"));
	 * proveedores.setNombreprov(rs.getString("nombreprov"));
	 * lista.add(proveedores); } this.cerrarConexion(); return lista; } catch
	 * (Exception ex) { ex.printStackTrace(); ex.getMessage();
	 * this.cerrarConexion(); return null; } }
	 * 
	 * public List<Responsable> listarResponsables() throws SQLException { try {
	 * List<Responsable> lista = new ArrayList<>(); String sql =
	 * "CALL sp_listarResponsables()"; this.abrirConexion(); cs =
	 * conexion.prepareCall(sql); rs = cs.executeQuery(); while (rs.next()) {
	 * Responsable responsable = new Responsable();
	 * responsable.setIdresponsable(rs.getInt("idresponsable"));
	 * responsable.setNombreResponsable(rs.getString("nombreResponsable"));
	 * lista.add(responsable); } this.cerrarConexion(); return lista; } catch
	 * (Exception ex) { ex.printStackTrace(); ex.getMessage();
	 * this.cerrarConexion(); return null; } }
	 * 
	 * public List<Area> listarAreas() throws SQLException { try { List<Area> lista
	 * = new ArrayList<>(); String sql = "CALL sp_listarAreas()";
	 * this.abrirConexion(); cs = conexion.prepareCall(sql); rs = cs.executeQuery();
	 * while (rs.next()) { Area area = new Area();
	 * area.setIdarea(rs.getInt("idarea"));
	 * area.setNombreAreas(rs.getString("nombreAreas")); lista.add(area); }
	 * this.cerrarConexion(); return lista; } catch (Exception ex) {
	 * ex.printStackTrace(); ex.getMessage(); this.cerrarConexion(); return null; }
	 * }
	 * 
	 * public int eliminarBienes(int idbienes) throws SQLException { try { int
	 * filasAfectadas = 0; String sql = "CALL sp_eliminarBienes(?)";
	 * this.abrirConexion(); System.out.println("Llamando al procedimiento con ID: "
	 * + idbienes); cs = conexion.prepareCall(sql); cs.setInt(1, idbienes);
	 * filasAfectadas = cs.executeUpdate(); System.out.println("Filas afectadas: " +
	 * filasAfectadas); this.cerrarConexion(); return filasAfectadas;
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); this.cerrarConexion(); return
	 * 0; } }
	 * 
	 * 
	 * public List<Bienes> buscar(String buscar) throws SQLException { try {
	 * List<Bienes> lista = new ArrayList<>(); String sql =
	 * "CALL sp_buscarNombreArea(?)"; this.abrirConexion(); cs =
	 * conexion.prepareCall(sql); cs.setString(1, buscar); rs = cs.executeQuery();
	 * while (rs.next()) { Bienes bienes = new Bienes();
	 * bienes.setIdbienes(rs.getInt("idbienes"));;
	 * bienes.setCodigoBien(rs.getString("codigoBien"));
	 * bienes.setNombrebien(rs.getString("nombrebien"));
	 * bienes.setMarca(rs.getString("marca"));
	 * bienes.setModelo(rs.getString("modelo"));
	 * bienes.setNroSerie(rs.getString("nroSerie"));
	 * bienes.setIdcategorias(rs.getString("nombreCategoria"));
	 * bienes.setIdresponsable(rs.getString("nombreResponsable"));
	 * bienes.setNombreArea(rs.getString("nombreAreas"));
	 * bienes.setIdproveedores(rs.getString("nombreprov"));
	 * bienes.setFechaAdquisicion(rs.getString("fechaAdquisicion"));
	 * bienes.setValorCompra(rs.getString("valorCompra"));
	 * bienes.setEstado(rs.getInt("estado")); lista.add(bienes); }
	 * this.cerrarConexion(); return lista; } catch (Exception ex) {
	 * ex.getMessage(); this.cerrarConexion();
	 * 
	 * return null;
	 * 
	 * } }
	 * 
	 * 
	 * public Bienes obtenerBienes(int idbienes) { Bienes bienes = new Bienes(); try
	 * { String sql = "CALL sp_obtenerBienes(?)"; this.abrirConexion(); cs =
	 * conexion.prepareCall(sql); cs.setInt(1, idbienes); rs = cs.executeQuery(); if
	 * (rs.next()) { bienes.setIdbienes(rs.getInt("idbienes"));;
	 * bienes.setCodigoBien(rs.getString("codigoBien"));
	 * bienes.setNombrebien(rs.getString("nombrebien"));
	 * bienes.setMarca(rs.getString("marca"));
	 * bienes.setModelo(rs.getString("modelo"));
	 * bienes.setIdcategorias(rs.getString("nombreCategoria"));
	 * bienes.setIdresponsable(rs.getString("nombreResponsable"));
	 * bienes.setNombreArea(rs.getString("nombreAreas"));
	 * bienes.setIdproveedores(rs.getString("nombreprov"));
	 * bienes.setFechaAdquisicion(rs.getString("fechaAdquisicion"));
	 * bienes.setValorCompra(rs.getString("valorCompra"));
	 * bienes.setEstado(rs.getInt("estado")); this.cerrarConexion(); }
	 * 
	 * } catch (Exception e) { this.cerrarConexion(); return null; } return bienes;
	 * }
	 * 
	 * public int modificarBienes(Bienes bienes) throws SQLException { try { int
	 * filasAfectadas = 0; String sql =
	 * "CALL sp_editarBienes(?,?,?,?,?,?,?,?,?,?,?,?,?)"; this.abrirConexion(); cs =
	 * conexion.prepareCall(sql); cs.setInt(1, bienes.getIdbienes());
	 * cs.setString(2, bienes.getNombrebien()); cs.setString(3, bienes.getMarca());
	 * cs.setString(4, bienes.getModelo()); cs.setString(5, bienes.getNroSerie());
	 * cs.setString(6, bienes.getFechaAdquisicion()); cs.setString(7,
	 * bienes.getValorCompra()); cs.setInt(8, bienes.getEstado()); cs.setString(9,
	 * bienes.getDescripcion()); cs.setString(10, bienes.getCodigoBien());
	 * cs.setString(11, bienes.getIdcategorias()); cs.setString(12,
	 * bienes.getIdproveedores()); cs.setString(13, bienes.getIdresponsable());
	 * filasAfectadas = cs.executeUpdate(); this.cerrarConexion(); return
	 * filasAfectadas;
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); this.cerrarConexion(); return
	 * 0; } }
	 * 
	 * public List<Bienes> buscarNombre(String buscar) throws SQLException { try {
	 * List<Bienes> lista = new ArrayList<>(); String sql =
	 * "CALL sp_buscarNombreBien(?)"; this.abrirConexion(); cs =
	 * conexion.prepareCall(sql); cs.setString(1, buscar); rs = cs.executeQuery();
	 * while (rs.next()) { Bienes bienes = new Bienes();
	 * bienes.setIdbienes(rs.getInt("idbienes"));
	 * bienes.setNombrebien(rs.getString("nombrebien"));
	 * bienes.setCodigoBien(rs.getString("codigoBien"));
	 * bienes.setMarca(rs.getString("marca"));
	 * bienes.setModelo(rs.getString("modelo"));
	 * bienes.setNroSerie(rs.getString("nroSerie"));
	 * bienes.setIdcategorias(rs.getString("nombreCategoria"));
	 * bienes.setIdresponsable(rs.getString("nombreResponsable"));
	 * bienes.setNombreArea(rs.getString("nombreAreas"));
	 * bienes.setIdproveedores(rs.getString("nombreprov"));
	 * bienes.setFechaAdquisicion(rs.getString("fechaAdquisicion"));
	 * bienes.setValorCompra(rs.getString("valorCompra"));
	 * bienes.setEstado(rs.getInt("estado")); lista.add(bienes); }
	 * this.cerrarConexion(); return lista; } catch (Exception ex) {
	 * ex.getMessage(); this.cerrarConexion();
	 * 
	 * return null;
	 * 
	 * } }
	 */
}

package com.unu.proyectoWeb.controllers;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.unu.proyectoWeb.beans.*;
import com.unu.proyectoWeb.models.*;

/**
 * Servlet implementation class AutoresController
 */
@WebServlet("/BienesController")
public class BienesController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	BienesModel modelo = new BienesModel();

	public BienesController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String operacion = request.getParameter("op");

		if (operacion == null) {
			listarConPaginacion(request, response);
			return;
		}

		switch (operacion) {

		case "listarConPaginacion": // Agregar esta operación
			cargarAreas(request, response);
			listarConPaginacion(request, response);
			break;
		case "listar":
			cargarAreas(request, response);
			listar(request, response);

			break;

		case "agregar":
			cargarCategorias(request, response);
			cargarProveedores(request, response);
			cargarResponsables(request, response);
			cargarTipo(request, response);
			cargarMediopago(request, response);
			cargarComprobante(request, response);
			request.getRequestDispatcher("/bienes/NuevoBien.jsp").forward(request, response);
			break;
		case "insertar":
			insertar(request, response);
			break;
		case "eliminar":
			eliminar(request, response);
			break;
		case "buscar":
			buscar(request, response);
			break;
		case "buscarXnombre":
			buscarXnombre(request, response);
			break;
		case "buscarBienesxArea":
			String buscar = request.getParameter("buscar"); 
			String area = request.getParameter("area"); 
			buscarBienesxArea(request, response, buscar, area); 
			break;
		case "obtener":
			cargarCategorias(request, response);
			cargarProveedores(request, response);
			cargarResponsables(request, response);
			obtener(request, response);
			break;
		case "modificar":
			modificar(request, response);
			break;
		case "actualizarEstadoCheckbox":
			actualizarEstadoCheckbox(request, response);
			break;
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	private void listarConPaginacion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pagina = 1; // Página por defecto
		int tamanoPagina = 10; // Tamaño de página por defecto

		// Obtener parámetros de la consulta (si existen)
		String paginaParam = request.getParameter("pagina");
		if (paginaParam != null) {
			try {
				pagina = Integer.parseInt(paginaParam);
			} catch (NumberFormatException e) {
				pagina = 1;
			}
		}

		String tamanoPaginaParam = request.getParameter("tamanoPagina");
		if (tamanoPaginaParam != null) {
			try {
				tamanoPagina = Integer.parseInt(tamanoPaginaParam);
			} catch (NumberFormatException e) {
				tamanoPagina = 10;
			}
		}

		try {
			// Obtener la lista de bienes paginados y el total de bienes
			List<Bienes> listaBienes = modelo.listarBienesPorPaginacion(pagina, tamanoPagina);
			int totalBienes = modelo.contarTotalBienes();
			int totalPaginas = (int) Math.ceil((double) totalBienes / tamanoPagina);

			// Pasar los datos a la vista
			request.setAttribute("ListaBienes", listaBienes);
			request.setAttribute("paginaActual", pagina);
			request.setAttribute("totalPaginas", totalPaginas);
			request.setAttribute("tamanoPagina", tamanoPagina);

			// Redirigir al JSP
			request.getRequestDispatcher("/bienes/ListaBienes.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al listar bienes");
		}
	}

	public List<Bienes> obtenerBienesPaginados(int pagina, int tamanoPagina) throws SQLException {
		return modelo.listarBienesPorPaginacion(pagina, tamanoPagina);
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setAttribute("ListaBienes", modelo.listarBienes());
			request.getRequestDispatcher("/bienes/ListaBienes.jsp").forward(request, response);
		} catch (ServletException | IOException ex) {
			Logger.getLogger(BienesController.class.getName()).log(Level.SEVERE, null, ex);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.getMessage();
		}

	}

	private void cargarCategorias(HttpServletRequest request, HttpServletResponse response) {
		try {

			List<Categorias> categorias = modelo.listarCategorias();

			request.setAttribute("NuevoBien", categorias);

			// catch (ServletException | IOException ex)
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.getMessage();
		}
	}

	private void cargarProveedores(HttpServletRequest request, HttpServletResponse response) {
		try {

			List<Proveedores> proveedores = modelo.listarProveedores();

			request.setAttribute("listaproveedores", proveedores);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.getMessage();
		}
	}

	private void cargarResponsables(HttpServletRequest request, HttpServletResponse response) {
		try {

			List<Responsable> responsable = modelo.listarResponsables();

			request.setAttribute("listaresponsable", responsable);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.getMessage();
		}
	}

	private void cargarTipo(HttpServletRequest request, HttpServletResponse response) {
		try {

			List<Tipocomprobante> tipoc = modelo.listarTipo();

			request.setAttribute("ListaTipocomprobante", tipoc);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.getMessage();
		}
	}

	private void cargarMediopago(HttpServletRequest request, HttpServletResponse response) {
		try {

			List<Mediopago> medio = modelo.listarMediopago();

			request.setAttribute("ListaMedioPago", medio);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.getMessage();
		}
	}

	private void cargarAreas(HttpServletRequest request, HttpServletResponse response) {
		try {

			List<Area> area = modelo.listarAreas();

			request.setAttribute("ListaAreas", area);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.getMessage();
		}
	}

	private void cargarComprobante(HttpServletRequest request, HttpServletResponse response) {
		try {

			List<Comprobantepago> cp = modelo.listarComprobante();

			request.setAttribute("ListaComprobante", cp);
			System.out.println("Se cargaron " + cp.size() + " comprobantes.");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.getMessage();
		}
	}

	private void insertar(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		try {
			Bienes bienes = new Bienes();
			bienes.setNombrebien(request.getParameter("nombrebien"));
			bienes.setMarca(request.getParameter("marca"));
			bienes.setModelo(request.getParameter("modelo"));
			bienes.setNroSerie(request.getParameter("nroSerie"));
			bienes.setFechaAdquisicion(request.getParameter("fechaAdquisicion"));
			bienes.setValorCompra(request.getParameter("valorCompra"));
			bienes.setEstado(Integer.parseInt(request.getParameter("estado")));
			bienes.setDescripcion(request.getParameter("descripcion"));
			bienes.setCodigoBien(request.getParameter("codigoBien"));
			bienes.setIdcategorias(request.getParameter("idcategoriass"));
			bienes.setIdproveedores(request.getParameter("idproveedoress"));
			bienes.setIdresponsable(request.getParameter("idresponsables"));
			bienes.setIdcomprobante(request.getParameter("idcomprobantes"));

			if (modelo.insertarBien(bienes) > 0) {
				request.getSession().setAttribute("exito", "Bien registrado exitosamente");
			} else {
				request.getSession().setAttribute("fracaso",
						"El Bien no ha sido ingresado" + "ya hay un autor con este codigo");
			}

			response.sendRedirect(request.getContextPath() + "/BienesController?op=listar");

		} catch (IOException | SQLException ex) {
			Logger.getLogger(BienesController.class.getName()).log(Level.SEVERE, null, ex);
			Logger.getLogger(BienesController.class.getName()).log(Level.INFO, "Estado enviado: {0}",
					request.getParameter("estado"));
			ex.getMessage();
		}

	}

	private void actualizarEstadoCheckbox(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		try {
			int idBien = Integer.parseInt(request.getParameter("idBien"));
			int nuevoEstado = Integer.parseInt(request.getParameter("nuevoEstado"));
			System.out.println("AO" + nuevoEstado);

			boolean exito = modelo.actualizarEstadoCheckbox(idBien, nuevoEstado) > 0;

			// Configura la respuesta como JSON
			response.setContentType("application/json");
			response.getWriter().write("{\"success\": " + exito + "}");

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) {
		try {

			int idbienes = Integer.parseInt(request.getParameter("id"));

			if (modelo.eliminarBienes(idbienes) > 0) {
				System.out.println("Registro eliminado exitosamente.");
			} else {
				System.out.println("No se eliminó el registro.");
			}

			response.sendRedirect(request.getContextPath() + "/BienesController?op=listar");

		} catch (Exception ex) {
			ex.getStackTrace();
		}
	}

	private void buscar(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setAttribute("ListaBienes", modelo.buscar(request.getParameter("buscar")));
			cargarAreas(request, response);
			request.getRequestDispatcher("/bienes/ListaBienes.jsp").forward(request, response);
		} catch (ServletException | IOException ex) {
			Logger.getLogger(BienesController.class.getName()).log(Level.SEVERE, null, ex);
		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void buscarXnombre(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setAttribute("ListaBienes", modelo.buscarNombre(request.getParameter("buscar")));
			cargarAreas(request, response);
			request.getRequestDispatcher("/bienes/ListaBienes.jsp").forward(request, response);
		} catch (ServletException | IOException ex) {
			Logger.getLogger(BienesController.class.getName()).log(Level.SEVERE, null, ex);
		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void buscarBienesxArea(HttpServletRequest request, HttpServletResponse response, String buscar,
			String area) {
		try {
			// Llamar al método modelo con ambos parámetros 'buscar' y 'area'
			request.setAttribute("ListaBienes", modelo.buscarNombreBienxArea(buscar, area));

			cargarAreas(request, response);

			request.getRequestDispatcher("/bienes/ListaBienes.jsp").forward(request, response);
		} catch (ServletException | IOException ex) {
			Logger.getLogger(BienesController.class.getName()).log(Level.SEVERE, null, ex);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void obtener(HttpServletRequest request, HttpServletResponse response) {
		try {
			String id = request.getParameter("id");
			Bienes miBienes = modelo.obtenerBienes(Integer.parseInt(id));

			if (miBienes != null) {

				List<Categorias> categorias = modelo.listarCategorias();
				List<Responsable> responsables = modelo.listarResponsables();
				List<Area> areas = modelo.listarAreas();
				List<Proveedores> proveedores = modelo.listarProveedores();
				List<Comprobantepago> comprobante = modelo.listarComprobante();

				request.setAttribute("bienes", miBienes);
				request.setAttribute("categorias", categorias);
				request.setAttribute("responsables", responsables);
				request.setAttribute("areas", areas);
				request.setAttribute("proveedores", proveedores);
				request.setAttribute("ListaComprobante", comprobante);

				request.getRequestDispatcher("/bienes/EditarBien.jsp").forward(request, response);
			} else {
				response.sendRedirect(request.getContextPath() + "/ERROR 404.jsp");
			}

		} catch (Exception e) {
			System.out.print("wazaaa" + e.getMessage());
			e.printStackTrace();
		}
	}

	private void modificar(HttpServletRequest request, HttpServletResponse response) {
		try {
			Bienes miBienes = new Bienes();
			miBienes.setIdbienes(Integer.parseInt(request.getParameter("id")));
			miBienes.setNombrebien(request.getParameter("nombrebien"));
			miBienes.setMarca(request.getParameter("marca"));
			miBienes.setModelo(request.getParameter("modelo"));
			miBienes.setNroSerie(request.getParameter("nroSerie"));
			miBienes.setFechaAdquisicion(request.getParameter("fechaAdquisicion"));
			miBienes.setValorCompra(request.getParameter("valorCompra"));
			miBienes.setEstado(Integer.parseInt(request.getParameter("estado")));
			miBienes.setDescripcion(request.getParameter("descripcion"));
			miBienes.setCodigoBien(request.getParameter("codigoBien"));
			miBienes.setIdcategorias(request.getParameter("idcategoriass"));
			miBienes.setIdproveedores(request.getParameter("idproveedores"));
			miBienes.setIdresponsable(request.getParameter("idresponsables"));
			miBienes.setIdcomprobantes(Integer.parseInt(request.getParameter("idcomprobantes")));
			System.out.println(Integer.parseInt(request.getParameter("idcomprobantes")));

			if (modelo.modificarBienes(miBienes) > 0) {
				request.getSession().setAttribute("EXITO", "Bienes Modificado Correctamente");
			} else {
				request.getSession().setAttribute("ERROR", "Bienes NO FUE Modificado Correctamente");
			}
			response.sendRedirect(request.getContextPath() + "/BienesController?op=listar");

		} catch (Exception ex) {
			ex.printStackTrace();
			request.getSession().setAttribute("ERROR", "Hubo un error al modificar el bien.");
		}
	}

}

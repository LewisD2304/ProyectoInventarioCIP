package com.unu.proyectoWeb.controllers;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import com.unu.proyectoWeb.beans.Area;
import com.unu.proyectoWeb.beans.Bienes;
import com.unu.proyectoWeb.beans.Categorias;
import com.unu.proyectoWeb.beans.Proveedores;
import com.unu.proyectoWeb.beans.Responsable;
import com.unu.proyectoWeb.models.*;

/**
 * Servlet implementation class AutoresController
 */
@WebServlet("/ResponsablesController")
public class ResponsablesController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ResponsablesModel modelo = new ResponsablesModel();

	public ResponsablesController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String operacion = request.getParameter("op");

		if (operacion == null) {
			listar(request, response);
			return;
		}

		switch (operacion) {
		case "listar":
			cargarArea(request, response);
			listar(request, response);
			break;
		case "insertar": 
			insertar(request, response);
			break;
		case "obtener":
			cargarArea(request, response);
			obtener(request, response);
			break;
		case "eliminar":
			eliminar(request, response);
			break;
		case "modificar":
			modificar(request, response);
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

	private void insertar(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		try {
			Responsable respon = new Responsable();
			respon.setIdresponsable(Integer.parseInt(request.getParameter("id")));
			respon.setNombreResponsable(request.getParameter("nombreResponsable"));
			respon.setTelefono(request.getParameter("telefono"));
			respon.setCargo(request.getParameter("cargo"));
			respon.setIdarea(request.getParameter("idareas"));

			if (modelo.insertarResponsable(respon) > 0) {
				request.getSession().setAttribute("exito", "Área registrada exitosamente");
			} else {
				request.getSession().setAttribute("fracaso", "No se pudo registrar el área");
			}
			response.sendRedirect(request.getContextPath() + "/ResponsablesController?op=listar");
		} catch (SQLException ex) {
			Logger.getLogger(AreaController.class.getName()).log(Level.SEVERE, null, ex);
			throw new ServletException("Error al insertar área", ex);
		}
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setAttribute("ListaResponsables", modelo.listarResponsable());
			request.getRequestDispatcher("/responsables/ListaResponsables.jsp").forward(request, response);
		} catch (ServletException | IOException ex) {
			Logger.getLogger(ResponsablesController.class.getName()).log(Level.SEVERE, null, ex);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.getMessage();
		}

	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) {
		try {

			int idrespon = Integer.parseInt(request.getParameter("id"));

			if (modelo.eliminarResponsable(idrespon) > 0) {
				System.out.println("Registro eliminado exitosamente.");
			} else {
				System.out.println("No se eliminó el registro.");
			}

			response.sendRedirect(request.getContextPath() + "/ResponsablesController?op=listar");

		} catch (Exception ex) {
			ex.getStackTrace();
		}
	}

	private void cargarArea(HttpServletRequest request, HttpServletResponse response) {
		try {

			List<Area> area = modelo.listarAreas();

			request.setAttribute("listaArea", area);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.getMessage();
		}
	}

	private void obtener(HttpServletRequest request, HttpServletResponse response) {
		try {
			String id = request.getParameter("id");
			Responsable mirespon = modelo.obtenerResponsable(Integer.parseInt(id));

			System.out.print("wazaaa responsablesssss" + id);

			if (mirespon != null) {

				List<Area> listaArea = modelo.listarAreas();
				request.setAttribute("responsables", mirespon);
				request.setAttribute("listaArea", listaArea);

				request.getRequestDispatcher("/responsables/ListaResponsables.jsp").forward(request, response);
			} else {
				response.sendRedirect(request.getContextPath() + "/ERROR 404.jsp");
			}

		} catch (Exception e) {
			System.out.print("wazaaaERROR" + e.getMessage());
			e.printStackTrace();
		}
	}

	private void modificar(HttpServletRequest request, HttpServletResponse response) {
		try {
			Responsable miRespon = new Responsable();
			miRespon.setIdresponsable(Integer.parseInt(request.getParameter("id")));
			miRespon.setNombreResponsable(request.getParameter("nombreResponsable"));
			miRespon.setTelefono(request.getParameter("telefono"));
			miRespon.setCargo(request.getParameter("cargo"));
			miRespon.setIdarea(request.getParameter("idareas"));

			if (modelo.modificarResponsable(miRespon) > 0) {
				request.getSession().setAttribute("EXITO", "Responsable Modificado Correctamente");
			} else {
				request.getSession().setAttribute("ERROR", "Responsable NO FUE Modificado Correctamente");
			}
			response.sendRedirect(request.getContextPath() + "/ResponsablesController?op=listar");

		} catch (Exception ex) {
			ex.printStackTrace();
			request.getSession().setAttribute("ERROR", "Hubo un error al modificar el bien.");
		}
	}
	/*
	 * private void insertar(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException { try { Area proveedores = new A();
	 * proveedores.setNombreprov(request.getParameter("nombreprov"));
	 * proveedores.setClasificacion(request.getParameter("clasificacion"));
	 * proveedores.setRuc(request.getParameter("ruc"));
	 * proveedores.setDireccion(request.getParameter("direccion"));
	 * proveedores.setTelefono(request.getParameter("telefono"));
	 * proveedores.setCorreo(request.getParameter("correo"));
	 * 
	 * if (modelo.insertarProveedores(proveedores) > 0) {
	 * request.getSession().setAttribute("exito",
	 * "Proveedores registrado exitosamente"); } else {
	 * request.getSession().setAttribute("fracaso",
	 * "El Proveedores no ha sido ingresado" + "ya hay un autor con este codigo"); }
	 * response.sendRedirect(request.getContextPath() +
	 * "/ProveedoresController?op=listar");
	 * 
	 * } catch (IOException | SQLException ex) {
	 * Logger.getLogger(AreaController.class.getName()).log(Level.SEVERE, null, ex);
	 * Logger.getLogger(AreaController.class.getName()).log(Level.INFO,
	 * "Estado enviado: {0}", request.getParameter("estado")); ex.getMessage(); }
	 * 
	 * }
	 * 
	 * private void buscarXnombre(HttpServletRequest request, HttpServletResponse
	 * response) {
	 * 
	 * try { request.setAttribute("ListaProveedores",
	 * modelo.buscar(request.getParameter("buscar")));
	 * request.getRequestDispatcher("/proveedores/ListaProveedores.jsp").forward(
	 * request, response); } catch (ServletException | IOException ex) {
	 * Logger.getLogger(AreaController.class.getName()).log(Level.SEVERE, null, ex);
	 * } catch (SQLException e) { e.printStackTrace(); }
	 * 
	 * }
	 */
	/*
	 * private void eliminar(HttpServletRequest request, HttpServletResponse
	 * response) { try {
	 * 
	 * int idbienes = Integer.parseInt(request.getParameter("id"));
	 * 
	 * if (modelo.eliminarBienes(idbienes) > 0) {
	 * System.out.println("Registro eliminado exitosamente."); } else {
	 * System.out.println("No se eliminó el registro."); }
	 * 
	 * response.sendRedirect(request.getContextPath() +
	 * "/BienesController?op=listar");
	 * 
	 * } catch (Exception ex) { ex.getStackTrace(); } }
	 */

}

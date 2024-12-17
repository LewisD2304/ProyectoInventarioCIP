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
import com.unu.proyectoWeb.beans.Tipocomprobante;
import com.unu.proyectoWeb.models.*;

/**
 * Servlet implementation class AutoresController
 */
@WebServlet("/TipocomprobanteController")
public class TipocomprobanteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	TipocomprobanteModel modelo = new TipocomprobanteModel();

	public TipocomprobanteController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		System.out.println("El controlador ha sido invocado.");
		String operacion = request.getParameter("op");

		if (operacion == null) {
			listar(request, response);
			return;
		}

		switch (operacion) {
		case "listar":
			listar(request, response);
			break;
			/*
		case "agregar":
			request.getRequestDispatcher("/proveedores/NuevoProveedor.jsp").forward(request, response);
			break;
		case "insertar":
			insertar(request, response);
			break;*/
		
		/*case "cargarCategorias":
			cargarCategorias(request, response);
			break;
		case "cargarProveedores":
			cargarProveedores(request, response);
			break;
		case "cargarResponsables":
			cargarResponsables(request, response);
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
		case "obtener":
			obtener(request, response);
			break;
		case "modificar":
			modificar(request, response);
			break;*/
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

	private void listar(HttpServletRequest request, HttpServletResponse response) {

		try {
			List<Tipocomprobante> listaTipo = modelo.listarTipo();
	        System.out.println("Lista de Tipos de Comprobante desde el Modelo: " + listaTipo); // Depuración

	        if (listaTipo != null && !listaTipo.isEmpty()) {
	            for (Tipocomprobante tipo : listaTipo) {
	                System.out.println("TipoComprobante: ID=" + tipo.getIdTipocomprobante() + ", Nombre=" + tipo.getNombre());
	            }
	        } else {
	            System.out.println("La lista de Tipos de Comprobante está vacía o es nula.");
	        }

	        request.setAttribute("ListaTipocomprobante", listaTipo);
			request.getRequestDispatcher("/bienes/NuevoBien.jsp").forward(request, response);
			

		} catch (ServletException | IOException ex) {
			Logger.getLogger(TipocomprobanteController.class.getName()).log(Level.SEVERE, null, ex);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.getMessage();
		}

	}

/*
	private void insertar(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		try {
			Proveedores proveedores = new Proveedores();
			proveedores.setNombreprov(request.getParameter("nombreprov"));
			proveedores.setClasificacion(request.getParameter("clasificacion"));
			proveedores.setRuc(request.getParameter("ruc"));
			proveedores.setDireccion(request.getParameter("direccion"));
			proveedores.setTelefono(request.getParameter("telefono"));
			proveedores.setCorreo(request.getParameter("correo"));
			
			if (modelo.insertarProveedores(proveedores) > 0) {
				request.getSession().setAttribute("exito", "Proveedores registrado exitosamente");
			} else {
				request.getSession().setAttribute("fracaso",
						"El Proveedores no ha sido ingresado" + "ya hay un autor con este codigo");
			}
			response.sendRedirect(request.getContextPath() + "/ProveedoresController?op=listar");

		} catch (IOException | SQLException ex) {
			Logger.getLogger(TipocomprobanteController.class.getName()).log(Level.SEVERE, null, ex);
			Logger.getLogger(TipocomprobanteController.class.getName()).log(Level.INFO, "Estado enviado: {0}",
					request.getParameter("estado"));
			ex.getMessage();
		}

	}*/
/*
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
	}*/


}

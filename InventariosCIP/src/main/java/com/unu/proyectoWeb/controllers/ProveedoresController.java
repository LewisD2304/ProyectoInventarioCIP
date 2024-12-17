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
@WebServlet("/ProveedoresController")
public class ProveedoresController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ProveedoresModel modelo = new ProveedoresModel();

	public ProveedoresController() {
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
			listar(request, response);
			break;
		case "agregar":
			request.getRequestDispatcher("/proveedores/NuevoProveedor.jsp").forward(request, response);
			break;
		case "insertar":
			insertar(request, response);
			break;
		case "buscarXnombre":
			buscarXnombre(request, response);
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

	private void listar(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setAttribute("ListaProveedores", modelo.listarProveedores());
			request.getRequestDispatcher("/proveedores/ListaProveedores.jsp").forward(request, response);
		} catch (ServletException | IOException ex) {
			Logger.getLogger(ProveedoresController.class.getName()).log(Level.SEVERE, null, ex);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.getMessage();
		}

	}

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
			Logger.getLogger(ProveedoresController.class.getName()).log(Level.SEVERE, null, ex);
			Logger.getLogger(ProveedoresController.class.getName()).log(Level.INFO, "Estado enviado: {0}",
					request.getParameter("estado"));
			ex.getMessage();
		}

	}

	private void buscarXnombre(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setAttribute("ListaProveedores", modelo.buscar(request.getParameter("buscar")));
			request.getRequestDispatcher("/proveedores/ListaProveedores.jsp").forward(request, response);
		} catch (ServletException | IOException ex) {
			Logger.getLogger(ProveedoresController.class.getName()).log(Level.SEVERE, null, ex);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
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

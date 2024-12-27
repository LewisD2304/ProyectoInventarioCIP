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
import com.unu.proyectoWeb.beans.Comprobantepago;
import com.unu.proyectoWeb.beans.Mediopago;
import com.unu.proyectoWeb.beans.Proveedores;
import com.unu.proyectoWeb.beans.Responsable;
import com.unu.proyectoWeb.models.*;

/**
 * Servlet implementation class AutoresController
 */
@WebServlet("/ComprobantepagoController")
public class ComprobantepagoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ComprobantepagoModel modelo = new ComprobantepagoModel();

	public ComprobantepagoController() {
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
			request.getRequestDispatcher("/bienes/NuevoBien.jsp").forward(request, response);
			break;
		case "insertar":
			insertar(request, response);
			break;

		/*
		 * case "cargarCategorias": cargarCategorias(request, response); break; case
		 * "cargarProveedores": cargarProveedores(request, response); break; case
		 * "cargarResponsables": cargarResponsables(request, response); break; case
		 * "eliminar": eliminar(request, response); break; case "buscar":
		 * buscar(request, response); break; case "buscarXnombre":
		 * buscarXnombre(request, response); break; case "obtener": obtener(request,
		 * response); break; case "modificar": modificar(request, response); break;
		 */
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
			request.setAttribute("ListaComprobante", modelo.listarComprobante());
			request.getRequestDispatcher("/bienes/NuevoBien.jsp").forward(request, response);
		} catch (ServletException | IOException ex) {
			Logger.getLogger(ComprobantepagoController.class.getName()).log(Level.SEVERE, null, ex);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.getMessage();
		}

	}

	private void insertar(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    try {
	        Comprobantepago cp = new Comprobantepago();

	        // Obtener los valores del formulario
	        String idMedioPago = request.getParameter("idmediopago");
	        String idTipoComprobante = request.getParameter("idtipocomprobante");
	        String numero = request.getParameter("numero");

	        // Validar y asignar el medio de pago
	        if (idMedioPago != null && !idMedioPago.isEmpty()) {
	            cp.setIdmediopago(idMedioPago);
	        } else {
	            request.getSession().setAttribute("fracaso", "Debe seleccionar un medio de pago.");
	            response.sendRedirect(request.getContextPath() + "/BienesController?op=agregar");
	            return;
	        }

	        // Validar y asignar el tipo de comprobante (si aplica)
	        if (idTipoComprobante != null && !idTipoComprobante.isEmpty()) {
	            cp.setIdtipoComprobante(idTipoComprobante);
	        } else {
	            cp.setIdtipoComprobante(null); // Permitir nulo si no se selecciona comprobante
	        }

	        // Validar y asignar el número de comprobante (si aplica)
	        if (numero != null && !numero.isEmpty()) {
	            cp.setNumero(numero);
	        } else {
	            cp.setNumero(null); // Permitir nulo si no se ingresa número
	        }

	        // Insertar en la base de datos
	        if (modelo.insertarComprobante(cp) > 0) {
	            request.getSession().setAttribute("exito", "Comprobante de pago registrado exitosamente");
	        } else {
	            request.getSession().setAttribute("fracaso",
	                    "El Comprobante de pago no ha sido ingresado: ya existe un Medio de pago con este código.");
	        }

	        // Redirigir al usuario después de insertar
	        response.sendRedirect(request.getContextPath() + "/BienesController?op=agregar");

	    } catch (IOException | SQLException ex) {
	        ex.printStackTrace();
	        response.sendRedirect(request.getContextPath() + "/error.jsp");
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

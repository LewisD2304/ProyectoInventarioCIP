package com.unu.proyectoWeb.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.unu.proyectoWeb.beans.Area;
import com.unu.proyectoWeb.models.AreaModel;

@WebServlet("/AreaController")
public class AreaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	AreaModel modelo = new AreaModel();

	public AreaController() {
		super();
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String operacion = request.getParameter("op");

		if (operacion == null) {
			listar(request, response);
			return;
		}

		try {
			switch (operacion) {
			case "listar":
				listar(request, response);
				break;
			case "insertar":
				insertar(request, response);
				break;
			case "eliminar":
				eliminar(request, response);
				break;
			case "obtener":
				obtener(request, response);
				break;
			case "modificar":
				modificar(request, response);
				break;
			default:
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Operación no válida");
				break;
			}
		} catch (Exception ex) {
			Logger.getLogger(AreaController.class.getName()).log(Level.SEVERE, null, ex);
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error interno en el servidor");
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setAttribute("ListaAreas", modelo.listarArea());
			request.getRequestDispatcher("/area/ListaAreas.jsp").forward(request, response);
		} catch (Exception e) {
			Logger.getLogger(AreaController.class.getName()).log(Level.SEVERE, null, e);
			throw new ServletException("Error al listar áreas", e);
		}
	}

	private void insertar(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		try {
			Area area = new Area();
			area.setNombreAreas(request.getParameter("nombreAreas")); // Asegúrate de que coincida con el formulario

			if (modelo.insertarArea(area) > 0) {
				request.getSession().setAttribute("exito", "Área registrada exitosamente");
			} else {
				request.getSession().setAttribute("fracaso", "No se pudo registrar el área");
			}
			response.sendRedirect(request.getContextPath() + "/AreaController?op=listar");
		} catch (SQLException ex) {
			Logger.getLogger(AreaController.class.getName()).log(Level.SEVERE, null, ex);
			throw new ServletException("Error al insertar área", ex);
		}
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			int idarea = Integer.parseInt(request.getParameter("id"));

			if (modelo.eliminarArea(idarea) > 0) {
				request.getSession().setAttribute("exito", "Área eliminada exitosamente");
			} else {
				request.getSession().setAttribute("fracaso", "No se pudo eliminar el área");
			}
			response.sendRedirect(request.getContextPath() + "/AreaController?op=listar");
		} catch (NumberFormatException | SQLException ex) {
			Logger.getLogger(AreaController.class.getName()).log(Level.SEVERE, null, ex);
			throw new IOException("Error al eliminar área", ex);
		}
	}

	private void obtener(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			Area miarea = modelo.obtenerArea(id);

			if (miarea != null) {
				request.setAttribute("area", miarea);
				request.getRequestDispatcher("/area/EditarArea.jsp").forward(request, response);
			} else {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "Área no encontrada");
			}
		} catch (NumberFormatException ex) {
			Logger.getLogger(AreaController.class.getName()).log(Level.SEVERE, null, ex);
			throw new ServletException("Error al obtener área", ex);
		}
	}

	private void modificar(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		try {
			Area area = new Area();
			area.setIdarea(Integer.parseInt(request.getParameter("id")));
			area.setNombreAreas(request.getParameter("nombreAreas"));

			if (modelo.modificarArea(area) > 0) {
				request.getSession().setAttribute("exito", "Área modificada correctamente");
			} else {
				request.getSession().setAttribute("fracaso", "No se pudo modificar el área");
			}
			response.sendRedirect(request.getContextPath() + "/AreaController?op=listar");
		} catch (NumberFormatException | SQLException ex) {
			Logger.getLogger(AreaController.class.getName()).log(Level.SEVERE, null, ex);
			throw new ServletException("Error al modificar área", ex);
		}
	}
}

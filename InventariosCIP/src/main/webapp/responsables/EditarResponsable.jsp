<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.unu.proyectoWeb.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EDITAR RESPONSABLE</title>

<link rel="icon"
	href="/InventariosCIP/resources/logocip-removebg-preview.ico"
	type="image/x-icon">


</head>


<body>
	
	<div>
		<%@ include file='/cabeceramenu.jsp'%>
	</div>
	<br>


	<%
	String url = "http://localhost:8080/InventariosCIP/";
	//con el ? referencia a enviar un parametro
	Responsable responsable;
	if (request.getAttribute("responsables") == null) {
		responsable = new Responsable();
	} else {
		responsable = (Responsable) request.getAttribute("responsables");
	}
	%>
	<div class="mb-3">
		<div class="container">
			<h3>MODIFICAR UN PERSONAL DEL CIP</h3>
			<form class="row g-3" action="<%=url%>ResponsablesController"
				method="POST">

				<input type="hidden" class="form-control" name="op"
					value="modificar"> <input type="hidden" name="id"
					value="<%=responsable.getIdresponsable()%>" />
				<div class="col-md-3">
					<label class="form-label">Nombre Completo</label> <input
						type="text" class="form-control" name="nombreResponsable"
						id="nombreResponsable"
						value="<%=responsable.getNombreResponsable()%>"
						placeholder="Nombre de Responsable">
				</div>
				<div class="col-md-4">
					<label class="form-label">telefono</label> <input type="text"
						class="form-control" name="telefono" id="telefono"
						value="<%=responsable.getTelefono()%>" placeholder="telefono">
				</div>
				<div class="col-md-4">
					<label class="form-label">Cargo</label> <input type="text"
						class="form-control" name="marca" id="cargo" placeholder="cargo"
						value="<%=responsable.getCargo()%>">
				</div>

				<div class="col-md-4">
					<label for="idarea" class="form-label">Area Perteneciente</label> <select
						id="idarea" name="idarea" class="form-select">
						<option value="" selected>Seleccionar</option>
						<%
						List<Area> listaArea = (List<Area>) request.getAttribute("listaResponsables");
						%>
						<%
						if (listaArea != null && !listaArea.isEmpty()) {
						%>
						<%
						for (Area area : listaArea) {
							boolean isSelected = area.getIdarea() == responsable.getIdareas();
						%>
						<option value="<%=area.getIdarea()%>"
							<%=(area.getIdarea() == responsable.getIdareas()) ? "selected" : ""%>>
							<%=area.getNombreAreas()%>
						</option>
						<%
						}
						%>
						<%
						} else {
						%>
						<option disabled>No hay Areas disponibles</option>
						<%
						}
						%>
					</select>
				</div>

				<div class="col-12">
					<input type="submit" class="btn btn-primary" value="Guardar"
						name="Guardar"> <a class="btn btn-danger"
						href="<%=url%>ResponsablesController?op=listar">Cancelar</a>
				</div>

			</form>







		</div>

	</div>


</body>
</html>
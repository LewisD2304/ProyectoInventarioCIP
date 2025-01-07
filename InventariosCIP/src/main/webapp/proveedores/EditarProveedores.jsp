<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.unu.proyectoWeb.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EDITAR PROVEEDORES</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>


</head>
<body>

	<%@ include file='/cabeceramenu.jsp'%>


	<%
	String url = "http://localhost:8080/InventariosCIP/";
	//con el ? referencia a enviar un parametro
	Proveedores proveedores;
	if (request.getAttribute("proveedores") == null) {
		proveedores = new Proveedores();
	} else {
		proveedores = (Proveedores) request.getAttribute("proveedores");
	}
	%>
	<div class="mb-3">
		<div class="container">
			<h3>MODIFICAR UN PROVEEDOR</h3>
			<form class="row g-3" action="<%=url%>ProveedoresController"
				method="POST">

				<input type="hidden" class="form-control" name="op"
					value="modificar"> <input type="hidden" name="id"
					value="<%=proveedores.getIdproveedores()%>" />
				<div class="col-md-3">
					<label class="form-label">Proveedor</label> <input
						type="text" class="form-control" name="nombreprov"
						id="nombreprov"
						value="<%=proveedores.getNombreprov()%>"
						placeholder="Nombre de Proveedor">
				</div>
				<div class="col-md-4">
					<label class="form-label">Clasificacion</label> <input type="text"
						class="form-control" name="clasificacion" id="clasificacion"
						value="<%=proveedores.getTelefono()%>" placeholder="clasificacion">
				</div>
				<div class="col-md-4">
					<label class="form-label">Ruc</label> <input type="text"
						class="form-control" name="ruc" id="ruc" placeholder="ruc"
						value="<%=proveedores.getRuc()%>">
				</div>
				<div class="col-md-4">
					<label class="form-label">Direccion</label> <input type="text"
						class="form-control" name="direccion" id="direccion" placeholder="direccion"
						value="<%=proveedores.getDireccion()%>">
				</div>
				<div class="col-md-4">
					<label class="form-label">Telefono</label> <input type="text"
						class="form-control" name="telefono" id="telefono" placeholder="telefono"
						value="<%=proveedores.getTelefono()%>">
				</div>
				<div class="col-md-4">
					<label class="form-label">Correo</label> <input type="text"
						class="form-control" name="correo" id="correo" placeholder="correo"
						value="<%=proveedores.getCorreo()%>">
				</div>


				<div class="col-12">
					<input type="submit" class="btn btn-primary" value="Guardar"
						name="Guardar"> <a class="btn btn-danger"
						href="<%=url%>ProveedoresController?op=listar">Cancelar</a>
				</div>

			</form>

		</div>

	</div>


</body>
</html>
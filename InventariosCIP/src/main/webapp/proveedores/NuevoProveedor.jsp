<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.unu.proyectoWeb.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NUEVO BIEN</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
	

<link rel="icon"
	href="/InventariosCIP/resources/logocip-removebg-preview.ico"
	type="image/x-icon">	

<script>
	function validarFormulario() {
		const nombre = document.getElementById('nombre').value.trim();
		const nacionalidad = document.getElementById('nacionalidad').value
				.trim();

		if (nombre === '') {
			alert('Ingrese el nombre del autor');
			document.getElementById('nombre').focus();
			return false;
		}

		if (nacionalidad === '') {
			alert('Ingrese la nacionalidad del autor');
			document.getElementById('nacionalidad').focus();
			return false;
		}
		return true;
	}
</script>

</head>
<body>

	<%@ include file='/cabeceramenu.jsp'%>

	<%
	if (request.getAttribute("respuesta") != null) {
		boolean res = (boolean) request.getAttribute("respuesta");
		if (res) {
			List<String> listaError = (List<String>) request.getAttribute("listaError");
			for (String error : listaError) {
	%>
	<span><%=error%></span>
	<%
	}
	}
	}
	%>


	<%
	//AÑADIR UN BOTON
	String url = "http://localhost:8080/InventariosCIP/";
	//con el ? referencia a enviar un parametro
	%>
	<div class="mb-3">
		<div class="container">
			<h3>REGISTRAR UN PROVEEDOR</h3>

			<form class="row g-3" action="<%=url%>ProveedoresController?op=insertar"
				method="POST">
				<div class="col-md-3">
					<label class="form-label">Nombre del Proveedor</label> <input
						type="text" class="form-control" name="nombreprov" id="nombreprov"
						placeholder="Nombre del Proveedor" style="text-transform: uppercase" required>
				</div>
				<div class="col-md-4">
					<label class="form-label">Clasificacion</label> <input
						type="text" class="form-control" name="clasificacion" id="clasificacion"
						placeholder="Clasificacion" style="text-transform: uppercase" required>
				</div>
				<div class="col-md-4">
					<label class="form-label">Ruc</label> <input type="text"
						class="form-control" name="ruc" id="ruc" placeholder="Ruc" style="text-transform: uppercase">
				</div>
				<div class="col-md-4">
					<label class="form-label">Direccion</label> <input type="text"
						class="form-control" name="direccion" id="direccion"
						placeholder="Direccion" style="text-transform: uppercase">
				</div>
				<div class="col-md-4">
					<label class="form-label">Telefono</label> <input type="text"
						class="form-control" name="telefono" id="telefono"
						placeholder="Telefono" style="text-transform: uppercase">
				</div>
				<div class="col-md-4">
					<label class="form-label">Correo</label> <input
						type="text" class="form-control" name="correo"
						id="correo" placeholder="Correo">
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
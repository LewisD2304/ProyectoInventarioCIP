<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.unu.proyectoWeb.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NUEVO PROVEEDOR</title>

<style type="text/css">
body {
	background-image: url('/InventariosCIP/resources/fondo.png');
	background-size: cover;
	/* La imagen se ajusta para cubrir toda la pantalla */
	background-position: center center;
	/* Centra la imagen en la pantalla */
	background-attachment: fixed;
	/* La imagen de fondo no se mueve al hacer scroll */
	background-repeat: no-repeat; /* No repite la imagen */
}
</style>

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

<!-- 
estilo para botones
 -->
<style>
.hover-effect {
	transition: background-color 0.3s ease, box-shadow 0.3s ease, transform
		0.3s ease;
}

.hover-effect:hover {
	background-color: #4CAF50;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	transform: scale(1.05);
}
</style>

<style>
/* Estilos para el contenedor principal */
.container {
	background-color: #f0f0f0; /* Color de fondo del contenedor */
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	width: 100%;
	/* Asegúrate de que el contenedor se extienda completamente */
	display: flex;
	flex-direction: column;
	gap: 15px; /* Espacio entre cada campo */
}

/* Estilo para los campos de texto */
.container .floating {
	width: 100%; /* Los campos ocuparán todo el ancho disponible */
}

.container .floating input {
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 8px 12px;
	width: 100%;
}

.container .floating label {
	color: #333;
}

/* Efecto de hover para los botones */
.hover-effect {
	transition: background-color 0.3s ease, box-shadow 0.3s ease, transform
		0.3s ease;
}

.hover-effect:hover {
	background-color: #4CAF50;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	transform: scale(1.05);
}
</style>


</head>

<body>


	<div>
		<%@ include file='/cabeceramenu.jsp'%>
	</div>
	<br>


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
	<div class="col-12 d-flex justify-content-center">
		<div class="container">
			<h3>REGISTRAR UN PROVEEDOR</h3>

			<form class="row g-3"
				action="<%=url%>ProveedoresController?op=insertar" method="POST">
				<div class="col-md-6 form-floating">
					<input type="text" class="form-control" name="nombreprov"
						id="nombreprov" placeholder="Nombre del Proveedor"
						style="text-transform: uppercase" required> <label
						for="nombreprov" class="form-label">Nombre del Proveedor</label>
				</div>

				<div class="col-md-6 form-floating">
					<input type="text" class="form-control" name="clasificacion"
						id="clasificacion" placeholder="Clasificación"
						style="text-transform: uppercase" required> <label
						for="clasificacion" class="form-label">Clasificación</label>
				</div>

				<div class="col-md-6 form-floating">
					<input type="text" class="form-control" name="ruc" id="ruc"
						placeholder="RUC" style="text-transform: uppercase"> <label
						for="ruc" class="form-label">RUC</label>
				</div>

				<div class="col-md-6 form-floating">
					<input type="text" class="form-control" name="direccion"
						id="direccion" placeholder="Dirección"
						style="text-transform: uppercase"> <label for="direccion"
						class="form-label">Dirección</label>
				</div>

				<div class="col-md-6 form-floating">
					<input type="text" class="form-control" name="telefono"
						id="telefono" placeholder="Teléfono"
						style="text-transform: uppercase"> <label for="telefono"
						class="form-label">Teléfono</label>
				</div>

				<div class="col-md-6 form-floating">
					<input type="text" class="form-control" name="correo" id="correo"
						placeholder="Correo"> <label for="correo"
						class="form-label">Correo</label>
				</div>

				<div class="col-12 d-flex justify-content-center">
					<input type="submit" class="btn btn-primary mx-2 hover-effect"
						value="Guardar" name="Guardar"> <a class="btn btn-danger"
						href="<%=url%>ProveedoresController?op=listar">Cancelar</a>
				</div>
			</form>

		</div>

	</div>


</body>
</html>
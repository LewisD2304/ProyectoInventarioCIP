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

<link rel="icon"
	href="/InventariosCIP/resources/logocip-removebg-preview.ico"
	type="image/x-icon">

<style type="text/css">
body {
	background-image: url('/InventariosCIP/resources/fondo.jpg');
	background-size: cover;
	/* La imagen se ajusta para cubrir toda la pantalla */
	background-position: center center;
	/* Centra la imagen en la pantalla */
	background-attachment: fixed;
	/* La imagen de fondo no se mueve al hacer scroll */
	background-repeat: no-repeat; /* No repite la imagen */
}
</style>
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
	<div class="col-12 d-flex justify-content-center">
		<div class="container">
			<h3>MODIFICAR UN PROVEEDOR</h3>
			<form class="row g-3" action="<%=url%>ProveedoresController"
				method="POST">

				<input type="hidden" class="form-control" name="op"
					value="modificar"> <input type="hidden" name="id"
					value="<%=proveedores.getIdproveedores()%>" />
				<div class="col-md-6 form-floating">
					<input type="text" class="form-control" name="nombreprov"
						id="nombreprov" value="<%=proveedores.getNombreprov()%>"
						placeholder="Nombre de Proveedor"> <label for="nombreprov"
						class="form-label">Proveedor</label>
				</div>

				<div class="col-md-6 form-floating">
					<input type="text" class="form-control" name="clasificacion"
						id="clasificacion" value="<%=proveedores.getTelefono()%>"
						placeholder="Clasificación"> <label for="clasificacion"
						class="form-label">Clasificación</label>
				</div>
				<div class="col-md-6 form-floating">
					<input type="text" class="form-control" name="ruc" id="ruc"
						placeholder="RUC" value="<%=proveedores.getRuc()%>"> <label
						for="ruc" class="form-label">RUC</label>
				</div>
				<div class="col-md-6 form-floating">
					<input type="text" class="form-control" name="direccion"
						id="direccion" placeholder="Dirección"
						value="<%=proveedores.getDireccion()%>"> <label
						for="direccion" class="form-label">Dirección</label>
				</div>
				<div class="col-md-6 form-floating">
					<input type="text" class="form-control" name="telefono"
						id="telefono" placeholder="Teléfono"
						value="<%=proveedores.getTelefono()%>"> <label
						for="telefono" class="form-label">Teléfono</label>
				</div>
				<div class="col-md-6 form-floating">
					<input type="text" class="form-control" name="correo" id="correo"
						placeholder="Correo" value="<%=proveedores.getCorreo()%>">
					<label for="correo" class="form-label">Correo</label>
				</div>


				<div class="col-12 d-flex justify-content-center">
					<input type="submit" class="btn btn-primary mx-2 hover-effect"
						value="Guardar" name="Guardar"> <a
						class="btn btn-danger mx-2 hover-effect"
						href="<%=url%>ProveedoresController?op=listar">Cancelar</a>
				</div>

			</form>

		</div>

	</div>
	<footer class="bg-danger text-white text-center py-3">
		<p>© 2025 Inventario Web - Todos los derechos reservados.</p>
	</footer>

</body>
</html>
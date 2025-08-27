<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.unu.proyectoWeb.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EDITAR BIEN</title>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">


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
	String url = "http://localhost:8090/InventariosCIP/";
	//con el ? referencia a enviar un parametro
	Bienes bienes;
	if (request.getAttribute("bienes") == null) {
		bienes = new Bienes();
	} else {
		bienes = (Bienes) request.getAttribute("bienes");
	}
	%>
	<div class="col-12 d-flex justify-content-center">
		<div class="container">
			<h3>MODIFICAR BIEN DEL CIP</h3>
			<form class="row g-3" action="<%=url%>BienesController" method="POST">

				<input type="hidden" class="form-control" name="op"
					value="modificar"> <input type="hidden" name="id"
					value="<%=bienes.getIdbienes()%>" />
				<div class="row g-3">
					<!-- Código Único del Bien -->
					<div class="col-md-6 col-lg-4">
						<div class="form-floating">
							<input type="text" class="form-control" name="codigoBien"
								id="codigoBien" value="<%=bienes.getCodigoBien()%>"
								placeholder="Código Único"> <label for="codigoBien">Código
								Único del Bien</label>
						</div>
					</div>
					<!-- Nombre del Bien -->
					<div class="col-md-6 col-lg-4">
						<div class="form-floating">
							<input type="text" class="form-control" name="nombrebien"
								id="nombrebien" value="<%=bienes.getNombrebien()%>"
								placeholder="Nombre del Bien"> <label for="nombrebien">Nombre
								del Bien</label>
						</div>
					</div>
					<!-- Marca -->
					<div class="col-md-6 col-lg-4">
						<div class="form-floating">
							<input type="text" class="form-control" name="marca" id="marca"
								value="<%=bienes.getMarca()%>" placeholder="Marca"> <label
								for="marca">Marca</label>
						</div>
					</div>
					<!-- Modelo -->
					<div class="col-md-6 col-lg-4">
						<div class="form-floating">
							<input type="text" class="form-control" name="modelo" id="modelo"
								value="<%=bienes.getModelo()%>" placeholder="Modelo"> <label
								for="modelo">Modelo</label>
						</div>
					</div>
					<!-- N° de Serie -->
					<div class="col-md-6 col-lg-4">
						<div class="form-floating">
							<input type="text" class="form-control" name="nroSerie"
								id="nroSerie" value="<%=bienes.getNroSerie()%>"
								placeholder="N° de Serie"> <label for="nroSerie">N°
								de Serie</label>
						</div>
					</div>
					<!-- Fecha de Adquisición -->
					<div class="col-md-6 col-lg-4">
						<div class="form-floating">
							<input type="date" class="form-control" name="fechaAdquisicion"
								id="fechaAdquisicion" value="<%=bienes.getFechaAdquisicion()%>"
								placeholder="Fecha de Adquisición"> <label
								for="fechaAdquisicion">Fecha de Adquisición</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-floating">
							<input type="text" class="form-control" name="valorCompra"
								id="valorCompra" placeholder="Valor de compra"
								value="<%=bienes.getValorCompra()%>"> <label
								for="valorCompra">Valor de compra</label>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-floating">
							<select id="estado" name="estado" class="form-select" required>
								<option value="" disabled selected>Seleccionar Estado</option>
								<option value="1"
									<%=(bienes.getEstado() == 1) ? "selected" : ""%>>ACTIVO</option>
								<option value="0"
									<%=(bienes.getEstado() == 0) ? "selected" : ""%>>INACTIVO</option>
							</select> <label for="estado">Estado</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-floating">
							<input type="text" class="form-control" name="descripcion"
								id="descripcion" placeholder="Descripcion"
								value="<%=bienes.getDescripcion()%>"> <label
								for="descripcion">Descripción</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-floating">
							<select id="idcategoriass" name="idcategoriass"
								class="form-select">
								<option value="" disabled selected>Seleccionar
									Categoría</option>
								<%
								List<Categorias> listacategorias = (List<Categorias>) request.getAttribute("NuevoBien");
								%>
								<%
								if (listacategorias != null && !listacategorias.isEmpty()) {
									for (Categorias categoria : listacategorias) {
										boolean isSelected = categoria.getIdcategorias() == bienes.getIdcategoriass();
								%>
								<!-- Mostrar el valor de cada comparación en la consola -->
								<option value="<%=categoria.getIdcategorias()%>"
									<%=isSelected ? "selected" : ""%>>
									<%=categoria.getNombreCategoria()%>
								</option>
								<%
								}
								} else {
								%>
								<option disabled>No hay categorías disponibles</option>
								<%
								}
								%>
							</select> <label for="idcategoriass">Categoría</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-floating">
							<select id="idproveedores" name="idproveedores"
								class="form-select">
								<option value="" selected>Seleccionar</option>
								<%
								List<Proveedores> listaproveedor = (List<Proveedores>) request.getAttribute("listaproveedores");
								%>
								<%
								if (listaproveedor != null && !listaproveedor.isEmpty()) {
									for (Proveedores proveedor : listaproveedor) {
										boolean isSelected = proveedor.getIdproveedores() == bienes.getIdproveedoress();
								%>
								<option value="<%=proveedor.getIdproveedores()%>"
									<%=isSelected ? "selected" : ""%>>
									<%=proveedor.getNombreprov()%>
								</option>
								<%
								}
								} else {
								%>
								<option disabled>No hay proveedores disponibles</option>
								<%
								}
								%>
							</select> <label for="idproveedores">Proveedores</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-floating">
							<select id="idresponsables" name="idresponsables"
								class="form-select">
								<option value="" selected>Seleccionar</option>
								<%
								List<Responsable> listaresponsable = (List<Responsable>) request.getAttribute("listaresponsable");
								%>
								<%
								if (listaresponsable != null && !listaresponsable.isEmpty()) {
									for (Responsable responsable : listaresponsable) {
								%>
								<option value="<%=responsable.getIdresponsable()%>"
									<%=responsable.getIdresponsable() == bienes.getIdresponsables() ? "selected" : ""%>>
									<%=responsable.getNombreResponsable()%>
								</option>
								<%
								}
								} else {
								%>
								<option disabled>No hay responsable disponibles</option>
								<%
								}
								%>
							</select> <label for="idresponsables">Responsable</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-floating">
							<select id="idcomprobantes" name="idcomprobantes"
								class="form-select">
								<option value="" selected>Seleccionar</option>
								<%
								List<Comprobantepago> listarComprobante = (List<Comprobantepago>) request.getAttribute("ListaComprobante");
								%>
								<%
								if (listarComprobante != null && !listarComprobante.isEmpty()) {
									for (Comprobantepago comprobante : listarComprobante) {
								%>
								<option value="<%=comprobante.getIdcomprobantePago()%>"
									<%=comprobante.getIdcomprobantePago() == bienes.getIdcomprobantes() ? "selected" : ""%>>
									<%=comprobante.getIdmediopago() != null ? comprobante.getIdmediopago() : "-"%>
									<%=comprobante.getNumeroMedioPago() != null ? comprobante.getNumeroMedioPago() : "-"%>
									<%=comprobante.getIdtipoComprobante() != null ? comprobante.getIdtipoComprobante() : "-"%>
									<%=comprobante.getNumero() != null ? comprobante.getNumero() : "-"%>
								</option>
								<%
								}
								} else {
								%>
								<option disabled>No hay comprobantes disponibles</option>
								<%
								}
								%>
							</select> <label for="idcomprobantes">Comprobante de Pago</label>
						</div>
					</div>
				</div>
				<div class="col-12 d-flex justify-content-center">
					<input type="submit" class="btn btn-primary mx-2 hover-effect"
						value="Guardar" name="Guardar"> <a
						class="btn btn-danger mx-2 hover-effect"
						href="<%=url%>BienesController?op=listarConPaginacion&pagina">Cancelar</a>
				</div>

			</form>







		</div>

	</div>


</body>
</html>
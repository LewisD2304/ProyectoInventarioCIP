<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.unu.proyectoWeb.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NUEVO BIEN</title>

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

<!-- JavaScript -->
<script
	src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css" />
<!-- Bootstrap theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/bootstrap.min.css" />

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


<%
// Recuperamos el valor de "registroExitoso" que el controlador ha establecido
Boolean registroExitoso = (Boolean) request.getAttribute("registroExitoso");
%>

<script>
document.addEventListener("DOMContentLoaded", function() {
    const toggleForm = document.getElementById("toggleForm");
    const nombreField = document.getElementById("nombre");
    const numeromField = document.getElementById("numerom");
    const guardarButton = document.getElementById("guardarMedioPago");

    toggleForm.addEventListener("change", function() {
        const isChecked = toggleForm.checked;
        nombreField.disabled = !isChecked;
        numeromField.disabled = !isChecked;
        guardarButton.disabled = !isChecked;
    });
});
</script>


<script type="text/javascript">
document.getElementById('miFormulario').addEventListener('submit', function(event) {
    event.preventDefault(); // Previene el envío real del formulario

    // Obtener los datos del formulario
    const formData = new FormData(this);

    // Enviar los datos mediante una solicitud AJAX
    fetch('BienesController?op=insertar', { // Cambia la URL al endpoint adecuado
        method: 'POST',
        body: formData
    })
    .then(response => {
        if (!response.ok) { 
            // Manejar errores HTTP (status 4xx o 5xx)
            throw new Error('Error en la respuesta del servidor: ' + response.statusText);
        }
        return response.json(); // Intentar analizar la respuesta como JSON
    })
    .then(data => {
        if (data.success) { // Validamos la respuesta del servidor
            // Configurar Alertify para éxito
            alertify.set('notifier', 'delay', 4);
            alertify.set('notifier', 'position', 'bottom-right');
            alertify.success('Datos ingresados correctamente.');

            // Redirigir después de un breve retraso
            setTimeout(function() {
                window.location.href = 'BienesController?op=listar';
            }, 2000); // 2 segundos de espera
        } else {
            // Mostrar errores si los datos no fueron válidos
            alertify.set('notifier', 'delay', 4);
            alertify.error(data.message || 'Hubo un error al ingresar los datos.');
        }
    })
    .catch(error => {
        console.error('Error:', error); // Imprime errores en la consola para depuración
        alertify.set('notifier', 'delay', 4);
        alertify.error('Error de conexión con el servidor. Verifique la red o el servidor.');
    });
});
</script>

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
	<div class="mb-3">
		<div class="container">
			<h3>REGISTRAR UN BIEN DEL CIP</h3>

			<h4>Añada el Comprobante de pago</h4>

			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#exampleModalCenter">+ TIPO DE COMPROBANTE
			</button>

			<!-- Modal -->
			<div class="modal fade" id="exampleModalCenter" tabindex="-1"
				aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalCenterTitle">REGISTRE
								COMPROBANTE</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">

							<div class="modal-body">

								<div class="form-check">
									<input type="checkbox" class="form-check-input" id="toggleForm">
									<label class="form-check-label" for="toggleForm">Habilitar
										formulario de Medio de Pago</label>
								</div>

								<form class="row g-3" id="medioPagoForm"
									action="<%=url%>MediopagoController?op=insertar" method="POST">
									<div class="col-md-4">
										<label class="form-label">Medio de Pago</label> <input
											type="text" class="form-control" name="nombre" id="nombre"
											placeholder="Nombre del Medio Pago" disabled required>
									</div>
									<div class="col-md-5">
										<label class="form-label">N° Medio de pago</label> <input
											type="text" class="form-control" name="numerom" id="numerom"
											placeholder="N° Medio de Pago" disabled>
									</div>
									<button type="submit" class="btn btn-primary"
										id="guardarMedioPago" disabled>Guardar cambios</button>
								</form>
							</div>


							<form class="row g-6"
								action="<%=url%>ComprobantepagoController?op=insertar" method="POST">
								<div class="col-md-5">
									<br> <label for="idmediopago" class="form-label">Medio
										de pago</label> <select id="idmediopago" name="idmediopago"
										class="form-select">
										<option value="" selected>Seleccionar</option>
										<%
										List<Mediopago> listaMediopago = (List<Mediopago>) request.getAttribute("ListaMedioPago");

										if (listaMediopago != null && !listaMediopago.isEmpty()) {
											for (Mediopago tipo : listaMediopago) {
										%>
										<option value="<%=tipo.getidMediopago()%>">
											<%=tipo.getNombre()%>
											<%=tipo.getNumerom()%>
										</option>
										<%
										}
										} else {
										%>
										<option disabled>No hay tipos de comprobante
											disponibles</option>
										<%
										}
										%>
									</select>
								</div>

								<br>
								<div class="col-md-4">
									<label for="idtipocomprobante" class="form-label">Tipo
										de Comprobante</label> <select id="idtipocomprobante"
										name="idtipocomprobante" class="form-select">
										<option value="" selected>Seleccionar</option>
										<%
										List<Tipocomprobante> listaTipo = (List<Tipocomprobante>) request.getAttribute("ListaTipocomprobante");

										if (listaTipo != null && !listaTipo.isEmpty()) {
											for (Tipocomprobante tipo : listaTipo) {
										%>
										<option value="<%=tipo.getIdTipocomprobante()%>">
											<%=tipo.getNombre()%>
										</option>
										<%
										}
										} else {
										%>
										<option disabled>No hay tipos de comprobante
											disponibles</option>
										<%
										}
										%>
									</select>
								</div>

								<div class="col-md-4">
									<label class="form-label">Numero de Medio de pago</label> <input
										type="text" class="form-control" name="numero" id="numero"
										placeholder="numero">
								</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Cerrar</button>
							<button type="submit" class="btn btn-primary">Guardar
								cambios</button>
						</div>
						</form>
						
					</div>
				</div>
			</div>

			<form class="row g-3"></form>


			

			<form id="miFormulario" class="row g-3"
				action="<%=url%>BienesController?op=insertar" method="POST">
				<div class="row g-3">
					<div class="col-md-6 col-lg-4">
						<div class="form-floating">
							<input type="text" class="form-control" name="codigoBien"
								id="codigoBien" placeholder="Codigo Unico" required> <label
								for="codigoBien" class="form-label">Código Único del
								Bien</label>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-floating">
							<input type="text" class="form-control" name="nombrebien"
								id="nombrebien" placeholder="Nombre del Bien" required>
							<label for="nombrebien" class="form-label">Nombre del
								Bien</label>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-floating">
							<input type="text" class="form-control" name="marca" id="marca"
								placeholder="Marca"> <label for="marca"
								class="form-label">Marca</label>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-floating">
							<input type="text" class="form-control" name="modelo" id="modelo"
								placeholder="Modelo"> <label for="modelo"
								class="form-label">Modelo</label>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-floating">
							<input type="text" class="form-control" name="nroSerie"
								id="nroSerie" placeholder="N° de Serie"> <label
								for="nroSerie" class="form-label">N° de Serie</label>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-floating">
							<input type="date" class="form-control" name="fechaAdquisicion"
								id="fechaAdquisicion" placeholder="Fecha de Adquisicion">
							<label for="fechaAdquisicion" class="form-label">Fecha de
								Adquisición</label>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-floating">
							<input type="text" class="form-control" name="valorCompra"
								id="valorCompra" placeholder="Valor de compra"> <label
								for="valorCompra" class="form-label">Valor de compra</label>
						</div>
					</div>

					<div class="col-md-2">
						<div class="form-floating">
							<select id="estado" name="estado" class="form-select" required>
								<option value="" disabled selected>Seleccionar Estado</option>
								<option value="1">ACTIVO</option>
								<option value="0">INACTIVO</option>
							</select> <label for="estado" class="form-label">Estado</label>
						</div>
					</div>

					<div class="col-md-6">
						<div class="form-floating">
							<textarea class="form-control" id="descripcion"
								name="descripcion" rows="3" placeholder="Descripcion"></textarea>
							<label for="descripcion" class="form-label">Descripción</label>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-floating">
							<select id="idcategorias" name="idcategoriass"
								class="form-select">
								<option value="" selected disabled>Seleccionar
									Categoría</option>
								<%
								List<Categorias> listacategorias = (List<Categorias>) request.getAttribute("NuevoBien");
								if (listacategorias != null && !listacategorias.isEmpty()) {
									for (Categorias categoria : listacategorias) {
								%>
								<option value="<%=categoria.getIdcategorias()%>"><%=categoria.getNombreCategoria()%></option>
								<%
								}
								} else {
								%>
								<option disabled>No hay categorías disponibles</option>
								<%
								}
								%>
							</select> <label for="idcategorias" class="form-label">Categoría</label>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-floating">
							<select id="idproveedores" name="idproveedoress"
								class="form-select">
								<option value="" selected>Seleccionar</option>
								<%
								List<Proveedores> listaproveedor = (List<Proveedores>) request.getAttribute("listaproveedores");
								if (listaproveedor != null && !listaproveedor.isEmpty()) {
									for (Proveedores proveedor : listaproveedor) {
								%>
								<option value="<%=proveedor.getIdproveedores()%>"><%=proveedor.getNombreprov()%></option>
								<%
								}
								} else {
								%>
								<option disabled>No hay proveedores disponibles</option>
								<%
								}
								%>
							</select> <label for="idproveedores" class="form-label">Proveedores</label>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-floating">
							<select id="idresponsable" name="idresponsables"
								class="form-select">
								<option value="" selected>Seleccionar</option>
								<%
								List<Responsable> listaresponsable = (List<Responsable>) request.getAttribute("listaresponsable");
								if (listaresponsable != null && !listaresponsable.isEmpty()) {
									for (Responsable responsable : listaresponsable) {
								%>
								<option value="<%=responsable.getIdresponsable()%>"><%=responsable.getNombreResponsable()%></option>
								<%
								}
								} else {
								%>
								<option disabled>No hay responsables disponibles</option>
								<%
								}
								%>
							</select> <label for="idresponsable" class="form-label">Responsable</label>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-floating">
							<select id="idcomprobantes" name="idcomprobantes"
								class="form-select">
								<option value="" selected>Seleccionar</option>
								<%
								List<Comprobantepago> listarComprobante = (List<Comprobantepago>) request.getAttribute("ListaComprobante");
								if (listarComprobante != null && !listarComprobante.isEmpty()) {
									for (Comprobantepago comprobante : listarComprobante) {
								%>
								<option value="<%=comprobante.getIdcomprobantePago()%>">
									<%=comprobante.getIdmediopago() != null ? comprobante.getIdmediopago() : "-"%>
									<%=comprobante.getNumeroMedioPago() != null ? comprobante.getNumeroMedioPago() : "-"%>
									<%=comprobante.getIdtipoComprobante() != null ? comprobante.getIdtipoComprobante() : "-"%>
									<%=comprobante.getNumero() != null ? comprobante.getNumero() : "-"%>
								</option>
								<%
								}
								} else {
								%>
								<option disabled>No hay Comprobante de pago disponibles</option>
								<%
								}
								%>
							</select> <label for="idcomprobantes" class="form-label">Comprobante
								de Pago</label>
						</div>
					</div>
				</div>

				<div class="col-12 d-flex justify-content-center">
					<input type="submit" class="btn btn-primary mx-2 hover-effect"
						value="Guardar" name="Guardar"> <a
						class="btn btn-danger mx-2 hover-effect"
						href="<%=url%>BienesController?op=listar">Cancelar</a>
				</div>
			</form>


		</div>

	</div>





</body>
</html>
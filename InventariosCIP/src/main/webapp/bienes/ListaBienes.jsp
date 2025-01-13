<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.unu.proyectoWeb.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>INVENTARIO WEB</title>

<link rel="icon"
	href="/InventariosCIP/resources/logocip-removebg-preview.ico"
	type="image/x-icon">

<style>
.card {
	border-radius: .5rem;
}

.mask-custom {
	background: rgba(24, 24, 16, .2);
	border-radius: 2em;
	backdrop-filter: blur(25px);
	border: 2px solid rgba(255, 255, 255, 0.05);
	background-clip: padding-box;
	box-shadow: 10px 10px 10px rgba(46, 54, 68, 0.03);
}
</style>

<style>
/* Estilos del fondo del modal */
.modal {
	display: none; /* Oculto por defecto */
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.5); /* Fondo semitransparente */
}

/* Contenido del modal */
.modal-content {
	background-color: #fff;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 30%;
	max-width: 400px;
	border-radius: 8px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
	position: relative;
}

/* Botón de cierre */
.close-button {
	color: #aaa;
	float: right;
	font-size: 24px;
	font-weight: bold;
	cursor: pointer;
}

.close-button:hover, .close-button:focus {
	color: #000;
	text-decoration: none;
}
</style>

<style>
.container-custom {
	width: 100%; /* Ocupa el 80% del ancho del viewport */
	max-width: 1350px; /* No excede los 1200px en pantallas grandes */
	margin: 0 auto; /* Centra el contenedor */
}

@media print {
	/* Asegura que todo el contenido sea visible */
	.table-responsive {
		overflow: visible !important;
	}

	/* Elimina los saltos de página no deseados */
	table {
		page-break-inside: auto;
	}

	/* Permite que las filas se mantengan juntas */
	tr {
		page-break-inside: avoid;
		page-break-after: auto;
	}

	/* Ajusta el tamaño del contenido al papel */
	body {
		margin: 0;
		padding: 0;
		width: 100%;
	}

	/* Asegura que las imágenes no excedan el ancho de la página */
	img {
		max-width: 100% !important;
	}

	/* Oculta elementos innecesarios para la impresión */
	.no-print {
		display: none !important;
		  
	}
}
</style>

<!-- diseño para los botones de paginacion -->

<style type="text/css">
.pagination-container {
	text-align: center;
	/* Asegura que los elementos dentro del contenedor se centren */
	margin-top: 20px;
	width: 100%;
	/* Otras opciones que aseguran que ocupe todo el ancho disponible */
}

.pagination {
	display: inline-flex;
	/* Cambia de block a inline-flex para alinear los elementos en línea */
	padding: 0; /* Elimina los márgenes/paddings que puedan interferir */
	margin: 0; /* Asegúrate de que no haya margen extra */
}

.page-item {
	margin: 0 5px;
	/* Agrega un margen entre los elementos de la paginación */
}

.page-link {
	padding: 10px 15px;
	background-color: #f1f1f1;
	border: 1px solid #ddd;
	color: #333;
	text-decoration: none; /* Elimina el subrayado */
}

.page-link:hover {
	background-color: #ddd;
}
</style>


<script>
	// Función para abrir el modal con la descripción
	function showDescription(description) {
		const modal = document.getElementById('descriptionModal');
		const modalDescription = document.getElementById('modalDescription');
		
		// Asigna la descripción al contenido del modal
		// Asegurarse de que se manejen correctamente los caracteres especiales
		modalDescription.textContent = description; // Usa textContent en lugar de innerHTML para evitar inyecciones de código malicioso

		// Muestra el modal
		modal.style.display = 'block';
	}

	// Función para cerrar el modal
	function closeModal2() {
		const modal = document.getElementById('descriptionModal');
		modal.style.display = 'none';
	}

	// Cierra el modal al hacer clic fuera del contenido
	window.onclick = function(event) {
		const modal = document.getElementById('descriptionModal');
		// Cierra el modal si haces clic fuera del contenido principal
		if (event.target === modal) {
			modal.style.display = 'none';
		}
	};
</script>



<script>
	// Función para abrir el modal con la descripción
	function showComprobante(comprobante) {
		const modal = document.getElementById('comprobanteModal');
		const modalComprobante = document.getElementById('modalComprobante');

		// Asigna la descripción al contenido del modal
		modalComprobante.textContent = comprobante;
		modalComprobante.innerHTML = comprobante;

		// Muestra el modal
		modal.style.display = 'block';
	}

	// Función para cerrar el modal
	function closeModal() {
		const modal = document.getElementById('comprobanteModal');
		modal.style.display = 'none';
	}

	// Cierra el modal al hacer clic fuera del contenido
	window.onclick = function(event) {
		const modal = document.getElementById('comprobanteModal');
		if (event.target === modal) {
			modal.style.display = 'none';
		}
	}
</script>

<script>

	//Scroll al final de la tabla
    function scrollToEnd() {
        const tableContainer = document.getElementById('tableContainer');
        tableContainer.scrollTop = tableContainer.scrollHeight;
    }
	
  	//Scroll al inicio de la tabla
    function scrollToStart() {
        const tableContainer = document.getElementById('tableContainer');
        tableContainer.scrollTop = 0; // Ir al inicio
    }
</script>



<script>
		function eliminar(id) {
			if (confirm("¿Desea eliminar el registro?") == true) {
				location.href = "BienesController?op=eliminar&id=" + id;
			}
		}
		
		function updateCheckboxState(idBien, isChecked) {
		    let nuevoEstado = 0;
			
		    if(isChecked == 0 || isChecked == null){
		    	nuevoEstado = 1;
		    }else{
		    	nuevoEstado = 0;
		    }
		    
		    // Realizar una solicitud AJAX para actualizar el estado
		    var url = "BienesController?op=actualizarEstadoCheckbox&idBien="+idBien+"&nuevoEstado="+nuevoEstado;
		    
		    fetch(url, {
		        method: "GET",
		    })
		    .then(response => response.json())
		    .then(data => {
		        if (data.success) {
		            alert("Estado actualizado correctamente.");
		        } else {
		            alert("Error al actualizar el estado.");
		            // Restablecer el checkbox a su estado anterior en caso de error
		            document.getElementById(`checkbox_${idBien}`).checked = !isChecked;
		        }
		    })
		    .catch(error => {
		        console.error("Error en la solicitud:", error);
		        alert("Error al actualizar el estadoooooo.");
		        // Restablecer el checkbox a su estado anterior en caso de error
		        document.getElementById(`checkbox_${idBien}`).checked = !isChecked;
		    });
		}
		
</script>


</head>


<body>

	<div>
		<%@ include file='/cabeceramenu.jsp'%>
	</div>
	<br>




	<%
	String url = "http://localhost:8080/InventariosCIP/";
	%>

	<div class="bg-secondary-subtle p-3 rounded shadow-sm"
		style="margin-top: -30px;">
		<div class="container">
			<h1 class="m-0">REGISTRO DE BIENES</h1>
		</div>

		<div class="container">
			<div class="d-flex justify-content-end mb-2">
				<a class="btn btn-success d-flex align-items-center"
					href="<%=url%>BienesController?op=agregar"> <svg
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-plus-square me-1"
						viewBox="0 0 16 16">
                    <path
							d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z" />
                    <path
							d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4" />
                </svg> Añadir Bienes
				</a>
			</div>
		</div>
	</div>

	<br>




	<nav class="navbar bg-body-tertiary">
		<div class="container d-flex justify-content-end align-items-center">
			<form id="form-busqueda" action="<%=url%>BienesController"
				method="GET" class="d-flex align-items-center">
				<!-- Campo de búsqueda por nombre del bien -->
				<input class="form-control me-2" type="search" name="buscar"
					id="buscar" placeholder="Buscar nombre del bien"
					aria-label="buscar">

				<!-- Botón de búsqueda general centrado -->
				<button class="btn btn-outline-secondary ms-2 me-2" type="submit"
					name="op" value="buscarXnombre">
					<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
						fill="currentColor" class="bi bi-search" viewBox="0 0 18 18">
                    <path
							d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
                </svg>
				</button>

				<!-- Campo de selección para el área -->
				<select name="area" id="area" class="form-select me-2">
					<option value="">Seleccionar área</option>
					<%
					List<Area> listaAreas = (List<Area>) request.getAttribute("ListaAreas");
					if (listaAreas != null && !listaAreas.isEmpty()) {
						for (Area area : listaAreas) {
					%>
					<option value="<%=area.getIdarea()%>"><%=area.getNombreAreas()%></option>
					<%
					}
					} else {
					%>
					<option disabled>No hay áreas disponibles</option>
					<%
					}
					%>
				</select>

				<!-- Botón de búsqueda por área -->
				<button class="btn btn-outline-success" type="submit" name="op"
					value="buscarBienesxArea">
					<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
						fill="currentColor" class="bi bi-search" viewBox="0 0 18 18">
                    <path
							d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
                </svg>
				</button>
			</form>
		</div>
	</nav>



	<div class="container-custom">
		<div class="row justify-content-center">
			<div class="col-12">
				<div class="card shadow-2-strong" style="background-color: #f5f7fa;">
					<div class="card-body">
						<div class="table-responsive" id="table-responsive">
							<div
								class="d-flex justify-content-between align-items-center mb-2">
								<div class="d-flex">
									<button class="btn btn-secondary p-1" onclick="scrollToStart()">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-arrow-up-circle-fill"
											viewBox="0 0 16 16">
                							<path
												d="M16 8A8 8 0 1 0 0 8a8 8 0 0 0 16 0m-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707z" />
            							</svg>
									</button>

									<button class="btn btn-secondary p-1 ms-2"
										onclick="scrollToEnd()">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-arrow-down-circle-fill"
											viewBox="0 0 16 16">
                							<path
												d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293z" />
          							  </svg>
									</button>
								</div>

								<p class="d-inline-flex">
									<a class="btn btn-dark p-0" role="button" aria-expanded="false"
										type="button" href="<%=url%>BienesController?op=listar"><svg
											xmlns="http://www.w3.org/2000/svg" width="25" height="25"
											fill="currentColor" class="bi bi-arrow-clockwise"
											viewBox="0 0 16 16">
 												 <path fill-rule="evenodd"
												d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2z" />
 												 <path
												d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466" />
</svg> </a>
								</p>


							</div>



							<div id="tableContainer"
								style="overflow-y: auto; max-height: 500px; border: 1px;">
								<table class="table table-borderless mb-0;table table-hover"
									style="margin-top: -10px; font-size: 12px">
									<thead class="table"
										style="position: sticky; top: 0; background-color: #ffffff; z-index: 1;">
										<tr>
											<th>N°</th>
											<th>ROTULADO</th>
											<th>CODIGO</th>
											<th>NOMBRE DEL BIEN</th>
											<th>MARCA</th>
											<th>MODELO</th>
											<th>N° SERIE</th>
											<th>CATEGORIA</th>
											<th>RESPONSABLE</th>
											<th>AREA</th>
											<th>ESTADO</th>
											<th>PROVEEDOR</th>
											<th>FECHA DE ADQUISICION</th>
											<th>S/.</th>
											<th>DESCRIPCION</th>
											<th>COMPROBANTE</th>
											<th>OPERACIONES</th>
										</tr>
									</thead>
									<tbody>
										<%
										List<Bienes> listaBienes = (List<Bienes>) request.getAttribute("ListaBienes");

										// Verificar si la lista no es nula
										if (listaBienes != null && !listaBienes.isEmpty()) {
											for (Bienes bienes : listaBienes) {
										%>
										<tr>
											<td><%=bienes.getIdbienes()%></td>
											<td>
												<div
													class="form-check d-flex justify-content-center align-items-center">
													<input class="form-check-input" type="checkbox"
														value="<%=bienes.getIdbienes()%>"
														id="checkbox_<%=bienes.getIdbienes()%>"
														<%=bienes.getVerificar() == 1 ? "checked" : ""%>
														onchange="updateCheckboxState(<%=bienes.getIdbienes()%>, <%=bienes.getVerificar() == 1%>)">
													<label class="form-check-label"
														for="checkbox_<%=bienes.getIdbienes()%>"></label>
												</div>
											</td>
											<td><%=(bienes.getCodigoBien() != null && !bienes.getCodigoBien().isEmpty()) ? bienes.getCodigoBien() : "N/A"%></td>
											<td><%=(bienes.getNombrebien() != null && !bienes.getNombrebien().isEmpty()) ? bienes.getNombrebien() : "N/A"%></td>
											<td><%=(bienes.getMarca() != null && !bienes.getMarca().isEmpty()) ? bienes.getMarca() : "N/A"%></td>
											<td><%=(bienes.getModelo() != null && !bienes.getModelo().isEmpty()) ? bienes.getModelo() : "N/A"%></td>
											<td><%=(bienes.getNroSerie() != null && !bienes.getNroSerie().isEmpty()) ? bienes.getNroSerie() : "N/A"%></td>
											<td><%=(bienes.getIdcategorias() != null) ? bienes.getIdcategorias() : "N/A"%></td>
											<td><%=(bienes.getIdresponsable() != null) ? bienes.getIdresponsable() : "N/A"%></td>
											<td><%=(bienes.getNombreArea() != null && !bienes.getNombreArea().isEmpty()) ? bienes.getNombreArea() : "N/A"%></td>
											<td><%=bienes.getEstado() == 1 ? "ACTIVO" : "INACTIVO"%></td>
											<td><%=(bienes.getIdproveedores() != null) ? bienes.getIdproveedores() : "N/A"%></td>
											<td><%=(bienes.getFechaAdquisicion() != null && !bienes.getFechaAdquisicion().isEmpty()) ? bienes.getFechaAdquisicion()
				: "N/A"%></td>
											<td><%=(bienes.getValorCompra() != null && !bienes.getValorCompra().isEmpty()) ? bienes.getValorCompra() : "N/A"%></td>
											<td>
												<button class="btn btn-info btn-sm"
													onclick="showDescription('<%=(bienes.getDescripcion() != null && !bienes.getDescripcion().isEmpty()) ? bienes.getDescripcion()
		: "NO HAY DATOS"%>')">
													Ver</button>
											</td>
											<td>
												<button class="btn btn-info btn-sm"
													onclick="showComprobante('<%=(bienes.getNombreMedioPago() != null || bienes.getNumeroMedioPago() != null
		|| bienes.getNombreTipoComprobante() != null || bienes.getNumeroComprobante() != null)
				? (bienes.getNombreMedioPago() != null ? "Medio de Pago: " + bienes.getNombreMedioPago() + "<br>" : "")
						+ (bienes.getNumeroMedioPago() != null
								? "Número Medio de Pago: " + bienes.getNumeroMedioPago() + "<br>"
								: "")
						+ (bienes.getNombreTipoComprobante() != null
								? "Tipo de Comprobante: " + bienes.getNombreTipoComprobante() + "<br>"
								: "")
						+ (bienes.getNumeroComprobante() != null
								? "Número de Comprobante: " + bienes.getNumeroComprobante() + "<br>"
								: "")
				: "NO HAY DATOS REGISTRADOS"%>')">
													Ver</button>
											</td>
											<td><a
												href="<%=url%>BienesController?op=obtener&id=<%=bienes.getIdbienes()%>"
												class="btn btn-outline-info btn-sm p-1"> <svg
														xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														fill="currentColor" class="bi bi-pencil-square"
														viewBox="0 0 16 16">
                <path
															d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                <path fill-rule="evenodd"
															d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
            </svg>
											</a> <a href="javascript:eliminar('<%=bienes.getIdbienes()%>')"
												class="btn btn-outline-danger btn-sm p-1"> <svg
														xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														fill="currentColor" class="bi bi-trash"
														viewBox="0 0 16 16">
                <path
															d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z" />
                <path
															d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z" />
            </svg>
											</a></td>
										</tr>
										<%
										}
										} else {
										%>

										<tr>
											<td>No hay datos</td>
											<td>No hay datos</td>
											<td>No hay datos</td>
											<td>No hay datos</td>
											<td>No hay datos</td>
											<td>No hay datos</td>
											<td>No hay datos</td>
											<td>No hay datos</td>
											<td>No hay datos</td>
											<td>No hay datos</td>
											<td>No hay datos</td>
											<td>No hay datos</td>
											<td></td>
										</tr>

										<%
										}
										%>

									</tbody>

								</table>



								</table>




								<div id="descriptionModal" class="modal">
									<div class="modal-content">
										<span class="close-button" onclick="closeModal2()">&times;</span>
										<h3>Descripción Completa</h3>
										<p id="modalDescription"></p>
									</div>
								</div>

								<div id="comprobanteModal" class="modal">
									<div class="modal-content">
										<span class="close-button" onclick="closeModal()">&times;</span>
										<h3>Comprobante</h3>
										<p id="modalComprobante"></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<br>



	<div class="container">
		<div class="d-flex justify-content-end mb-3"></div>
	</div>




</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.unu.proyectoWeb.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>PAGINA WEB</title>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
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



</head>

<body>

	<div>
		<%@ include file='/cabeceramenu.jsp'%>
	</div>
	<br>

	<script>
		function eliminar(id) {
			if (confirm("¿Desea eliminar el registro?") == true) {
				location.href = "AreaController?op=eliminar&id=" + id;
			}
		}
	</script>
	<script>
		function editar(id, nombre) {
			// Establecer valores en los campos del formulario
			document.getElementById('idEditarArea').value = id;
			document.getElementById('nombreEditarArea').value = nombre;

			// Mostrar el modal
			var modal = new bootstrap.Modal(document
					.getElementById('modalEditarArea'));
			modal.show();
		}
	</script>


	<%
	String url = "http://localhost:8080/InventariosCIP/";
	%>
	<br>

	<div class="bg-secondary-subtle p-3 rounded shadow-sm"
		style="margin-top: -50px;">
		<div class="container">
			<H1>REGISTRO DE AREA</H1>
		</div>
		<div class="container">
			<div class="d-flex justify-content-end mb-2">
				<!-- Botón para abrir el modal -->
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#modalAgregarArea">+ Agregar Área</button>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="modalAgregarArea" tabindex="-1"
		aria-labelledby="modalAgregarAreaLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalAgregarAreaLabel">Agregar
						Nueva Área</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Formulario para agregar una nueva área -->
					<form action="<%=url%>AreaController?op=insertar" method="POST">
						<div class="mb-3">
							<label for="nombreArea" class="form-label">Nombre del
								Área</label> <input type="text" class="form-control" id="nombreAreas"
								name="nombreAreas" placeholder="Ingrese el nombre del área"
								required>
						</div>
						<button type="submit" class="btn btn-primary">Guardar
							cambios</button>
					</form>
				</div>
			</div>
		</div>
	</div>




	<br>





	<div class="mask d-flex align-items-center h-100">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12">
					<div class="card shadow-2-strong"
						style="background-color: #f5f7fa;"
						style="background-color: #f5f7fa;">
						<div class="card-body">
							<div class="table-responsive">
								<div style="overflow-x: auto; max-height: 500px; border: 1px;">
									<table class="table table-borderless mb-0;table table-hover"
										style="margin-top: -10px; font-size: 12px;">
										<thead class="table">
											<tr>
												<th>N°</th>
												<th>NOMBRE</th>
												<th>OPERACIONES</th>
											</tr>
										</thead>
										<tbody>
											<%
											List<Area> listaArea = (List<Area>) request.getAttribute("ListaAreas");

											// Verificar si la lista no es nula
											if (listaArea != null && !listaArea.isEmpty()) {
												for (Area area : listaArea) {
											%>
											<tr>
												<td><%=area.getIdarea()%></td>
												<td><%=area.getNombreAreas()%></td>

												<td><a href="javascript:void(0)"
													class="btn btn-outline-info btn-sm p-1"
													onclick="editar('<%=area.getIdarea()%>', '<%=area.getNombreAreas()%>')">
														<svg xmlns="http://www.w3.org/2000/svg" width="16"
															height="16" fill="currentColor"
															class="bi bi-pencil-square" viewBox="0 0 16 16">
       <path
																d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
       <path fill-rule="evenodd"
																d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
   </svg>
												</a>

													<div class="modal fade" id="modalEditarArea" tabindex="-1"
														aria-labelledby="modalEditarAreaLabel" aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="modalEditarAreaLabel">Editar
																		Área</h5>
																	<button type="button" class="btn-close"
																		data-bs-dismiss="modal" aria-label="Close"></button>
																</div>
																<div class="modal-body">
																	<!-- Formulario para editar el área -->
																	<form id="formEditarArea"
																		action="<%=url%>AreaController?op=modificar"
																		method="POST">
																		<input type="hidden" id="idEditarArea" name="id">
																		<div class="mb-3">
																			<label for="nombreEditarArea" class="form-label">Nombre
																				del Área</label> <input type="text" class="form-control"
																				id="nombreEditarArea" name="nombreAreas" required>
																		</div>
																		<button type="submit" class="btn btn-primary">Guardar
																			cambios</button>
																	</form>
																</div>
															</div>
														</div>
													</div> <a href="javascript:eliminar('<%=area.getIdarea()%>')"
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
												<td></td>
											</tr>

											<%
											}
											%>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="d-flex justify-content-end mb-3">
			<p class="d-inline-flex gap-1">
				<a class="btn btn-secondary" role="button" aria-expanded="false"
					type="button" href="<%=url%>ProveedoresController?op=listar">
					Actualizar Tabla </a>
			</p>
		</div>
	</div>
</body>
</html>
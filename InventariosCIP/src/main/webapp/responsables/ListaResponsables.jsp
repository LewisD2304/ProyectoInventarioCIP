<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.unu.proyectoWeb.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>PAGINA WEB</title>

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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<div>
		<%@ include file='/cabeceramenu.jsp'%>
	</div>
	<br>


	<%
	String url = "http://localhost:8080/InventariosCIP/";
	%>
	<br>

	<div class="bg-secondary-subtle p-3 rounded shadow-sm"
		style="margin-top: -50px;">
		<div class="container">
			<H1>REGISTRO DE RESPONSABLES</H1>
		</div>
		<div class="container">
			<div class="d-flex justify-content-end mb-2">

				<a class="btn btn-primary d-flex align-items-center"
					data-bs-toggle="modal" data-bs-target="#modalAgregarArea"> <svg
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-plus-square me-1"
						viewBox="0 0 16 16">
      <path
							d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z" />
      <path
							d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4" />
   </svg> Añadir Responsables
				</a>


			</div>
		</div>

		<div class="modal fade" id="modalAgregarArea" tabindex="-1"
			aria-labelledby="modalAgregarAreaLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modalAgregarAreaLabel">Agregar
							Nueva Responsable</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- Formulario para agregar una nueva área -->
						<form action="<%=url%>ResponsablesController?op=insertar"
							method="POST">
							<div class="mb-3">
								<label for="nombreResponsable" class="form-label">Nombre</label>
								<input type="text" class="form-control" id="nombreResponsable"
									name="nombreResponsable"
									placeholder="Ingrese el nombre del responsable" required>
							</div>

							<div class="mb-3">
								<label for="cargo" class="form-label">Cargo</label> <input
									type="text" class="form-control" id="cargo" name="cargo"
									placeholder="Ingrese el cargo" required>
							</div>

							<div class="mb-3">
								<label for="telefono" class="form-label">Contacto</label> <input
									type="text" class="form-control" id="telefono" name="telefono"
									placeholder="Ingrese el teléfono" required>
							</div>
							<div class="col-md-4">
								<label for="idareas" class="form-label">Area
									Perteneciente</label> <select id="idareas" name="idareas"
									class="form-select">
									<option value="" selected>Seleccionar</option>
									<%
									List<Area> listaarea = (List<Area>) request.getAttribute("listaArea");

									if (listaarea != null && !listaarea.isEmpty()) {
										for (Area area : listaarea) {
									%>


									<option value="<%=area.getIdarea()%>">
										<%=area.getNombreAreas()%>
									</option>
									<%
									}
									} else {
									%>
									<option disabled>No hay responsable disponibles</option>
									<%
									}
									%>
								</select>
							</div>
							<button type="submit" class="btn btn-primary">Guardar
								cambios</button>
						</form>
					</div>
				</div>
			</div>
		</div>



	</div>


	<script>
		function eliminar(id) {
			if (confirm("¿Desea eliminar el registro?") == true) {
				location.href = "ResponsablesController?op=eliminar&id=" + id;
			}
		}

		function editar(idResponsable, nombreResponsable, cargo, telefono,
				idarea) {
			// Mostrar los valores que recibe la función
			console.log("Datos recibidos:");
			console.log("ID Responsable:", idResponsable);
			console.log("Nombre Responsable:", nombreResponsable);
			console.log("Cargo:", cargo);
			console.log("Teléfono:", telefono);
			console.log("ID Área:", idarea);

			// Verificar si los elementos existen en el DOM
			console.log("Elementos en el DOM:");
			console.log("idResponsable:", document
					.getElementById('idResponsablee'));
			console.log("nombreResponsable:", document
					.getElementById('nombreResponsablee'));
			console.log("cargo:", document.getElementById('cargoE'));
			console.log("telefono:", document.getElementById('telefonoE'));
			console.log("idarea:", document.getElementById('idareaE'));

			console.log(idarea);

			// Si los elementos existen, asignarles los valores
			if (document.getElementById('idResponsablee')) {
				document.getElementById('idResponsablee').value = idResponsable;
			} else {
				console
						.error("Elemento 'idResponsablee' no encontrado en el DOM.");
			}

			if (document.getElementById('nombreResponsablee')) {
				document.getElementById('nombreResponsablee').value = nombreResponsable;
			} else {
				console
						.error("Elemento 'nombreResponsablee' no encontrado en el DOM.");
			}

			if (document.getElementById('cargoE')) {
				document.getElementById('cargoE').value = cargo;
			} else {
				console.error("Elemento 'cargoE' no encontrado en el DOM.");
			}

			if (document.getElementById('telefonoE')) {
				document.getElementById('telefonoE').value = telefono;
			} else {
				console.error("Elemento 'telefonoE' no encontrado en el DOM.");
			}

			if (document.getElementById('idareaE')) {
				document.getElementById('idareaE').value = idarea;
			} else {
				console.error("Elemento 'idareaE' no encontrado en el DOM.");
			}

			// Crear la instancia del modal y mostrarlo
			var modal = new bootstrap.Modal(document
					.getElementById('modalEditarResponsable'));
			modal.show();
		}
	</script>

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
										<div>
											<p class="d-inline-flex">
												<a class="btn btn-dark p-0" role="button"
													aria-expanded="false" type="button"
													href="<%=url%>ResponsablesController?op=listar"><svg
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

										<thead class="table">
											<tr>
												<th>N°</th>
												<th>NOMBRE</th>
												<th>CARGO</th>
												<th>CONTACTO</th>
												<th>AREA PERTENCIENTE</th>
												<th>OPERACIONES</th>
											</tr>
										</thead>
										<tbody>
											<%
											List<Responsable> listaResponsable = (List<Responsable>) request.getAttribute("ListaResponsables");

											// Verificar si la lista no es nula
											if (listaResponsable != null && !listaResponsable.isEmpty()) {
												for (Responsable responsable : listaResponsable) {
											%>
											<tr>
												<td><%=responsable.getIdresponsable()%></td>
												<td><%=(responsable.getNombreResponsable() != null && !responsable.getNombreResponsable().isEmpty())
		? responsable.getNombreResponsable()
		: "N/A"%></td>
												<td><%=(responsable.getCargo() != null && !responsable.getCargo().isEmpty()) ? responsable.getCargo() : "N/A"%></td>
												<td><%=(responsable.getTelefono() != null && !responsable.getTelefono().isEmpty()) ? responsable.getTelefono()
		: "N/A"%></td>
												<td><%=(responsable.getIdarea() != null) ? responsable.getIdarea() : "N/A"%></td>
												<td><a href="javascript:void(0)"
													class="btn btn-outline-info btn-sm p-1"
													onclick="editar('<%=responsable.getIdresponsable()%>', 
                     '<%=responsable.getNombreResponsable()%>', 
                     '<%=responsable.getCargo()%>', 
                     '<%=responsable.getTelefono()%>', 
                     '<%=responsable.getIdareas()%>')">
														<svg xmlns="http://www.w3.org/2000/svg" width="16"
															height="16" fill="currentColor"
															class="bi bi-pencil-square" viewBox="0 0 16 16">
        <path
																d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
        <path fill-rule="evenodd"
																d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
    </svg>
												</a>

													<div class="modal fade" id="modalEditarResponsable"
														tabindex="-1"
														aria-labelledby="modalEditarResponsableLabel"
														aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title"
																		id="modalEditarResponsableLabel">Editar
																		Responsable</h5>
																	<button type="button" class="btn-close"
																		data-bs-dismiss="modal" aria-label="Close"></button>
																</div>
																<div class="modal-body">
																	<!-- Formulario para editar un responsable -->
																	<form
																		action="<%=url%>ResponsablesController?op=modificar"
																		method="POST">
																		<div class="mb-3">
																			<label for="idResponsablee" class="form-label">ID
																				Responsable</label> <input type="text" class="form-control"
																				id="idResponsablee" name="idResponsablee" readonly>
																		</div>
																		<div class="mb-3">
																			<label for="nombreResponsablee" class="form-label">Nombre
																				Responsable</label> <input type="text" class="form-control"
																				id="nombreResponsablee" name="nombreResponsablee"
																				required>
																		</div>
																		<div class="mb-3">
																			<label for="cargoE" class="form-label">Cargo</label>
																			<input type="text" class="form-control" id="cargoE"
																				name="cargoE" required>
																		</div>
																		<div class="mb-3">
																			<label for="telefonoE" class="form-label">Teléfono</label>
																			<input type="text" class="form-control"
																				id="telefonoE" name="telefonoE">
																		</div>
																		<div class="col-md-4">
																			<label for="idareaE" class="form-label">Área</label>
																			<select id="idareaE" name="idareaE"
																				class="form-select">
																				<option value="" selected>Seleccionar</option>
																				<%
																				List<Area> listaareae = (List<Area>) request.getAttribute("listaArea");

																				if (listaareae != null && !listaareae.isEmpty()) {
																					for (Area areae : listaareae) {
																				%>


																				<option value="<%=areae.getIdarea()%>">
																					<%=areae.getNombreAreas()%>
																				</option>
																				<%
																				}
																				} else {
																				%>
																				<option disabled>No hay responsable
																					disponibles</option>
																				<%
																				}
																				%>
																			</select>
																		</div>
																		<button type="submit" class="btn btn-primary">Guardar
																			cambios</button>
																	</form>
																</div>
															</div>
														</div>
													</div> <a
													href="javascript:eliminar('<%=responsable.getIdresponsable()%>')"
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

</body>
</html>
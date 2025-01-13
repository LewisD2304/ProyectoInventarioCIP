<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.unu.proyectoWeb.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>PAGINA WEB</title>

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
			<H1>REGISTRO DE PROVEEDORES</H1>
		</div>
		<div class="container">
			<div class="d-flex justify-content-end mb-2">

				<a class="btn btn-primary d-flex align-items-center"
					href="<%=url%>ProveedoresController?op=agregar"> <svg
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-plus-square me-1"
						viewBox="0 0 16 16">
                    <path
							d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z" />
                    <path
							d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4" />
                </svg> Añadir Proveedores
				</a>

			</div>
		</div>
	</div>
	<nav class="navbar bg-body-tertiary">
		<div class="container ">
			<form class="d-flex ms-auto w-40" role="search"
				action="<%=url%>ProveedoresController?op=buscarXnombre" method="GET">
				<input class="form-control me-2" type="search" name="buscar"
					id="buscar" placeholder="Buscar Proveedor" aria-label="buscar">
				<button class="btn btn-outline-success" type="submit" name="op"
					value="buscarXnombre">
					<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
						fill="currentColor" class="bi bi-search" viewBox="0 0 18 18">
  <path
							d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
</svg>
				</button>
			</form>
		</div>
	</nav>


	<script>
		function eliminar(id) {
			if (confirm("¿Desea eliminar el registro?") == true) {
				location.href = "ProveedoresController?op=eliminar&id=" + id;
			}
		}
	</script>

	<br>





	<div class="mask d-flex align-items-center h-100">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12">
					<div class="card shadow-2-strong"
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
													href="<%=url%>ProveedoresController?op=listar"><svg
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
												<th>CLASIFICACION</th>
												<th>RUC</th>
												<th>DIRECCION</th>
												<th>TELEFONO</th>
												<th>CORREO</th>
												<th>OPERACIONES</th>
											</tr>
										</thead>
										<tbody>
											<%
											List<Proveedores> listaProveedores = (List<Proveedores>) request.getAttribute("ListaProveedores");

											// Verificar si la lista no es nula
											if (listaProveedores != null && !listaProveedores.isEmpty()) {
												for (Proveedores proveedores : listaProveedores) {
											%>
											<tr>
												<td><%=proveedores.getIdproveedores()%></td>
												<td><%=proveedores.getNombreprov() != null && !proveedores.getNombreprov().isEmpty() ? proveedores.getNombreprov()
		: "N/A"%></td>
												<td><%=proveedores.getClasificacion() != null && !proveedores.getClasificacion().isEmpty()
		? proveedores.getClasificacion()
		: "N/A"%></td>
												<td><%=proveedores.getRuc() != null && !proveedores.getRuc().isEmpty() ? proveedores.getRuc() : "N/A"%></td>
												<td><%=proveedores.getDireccion() != null && !proveedores.getDireccion().isEmpty() ? proveedores.getDireccion()
		: "N/A"%></td>
												<td><%=proveedores.getTelefono() != null && !proveedores.getTelefono().isEmpty() ? proveedores.getTelefono() : "N/A"%></td>
												<td><%=proveedores.getCorreo() != null && !proveedores.getCorreo().isEmpty() ? proveedores.getCorreo() : "N/A"%></td>
												<td><a
													href="<%=url%>ProveedoresController?op=obtener&id=<%=proveedores.getIdproveedores()%>"
													class="btn btn-outline-info btn-sm p-1"> <svg
															xmlns="http://www.w3.org/2000/svg" width="16" height="16"
															fill="currentColor" class="bi bi-pencil-square"
															viewBox="0 0 16 16">
														<path
																d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
														<path fill-rule="evenodd"
																d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
													</svg>
												</a> <a
													href="javascript:eliminar('<%=proveedores.getIdproveedores()%>')"
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
												<td colspan="8">No hay datos</td>
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
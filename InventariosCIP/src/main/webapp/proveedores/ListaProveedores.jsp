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
	<div class="container">
		<H1>REGISTRO DE PROVEEDORES</H1>
	</div>



	<%
	String url = "http://localhost:8080/InventariosCIP/";
	%>
	<br>
	<nav class="navbar bg-body-tertiary">
		<div class="container ">
			<form class="d-flex ms-auto w-40" role="search"
				action="<%=url%>ProveedoresController?op=buscarXnombre" method="GET">
				<input class="form-control me-4" type="search" name="buscar"
					id="buscar" placeholder="Buscar nombre del Proveedor"
					aria-label="buscar">
				<button class="btn btn-outline-success" type="submit" name="op"
					value="buscarXnombre">Buscar</button>
			</form>
		</div>
	</nav>


	<div class="container">
		<p class="d-inline-flex gap-1" style="margin-top: 5px;">
			<a class="btn btn-primary" role="button" aria-expanded="false"
				type="button" href="<%=url%>ProveedoresController?op=agregar"> Añadir
				Proveedores </a>
		</p>
	</div>



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
												<td><%=proveedores.getNombreprov()%></td>
												<td><%=proveedores.getClasificacion()%></td>
												<td><%=proveedores.getRuc()%></td>
												<td><%=proveedores.getDireccion()%></td>
												<td><%=proveedores.getTelefono()%></td>
												<td><%=proveedores.getCorreo()%></td>
												<td><a
													href="<%=url%>BienesController?op=obtener&id=<%=proveedores.getIdproveedores()%>"
													class="btn btn-outline-info btn-sm p-1"> <svg
															xmlns="http://www.w3.org/2000/svg" width="16" height="16"
															fill="currentColor" class="bi bi-pencil-square"
															viewBox="0 0 16 16">
    							<path
																d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
   								<path fill-rule="evenodd"
																d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
  								</svg>
												</a> <a href="javascript:eliminar('<%=proveedores.getIdproveedores()%>')"
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
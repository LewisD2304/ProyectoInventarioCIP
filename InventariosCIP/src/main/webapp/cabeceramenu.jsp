<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INVENTARIO WEB</title>
</head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>


<body>

	<div>
		<nav class="navbar bg-danger" data-bs-theme="dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="/InventariosCIP/cabeceramenuLogo.jsp">
					SISTEMA DE INVENTARIO</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
					aria-controls="navbarNavDropdown" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="BienesController?op=listar">Registro
								de Bienes</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Registros
								Adicionales </a>
							<ul class="dropdown-menu bg-danger">
								<li><a class="dropdown-item" href="ProveedoresController?op=listar">Registro de
										Proveedores</a></li>
								<li><a class="dropdown-item" href="#">Registro de Áreas</a></li>
								<li><a class="dropdown-item" href="#">Registro de
										Responsables</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>


</body>
</html>
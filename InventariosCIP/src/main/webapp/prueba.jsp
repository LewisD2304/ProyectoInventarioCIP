<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prueba beta</title>
</head>
<body>

	<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sistema de Inventario</title>
<style>
body {
	font-family: Arial, sans-serif;
}

.menu {
	background-color: #d9534f;
	color: white;
	padding: 10px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.submenu {
	display: none;
	background-color: #f9f9f9;
	padding: 10px;
	border: 1px solid #ddd;
}

.submenu a {
	display: block;
	text-decoration: none;
	color: #007bff;
	margin: 5px 0;
}

.submenu a:hover {
	text-decoration: underline;
}

.menu-item {
	cursor: pointer;
}
</style>
</head>
<body>

	<div>
		<%@ include file='/cabeceramenu.jsp'%>
	</div>

	<link rel="icon"
		href="/InventariosCIP/resources/logocip-removebg-preview.ico"
		type="image/x-icon">

	<div class="menu">
		<span>Registro de Bienes</span> <span class="menu-item"
			onclick="toggleSubmenu()">Registros Adicionales ▾</span>
	</div>
	<div class="submenu" id="submenu">
		<a href="ProveedoresController?op=listar">Registro de Proveedores</a>
		<a href="AreaController?op=listar">Áreas</a> <a
			href="ResponsablesController?op=listar">Responsables</a>
	</div>

	<script>
		function toggleSubmenu() {
			const submenu = document.getElementById('submenu');
			submenu.style.display = submenu.style.display === 'block' ? 'none'
					: 'block';
		}
	</script>
</body>
</html>



</body>
</html>
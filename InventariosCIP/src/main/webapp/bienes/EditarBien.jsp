<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.unu.proyectoWeb.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NUEVO BIEN</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

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
	String url = "http://localhost:8080/InventariosCIP/";
	//con el ? referencia a enviar un parametro
	Bienes bienes;
	if (request.getAttribute("bienes") == null) {
		bienes = new Bienes();
	} else {
		bienes = (Bienes) request.getAttribute("bienes");
	}
	%>
	<div class="mb-3">
		<div class="container">
			<h3>MODIFICAR BIEN DEL CIP</h3>
			<form class="row g-3" action="<%=url%>BienesController" method="POST">

				<input type="hidden" class="form-control" name="op" value="modificar"> <input type="hidden" name="id"
					value="<%=bienes.getIdbienes()%>" />
				<div class="col-md-3">
					<label class="form-label">Codigo Unico del Bien</label> <input
						type="text" class="form-control" name="codigoBien" id="codigoBien"
						value="<%=bienes.getCodigoBien()%>" placeholder="Codigo Unico">
				</div>
				<div class="col-md-4">
					<label class="form-label">Nombre del Bien</label> <input
						type="text" class="form-control" name="nombrebien" id="nombrebien"
						value="<%=bienes.getNombrebien()%>" placeholder="Nombre del Bien">
				</div>
				<div class="col-md-4">
					<label class="form-label">Marca</label> <input type="text"
						class="form-control" name="marca" id="marca" placeholder="Marca"
						value="<%=bienes.getMarca()%>">
				</div>
				<div class="col-md-4">
					<label class="form-label">Modelo</label> <input type="text"
						class="form-control" name="modelo" id="modelo"
						value="<%=bienes.getModelo()%>" placeholder="Modelo">
				</div>
				<div class="col-md-4">
					<label class="form-label">N° de Serie</label> <input type="text"
						class="form-control" name="nroSerie" id="nroSerie"
						value="<%=bienes.getNroSerie()%>" placeholder="N° de Serie">
				</div>
				<div class="col-md-4">
					<label class="form-label">Fecha de Adquisicion</label> <input
						type="date" class="form-control" name="fechaAdquisicion"
						value="<%=bienes.getFechaAdquisicion()%>" id="fechaAdquisicion"
						placeholder="Fecha de Adquisicion">
				</div>
				<div class="col-md-4">
					<label class="form-label">Valor de compra</label> <input
						type="text" class="form-control" name="valorCompra"
						id="valorCompra" placeholder="Valor de compra"
						value="<%=bienes.getValorCompra()%>">
				</div>
				<div class="col-md-2">
					<label class="form-label">Estado</label> <select id="estado"
						name="estado" class="form-select" required>
						<option value="" disabled selected>Seleccionar Estado</option>
						<option value="1" <%=(bienes.getEstado() == 1) ? "selected" : ""%>>ACTIVO</option>
						<option value="0" <%=(bienes.getEstado() == 0) ? "selected" : ""%>>INACTIVO</option>
					</select>
				</div>
				<div class="col-md-6">
					<label class="form-label">Descripcion</label> <input type="text"
						class="form-control" name="descripcion" id="descripcion"
						value="<%=bienes.getDescripcion()%>" placeholder="Descripcion">
				</div>
								<div class="col-md-4">
					<label for="idcategoriass" class="form-label">Categoría</label>
<select id="idcategoriass" name="idcategoriass" class="form-select">
    <option value="" selected disabled>Seleccionar Categoría</option>
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
                <%= isSelected ? "selected" : "" %>>
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
</select>

				</div>
				<div class="col-md-4">
					<label for="idproveedores" class="form-label">Proveedores</label> <select
						id="idproveedores" name="idproveedores" class="form-select">
						<option value="" selected>Seleccionar</option>
						<%
						List<Proveedores> listaproveedor = (List<Proveedores>) request.getAttribute("listaproveedores");
						%>
						<%
						if (listaproveedor != null && !listaproveedor.isEmpty()) {
						%>
						<%
						for (Proveedores proveedor : listaproveedor) {
				            boolean isSelected = proveedor.getIdproveedores() == bienes.getIdproveedoress();

						%>
						<script>
                console.log("Comparación: proveedor.getIdproveedores() = <%= proveedor.getIdproveedores() %>, " +
                            "bienes.getIdproveedoress() = <%= bienes.getIdproveedoress() %>, " +
                            "Resultado: <%= isSelected %>");
            </script>
						<option value="<%=proveedor.getIdproveedores()%>"
							<%=(proveedor.getIdproveedores() == bienes.getIdproveedoress()) ? "selected" : ""%>>
							<%=proveedor.getNombreprov()%>
						</option>
						<%
						}
						%>
						<%
						} else {
						%>
						<option disabled>No hay proveedores disponibles</option>
						<%
						}
						%>
					</select>
				</div>
				<div class="col-md-4">
					<label for="idresponsables" class="form-label">Responsable</label>
					<select id="idresponsables" name="idresponsables"
						class="form-select">
						<option value="" selected>Seleccionar</option>
						<%
						List<Responsable> listaresponsable = (List<Responsable>) request.getAttribute("listaresponsable");
						%>
						<%
						if (listaresponsable != null && !listaresponsable.isEmpty()) {
						%>
						<%
						for (Responsable responsable : listaresponsable) {
						%>
						<option value="<%=responsable.getIdresponsable()%>"
							<%=(responsable.getIdresponsable() == bienes.getIdresponsables()) ? "selected" : ""%>>
							<%=responsable.getNombreResponsable()%>
						</option>
						<%
						}
						%>
						<%
						} else {
						%>
						<option disabled>No hay responsable disponibles</option>
						<%
						}
						%>
					</select>
				</div>
				<div class="col-12">
					<input type="submit" class="btn btn-primary" value="Guardar"
						name="Guardar"> <a class="btn btn-danger"
						href="<%=url%>BienesController?op=listar">Cancelar</a>
				</div>

			</form>







		</div>

	</div>


</body>
</html>
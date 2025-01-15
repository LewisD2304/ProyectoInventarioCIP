<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>INVENTARIO WEB</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<style>
/* Contenedor principal */
.container-main {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	flex-direction: column;
	position: relative;
	text-align: center;
	padding: 0 10px; /* Asegura espacios laterales */
}

/* Logo pequeño */
.logo-container {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column; /* Columna: Logo y texto en el mismo eje */
	margin-bottom: 20px;
}

.small-logo {
	width: 20vw; /* Ancho relativo al tamaño de la pantalla */
	max-width: 150px; /* Máximo tamaño para pantallas grandes */
	height: auto;
}

/* Barra de carga */
.loader-container {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	/* Asegura que barra y texto estén en columna */
	width: 30%;
	margin-top: 20px;
	position: relative;
}

.loader-bar {
	width: 0;
	height: 5px;
	background-color: #ff0000;
	transition: width 2s ease-in-out;
}

/* Texto "Inventario Web" */
.loader-text {
	font-weight: bold;
	font-size: 4vw; /* Fuente relativa al ancho de la pantalla */
	max-font-size: 24px; /* Tamaño máximo */
	margin-top: 10px;
	text-align: center;
}

/* Ajuste general para dispositivos móviles */
@media ( max-width : 768px) {
	.small-logo {
		width: 40vw; /* Más grande en pantallas pequeñas */
	}
	.loader-text {
		font-size: 5vw; /* Fuente ligeramente más grande en móviles */
	}
	.loader-bar {
		height: 4px; /* Ajusta el grosor de la barra */
	}
}
</style>
</head>

<link rel="icon"
	href="/InventariosCIP/resources/logocip-removebg-preview.ico"
	type="image/x-icon">

<body>

	<!-- Contenedor principal -->
	<div class="container-main">
		<!-- Contenedor del logo pequeño -->
		<div class="logo-container" id="smallLogoContainer">
			<img src="https://www.cip.org.pe/images/logocip.jpg" alt="Logo CIP"
				class="small-logo" id="smallLogo">
		</div>

		<!-- Contenedor de la barra de carga -->
		<div class="loader-container" id="loaderContainer">
			<div class="loader-bar" id="loaderBar"></div>
		</div>

		<!-- Texto "Inventario Web" debajo de la barra de carga -->
		<p class="loader-text" id="loaderText">Inventario CIP</p>

		<!-- Contenedor del logo grande (ya no se usará) -->
		<div class="logo-container-large" id="largeLogoContainer">
			<img src="https://www.cip.org.pe/images/logocip.jpg" alt="Logo CIP"
				class="large-logo" id="largeLogo">
		</div>
	</div>

	<script>
    const loaderContainer = document.getElementById("loaderContainer");
    const loaderBar = document.getElementById("loaderBar");
    const smallLogoContainer = document.getElementById("smallLogoContainer");
    const largeLogoContainer = document.getElementById("largeLogoContainer");
    const loaderText = document.getElementById("loaderText");

    // Función para iniciar la animación de carga
    function iniciarCarga() {
        // Mostrar el logo pequeño, la barra de carga y el texto
        smallLogoContainer.style.display = "block";
        loaderContainer.style.display = "flex";
        loaderText.style.display = "block"; // Mostrar el texto "Inventario Web"
        largeLogoContainer.style.display = "none";

        // Iniciar la animación de la barra de carga
        setTimeout(() => {
            loaderBar.style.width = "100%";
        }, 100);

        // Al terminar la carga, ocultar la barra de carga, el texto y el logo pequeño
        setTimeout(() => {
            loaderContainer.style.display = "none";
            smallLogoContainer.style.display = "none";
            loaderText.style.display = "none"; // Ocultar el texto

            // Verificar si ya hemos pasado el parámetro en la URL
            const urlParams = new URLSearchParams(window.location.search);
            if (!urlParams.has('redirected')) {
                // Redirigir agregando el parámetro 'redirected'
                window.location.href = 'cabeceramenuLogo.jsp?redirected=true'; 
            }
        }, 2500); // Duración de la barra de carga
    }

    // Aseguramos que la animación de carga se ejecute siempre que se recargue la página
    window.addEventListener("load", () => {
        iniciarCarga(); // Ejecutar animación de carga al cargar o recargar la página
    });
</script>

</body>
</html>

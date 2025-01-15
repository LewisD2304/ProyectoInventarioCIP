<!--Para centrar el texto de pie de pagina  -->
<style>
/* Aplica Flexbox al body para que el contenido ocupe todo el alto disponible */
html, body {
	height: 100%;
	margin: 0;
	display: flex;
	flex-direction: column;
}

/* El contenedor principal puede crecer */
.content {
	flex-grow: 1;
}

/* El pie de página siempre se ubica en la parte inferior */
footer {
	background-color: #dc3545;
	color: white;
	text-align: center;
	padding: 15px;
}
</style>

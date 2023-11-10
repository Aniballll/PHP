<?php
	session_start(); //abrimos sesion
	//valido que el formulario en el front este completamente rellenado con los datos
	if(!empty($_POST["nombre"]) && !empty($_POST["apellido"]) && !empty($_POST["apellido2"]) && !empty
        ($_POST["edad"]) ){
        $_SESSION["nombre"]=$_POST["nombre"];
       	$_SESSION["apellido"]=$_POST["apellido"];
		$_SESSION["apellido2"]=$_POST["apellido2"];
		$_SESSION["edad"]=$_POST["edad"];
    }
		include "header.php";
?>
<script src="vista/js/script.js"></script>
<body>
<div class="caja-negra">
	<div class="numeros">
		<span class="numero-inactivo">1</span>
		<span class="material-symbols-outlined">arrow_forward</span>
		<span class="numero-inactivo">2</span>
		<span class="material-symbols-outlined">arrow_forward</span>
		<span class="numero-activo">3</span>
	</div>
</div>

<div class="caja-blanca">
	<h3>¡TERMINAMOS!</h3>
	<div>
		<p>
			El alta en <span style='color: #ffb500'>BANCA ONLINE</span> se ha realizado exitosamente.
			Recibira en breve un Email, para realizar una Videollamada para confirmar los datos.

		</p>
		<h3>¡Gracias por dejarnos ser tu banco!</h3>
	</div>
	<hr>
	<a href="modelo/Cliente.php" class="boton">Finalizar</a>
</div>

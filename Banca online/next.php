<?php
    session_start(); //abrimos sesion
    //valido que el formulario en el front este completamente rellenado con los datos
    if(!empty($_POST["dni"]) && !empty($_POST["movil"]) && !empty($_POST["email"]) && !empty($_POST["email2"])) {
	    //validamos que los email son iguales
	    if ($_POST["email"] == $_POST["email2"]) {
		    //leer en variables de sesion los datos insertados
		    $_SESSION["dni"] = $_POST["dni"];
            echo $_SESSION["dni"];
		    $_SESSION["movil"] = $_POST["movil"];
		    $_SESSION["email"] = $_POST["email"];

	    } else {
		    header("Location:http://localhost:63342/SeptimoPHP/index.php?mensaje=Los email deben ser iguales");
	    }
    }
        else{
	        header("Location:http://localhost:63342/SeptimoPHP/index.php?mensaje=Alguno de los campos estan sin completar");
        }

	include "header.php";
	?>
		<script src="vista/js/script.js"></script>
	<body>
	    <div class="caja-negra">
	        <div class="numeros">
	            <span class="numero-inactivo">1</span>
	            <span class="material-symbols-outlined">
	arrow_forward
	            </span>
	            <span class="numero-activo">
	2
	            </span>
	            <span class="material-symbols-outlined">
	arrow_forward
	            </span>
	            <span class="numero-inactivo">
	3
	            </span>
	        </div>
	    </div>

	    <div class="caja-blanca">
		    <h3>¡Continuamos!</h3>
		    <p>Por favor necesitamos más datos para continuar con el proceso de alta:</p>
		    <form id="formulario2" method="post" class="formulario" action="end.php" novalidate>
			    <div class="input-izquierda">
				    <input type="text" name="nombre" required placeholder="NOMBRE">
				    <p>Ej: María</p>
				    <input type="number" required min="18" max="85" placeholder="EDAD" name="edad">
				    <p>Indica tu edad. Mínimo 18 años</p>
			    </div>
			    <div class="input-derecha">
				    <input type="text" required placeholder="PRIMER APELLIDO" name="apellido">
				    <p>Ej: López</p>
				    <input type="text" placeholder="SEGUNDO APELLIDO" name="apellido2">
					<p>Ej: Martinez</p>
			    </div>
			    <p class="centrado">
				    <input type="submit"  class="boton" name="enviar" value="Siguiente" id="enviar2">
				    <input type="reset" class="boton" value="Limpiar">
			    </p>

		    </form>
	    </div>
	</body>
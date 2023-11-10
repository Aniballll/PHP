<?php
	include "header.php"
	?>
	<div class="caja-negra">
		<div class="numeros">
			<span class="numero-activo">Registro de Usuario</span>
	    </div>
	</div>
<div class="caja-blanca">
	<form id="login" method="post" class="login" action="alta.php" novalidate>
        <input type="text" name="nombre" placeholder="Nombre y Apellido" required>
		<input type="email" name="usuario" placeholder="Email"  required>
        <input type="password" name="pass" placeholder="Contraseña" required>

        <input type="submit" value="Entrar" class="boton entrada">
	</form>
    <h4>La contraseñas deben cumplir los sigueintes criterios</h4>
    <ul class="lista">
        <li>Longitude 8 caracteres</li>
        <li>Al menus una mayuscula</li>
        <li>Al menus una minuscula</li>
        <li>Al menus un numero</li>
    </ul>
</div>
</div>
</body>
</html>

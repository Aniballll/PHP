<?php
	include "header.php"
?>
<div class="caja-negra">
	<div class="numeros">
		<span class="numero-activo">Iniciar Sesión</span>
	</div>
</div>
<div class="caja-blanca">
	<form id="login" method="post" class="login" action="validarLogin.php" novalidate>
		<input type="email" name="email" placeholder="Email"  required>
		<input type="password" name="pass" placeholder="Contraseña" required>
		<input type="submit" value="Entrar" class="boton entrada">
	</form>
    <p>Si no tiene usuario puede registrarse,
    <a href="registro.php" title="Registro de Usuario">Aqui</a> </p>
    <?php
        if (isset($_GET["mensaje"])){
            echo "<p class='error'>".$_GET['mensaje']."</p>";
        }
    ?>
</div>
</body>
</html>


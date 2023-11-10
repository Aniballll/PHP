<?php
session_start();
include "header.php";
//validamos q solo entren en esta pagina los ususarios autorizadosecho
if (!isset($_SESSION["usuario"])){
	header("Location:http://localhost:63342/mysql/Banca%20online/login.php?mensaje=Usuario no autprizado");
}
?>
<!doctype html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
	      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>DashBoard</title>
</head>
<body>
<div class="caja-negra">
	<div class="numeros">
		<span class="numero-activo">Sistema de Alta Clientes</span>
	</div>
    <div class="opciones">
    <span class="material-symbols-outlined">
    contacts_product
    </span>
        <p><?=$_SESSION["usuario"]?></p>

    </div>
    <div class="opciones">
        <a href="javascript:window.print()" title="Imprimir">
            <span class="material-symbols-outlined">print<a href=""></a></span>
        </a>
        <a href="" title="Descargar">
        <span class="material-symbols-outlined">download<a href=""></a></span>
        </a>
        <a href="password.php" title="Cambiar Password">
            <span class="material-symbols-outlined">change_circle</span>
        </a>
        <a href="borrarcockies.php" title="Salir">
            <span class="material-symbols-outlined">logout</span>
        </a>
    </div>
</div>
</body>
</html>

<?php
	session_start();
if (!empty($_POST['email'])&& !empty($_POST["pass"])){
	$email=$_POST["email"];
	$passFormulario=$_POST["pass"];
	//debo hacer una consulta a la base de datos verificando q ese email existe y recuperar la contraseña de la base
	// de datos para compararla con la contraseña insertada en formulario
	//Tambien me traigo el nombre para mostrarlo en caso positivo en dashboard
	include "modelo/conexion.php";
	$link=conectar();
	//se consulta en la base de datos el email siministrado en el formulario
	$consulta="select * from usuarios where email='".$email."';";
	//echo "<br>$consulta";
	$resultado=mysqli_query($link,$consulta);
	$row=mysqli_num_rows($resultado);
	//se valida si existe algun registro
	if ($row!=0){
		$registro=mysqli_fetch_assoc($resultado);
		$emailBBDD=$registro["email"];
		//echo "<br>El usuario ".$emailBBDD." existe";
		//llamamos a la funcon de validar password y verificamos que coincidan
		$passBBDD=$registro["pass"]; //guarda en esta variable el hash de la BBDD
		if (validarPass($passFormulario,$passBBDD)){
			//echo "<br>La contraseña es correcta";
			$_SESSION["usuario"]=$registro["nombre"];
			header("Location:http://localhost:63342/mysql/Banca%20online/dashboard.php");
		}else{
			$mensaje="Error, Clave incorrecta";
			header("Location:http://localhost:63342/mysql/Banca%20online/login.php?mensaje=$mensaje");
			//echo "<br>Error, contraseña invalida";
		}

	}else{
		$mensaje="No existe el usuario";
		header("Location:http://localhost:63342/mysql/Banca%20online/login.php?mensaje=$mensaje");
		//echo "No existe este usuario";
	}
}
//funcion quer valida el password ingrtesado con el password guardado en la BBDD
function validarPass($passFormulario,$passBBDD){
	//el metodo password_verify ($passwordFormulario,$passwordBBDD) y los va a comparar
	//resultado true si son iguales, false caso contrario
	$verificacion=password_verify($passFormulario,$passBBDD); //True o false (0-1)
	if ($verificacion){ //si la verificacion es true
		return true;    //devuelve a la llamada de la funcion true
	}else{
		return false; //devuelve a la llamada de la funcion false
	}
}


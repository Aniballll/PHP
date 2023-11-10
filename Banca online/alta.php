<?php
	include "modelo/conexion.php";
	global $link;
	$link=conectar();
	//insertar la tabla de usuario en php, para vlidar el alta
	if (!empty($_POST["usuario"]) && !empty($_POST["pass"] && !empty($_POST["nombre"]))) {
		$nombre=$_POST["nombre"];
		$usuario = $_POST["usuario"];
		$pass = $_POST["pass"];
		$paso=true;
		if (validarEmail($usuario)) {
			echo "Email validado correctamente";
		} else {
			echo "Email en formato incorrecto";
			$paso=false;
		}
		if (validarPass($pass)) {
			echo "El password cumple los requisitos de complejidad";
		} else {
			echo "El password NOO cumple los requisitos de complejidad";
			$paso=false;
		}

		//funcion que se llama para buscar si existe el email en la bbdd
		if (!validarEmailBBDD($usuario)){
			echo "El email existe";
			$paso=true;
		}else{
			$paso=true;
		}
		//funcion que guarda el registro rodo es correcto en la bbdd

		if ($paso){
			$passSeguro=password_hash($pass,PASSWORD_BCRYPT); //para encriptar la conrtrseña en el php o cualquier
			// plataforma java
			echo "<br>.$passSeguro";
			$insertarUser="insert into usuarios (email,pass,nombre) values 
            ('".$usuario."','".$passSeguro."','".$nombre."');";
			echo "<br>$insertarUser";
			$result=mysqli_query($link,$insertarUser);
			if ($result) {
				echo "Alta realizada correctamente";
			} else {
					echo "Existe un error al relizar el alta";
				}
			mysqli_close($link); //cerrar la bbdd
		}
	}
	function validarEmail($email)
	{
		// las expresiones regulares que debe cumplir el email para ser valido
		$regex = "/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,6})$/";
		if (preg_match($regex,$email)){//compara que la expresion regular se cumple en variable $email
			return true;
		}else{
			return false;
		}

	}
	//Lo de abajo es para las contraseñas y q salgan con unas expecificaciones
	function validarPass($pass){
		$regex ="/(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/";
		if (preg_match($regex,$pass)){
			return true;
		}else{
			return false;
		}
	}

	//funcion para validar q el email no exista en la base de datos
	function validarEmailBBDD($email){
		global $link;
		$consulta="select email from usuarios where email='".$email."';";
		$resultado=mysqli_query($link,$consulta); //Ejecutar la consulta
		//verificación que existe y devuelve el numero de al menos un registro....

		$numeroRegistros=mysqli_num_rows($resultado);

		if ($numeroRegistros!=0){ //ya existe ese email
			return false;
		}else{
			return true;
		}
	}

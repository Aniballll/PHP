<?php
	$servidor="localhost:3306";
	$user="root";
	$pass="";
	$bbdd="banca";

	function conectar(){
		global $servidor,$user,$pass,$bbdd;
		$link=mysqli_connect($servidor,$user,$pass,$bbdd);
		if (mysqli_error($link)){
			echo "Existe un error al conectar con el servidor o BBDD";
		}else{
			echo "Conexión establecida correctamente";
		}
		return $link;
	}


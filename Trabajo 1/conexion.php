<?php
//1. Lo primero q debemos hacer es definir los parametros de la conexión.
$servidor="localhost"; //nombre del servidor
$usuario="root";    //usuario cn permiso en esa base de datos
$clave="";          //Contraseña del usuario
$bbdd="phpmysql";  //nombre de la base de datos
$puerto="3306";     //puerto de conexión

//nombre de la tabla que trabajaremos- no obligatorio.
$tabla="personas";

//creamos la conexión
 function conectarse(){
	global $servidor,$usuario,$clave,$bbdd,$tabla,$puerto;
	$link=mysqli_connect($servidor.":".$puerto,$usuario,$clave);
	if (mysqli_error($link)){
		echo "Existe un error en la conexión con el Servidor";
	}else{
		echo "Conexión establecida correctamente con el Servidor <br>";
	}
	if (!mysqli_select_db($link,$bbdd)){
		echo "Existe un error con la Base de Datos";
		exit(); //se termina la ejecución
	}else{
		echo "Conexión con la base de Datos correcta";
	}
	//retornamos link cuando esta función sea llamada
	 return $link;
 }

 //$link=conectarse();

// alter table  phpmysql.personas auto_increment=6;
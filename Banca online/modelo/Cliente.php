<?php
session_start();
	class Cliente
	{
		public $dni;
		public $movil;
		public $email;
		public $nombre;
		public $apellido;
		public $apellido2;
		public $edad;

		//creamos el contructor



		//creamos los metodos getter y setter
		/**
		 * @param $dni
		 * @param $movil
		 * @param $email
		 * @param $nombre
		 * @param $apellido
		 * @param $apellido2
		 * @param $edad
		 */
		public function __construct ($dni , $movil , $email , $nombre , $apellido , $apellido2 , $edad)
		{
			$this->dni = $dni;
			$this->movil = $movil;
			$this->email = $email;
			$this->nombre = $nombre;
			$this->apellido = $apellido;
			$this->apellido2 = $apellido2;
			$this->edad = $edad;
		}

		/**
		 * @return mixed
		 */
		public function getDni ()
		{
			return $this->dni;
		}

		/**
		 * @param mixed $dni
		 */
		public function setDni ($dni)
		{
			$this->dni = $dni;
		}

		/**
		 * @return mixed
		 */
		public function getMovil ()
		{
			return $this->movil;
		}

		/**
		 * @param mixed $movil
		 */
		public function setMovil ($movil)
		{
			$this->movil = $movil;
		}

		/**
		 * @return mixed
		 */
		public function getEmail ()
		{
			return $this->email;
		}

		/**
		 * @param mixed $email
		 */
		public function setEmail ($email)
		{
			$this->email = $email;
		}

		/**
		 * @return mixed
		 */
		public function getNombre ()
		{
			return $this->nombre;
		}

		/**
		 * @param mixed $nombre
		 */
		public function setNombre ($nombre)
		{
			$this->nombre = $nombre;
		}

		/**
		 * @return mixed
		 */
		public function getApellido ()
		{
			return $this->apellido;
		}

		/**
		 * @param mixed $apellido
		 */
		public function setApellido ($apellido)
		{
			$this->apellido = $apellido;
		}

		/**
		 * @return mixed
		 */
		public function getApellido2 ()
		{
			return $this->apellido2;
		}

		/**
		 * @param mixed $apellido2
		 */
		public function setApellido2 ($apellido2)
		{
			$this->apellido2 = $apellido2;
		}

		/**
		 * @return mixed
		 */
		public function getEdad ()
		{
			return $this->edad;
		}

		/**
		 * @param mixed $edad
		 */
		public function setEdad ($edad)
		{
			$this->edad = $edad;
		}

	}
	if (!empty($_SESSION["dni"]) && !empty($_SESSION["movil"]) && !empty($_SESSION["email"]) && !empty
			($_SESSION["nombre"]) && !empty($_SESSION["apellido"])  && !empty($_SESSION["apellido2"]) && !empty
		($_SESSION["edad"])){
		$unCliente=new Cliente($_SESSION["dni"],$_SESSION["movil"],$_SESSION["email"],$_SESSION["nombre"],$_SESSION["apellido"],$_SESSION["apellido2"],$_SESSION["edad"]);

		include "conexion.php";
		$link=conectar();
		$consultaInsert="insert into cliente (nombre,apellido1,apellido2,email,edad,dni,telefono) values ('"
			.$unCliente->nombre."','".$unCliente->apellido."','".$unCliente->apellido2."','".$unCliente->email."',"
			.$unCliente->edad.",'".$unCliente->dni."',".$unCliente->movil.");";
		//echo $consultaInsert; comprobar la consulta
		$resultado=mysqli_query($link,$consultaInsert);
		if ($resultado){
			echo "<br>Registro insertado correctamente.";
		}else{
			echo "<br>Existe un error al insertar el Registro.";
		}



	}




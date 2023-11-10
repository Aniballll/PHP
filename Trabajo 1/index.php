<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
	      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>
</head>
<body>
    <H1>LISTADO DE PERSONAS DE LA BASE DE DATOS</H1>
    <?php
        include "conexion.php"; //incluimos el archivo para usar cualquier metodo
        $link=conectarse();
        $consulta="select * from personas";
        //para que se ejecute esta consulta utilizamos mysqli_query
        $resultado=mysqli_query($link,$consulta); //$resultado es un array con satos extraidos
        while ($row=mysqli_fetch_array($resultado))
        {
            echo "<li>".$row["Nombre"]."-".$row["Apellidos"]."</li>";
        }
        //liberar la memoria usada en la consulta
        mysqli_free_result($resultado);
    ?>
    <hr>
    <h2>Nuevo registro de Personas</h2>
    <form action="" method="post">
        <p>
            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre" id="nombre">
        </p>
        <p>
            <label for="apellido">Apellidos:</label>
            <input type="text" name="apellido" id="apellido">
        </p>
        <input type="submit" value="Registrar">
    </form>

    <?php
        if ($_POST){
            $nombre=$_POST["nombre"];
            $apellido=$_POST["apellido"];

            $insertar="insert into personas (Nombre,Apellidos) values ('".$nombre."','".$apellido."')";
            $resultado=mysqli_query($link,$insertar);   //ademas de ejecutarse nos envia un true o false
            if ($resultado){
                echo "Registro ingresado correctamente";
            }else{
                echo "Error en el alta de la Persona";
            }
        }
        //liberar memoria usada en la consulta
        mysqli_free_result($resultado);
	    //por utimo cerramos la conexión de la Base de Datos
        mysqli_close($link);
    ?>
    //Actualizar
    

    //Borrar

</body>
</html><?php

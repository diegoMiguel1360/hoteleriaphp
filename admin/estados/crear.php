<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/style.css">
    <title>Crear Estado Habitacion</title>
</head>

<?php

    require '../../database.php';
    $bd = conectar_bd();
    $errores =  [];
    if($_SERVER['REQUEST_METHOD'] == 'POST'){
        $est_id = $_POST['est_id'];
        $est_nombre = $_POST['est_nombre'];    
        if(!$est_id){
            $errores[] = 'El codigo estado de habitacion es obligatorio';
        }
        if(!$est_nombre){
            $errores[] = 'El estado de habitacion es obligatorio';
        }
        if(empty($errores)){
            $sql = "INSERT INTO estados (est_id, est_nombre) 
            VALUES ($est_id, '$est_nombre')";
            echo $sql;
            $resultado = mysqli_query($bd, $sql);
            header('location: consultar.php');
            if($resultado){
                
            }
        }
        else{
            foreach($errores as $error){
                echo '<br>' . $error;
            }
        }
    }
?>

<body>
<center><div class="conten1">
    <h3>Kratos Hotelería</h3><br>
    <h3>Administración de Habitaciones</h3>
    </div></center>
    <nav>
    <a href="../habitacion/consultar.php">Habitaciones</a>
    <a href="../tipo_hab/consultar.php">Tipo Habitación</a>
    <a href="consultar.php">Regresar</a>
    </nav>

<center><div class="conten1">
    <p>Nuevo Estado de Habitacion</p>
</div>
<form class="formulario" method="POST">

        <label class="eltext" for="est_id">Codigo Estado de habitación</label><br>
        <input class='bloqu' type="text" id="est_id" name="est_id"><br>

        <label class="eltext" for="tipo_hab">Estado de habitación</label><br>
        <input class='bloqu' type="text" id="est_nombre" name="est_nombre" ><br>

        <input class="boton" type="submit" id="enviar" name="enviar" value="Enviar datos">
</form></center>

</body>
</html>
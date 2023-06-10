<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/style.css">
    <title>Crear tipo Habitacion</title>
</head>

<?php

    require '../../database.php';
    $bd = conectar_bd();
    $errores =  [];
    if($_SERVER['REQUEST_METHOD'] == 'POST'){
        $tipo_hab_id = $_POST['tipo_hab_id'];
        $tipo_hab = $_POST['tipo_hab'];    
        if(!$tipo_hab_id){
            $errores[] = 'El codigo tipo de habitacion es obligatorio';
        }
        if(!$tipo_hab){
            $errores[] = 'El tipo de habitacion es obligatorio';
        }
        if(empty($errores)){
            $sql = "INSERT INTO tipo_hab (tipo_hab_id, tipo_hab) 
            VALUES ('$tipo_hab_id', '$tipo_hab')" ;
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
    <a href="../../index.php">Regresar</a>
    </nav>

<center><div class="conten1">
    <p>Nuevo Tipo de Habitacion</p>
</div>
<form class="formulario" method="POST" action="crear.php">

        <label class="eltext" for="tipo_hab_id">Codigo tipo de habitación</label><br>
        <input class='bloqu' type="text" id="tipo_hab_id" name="tipo_hab_id"><br>

        <label class="eltext" for="tipo_hab">Tipo de habitación</label><br>
        <input class='bloqu' type="text" id="tipo_hab" name="tipo_hab" ><br>

        <input class="boton" type="submit" id="enviar" name="enviar" value="Enviar datos">
</form></center>

</body>
</html>
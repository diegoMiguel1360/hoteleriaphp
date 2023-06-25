<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/style.css">
    <title>Editar Tipo Habitacion</title>
</head>

<?php
    require "../../funciones.php";
    $codigo_tipo = $_GET["codigo"];
    $codigo_tipo = filter_var($codigo_tipo, FILTER_VALIDATE_INT);
    if(!$codigo_tipo){
        header("consultar.php");
    }

    $bd = conectar_bd();
    $consulta_tipo = "SELECT * FROM tipo_habitacion
                    WHERE tipo_hab_id=$codigo_tipo";
    $resultadox = mysqli_query($bd, $consulta_tipo);
    $habi = mysqli_fetch_assoc($resultadox);
    
    $num = $habi['tipo_hab_id'];
    $tipo = $habi['tipo_hab'];

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
            $sql = "UPDATE tipo_habitacion SET tipo_hab = '$tipo_hab' WHERE tipo_hab_id = $codigo_tipo";
            echo $sql;
            $resultado = mysqli_query($bd, $sql);
            header('location: consultar.php');
            if($resultado){
                header('location: consultar.php');
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
    <a href="../estados/consultar.php">Estado Habitación</a>
    <a href="consultar.php">Regresar</a>
    </nav>

<center><div class="conten1">
    <p>Editar Tipo de Habitacion</p>
</div>
<form class="formulario" method="POST">

        <label class="eltext" for="tipo_hab_id">Codigo tipo de habitación</label><br>
        <input class='bloqu' type="text" id="tipo_hab_id" name="tipo_hab_id" readonly=true value="<?php echo $num ?>"><br>

        <label class="eltext" for="tipo_hab">Tipo de habitación</label><br>
        <input class='bloqu' type="text" id="tipo_hab" name="tipo_hab" value="<?php echo $tipo ?>"><br>

        <input class="boton" type="submit" id="enviar" name="enviar" value="Enviar datos">
</form></center>

</body>
</html>
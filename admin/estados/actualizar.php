<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/style.css">
    <title>Editar Estado Habitacion</title>
</head>

<?php
    require "../../funciones.php";
    $codigo_estado = $_GET["codigo"];
    $codigo_estado = filter_var($codigo_estado, FILTER_VALIDATE_INT);
    if(!$codigo_estado){
        header("consultar.php");
    }

    $bd = conectar_bd();
    $consulta_estado = "SELECT * FROM estados
                    WHERE est_id=$codigo_estado";
    $resultadox = mysqli_query($bd, $consulta_estado);
    $habi = mysqli_fetch_assoc($resultadox);
    
    $num = $habi['est_id'];
    $estado = $habi['est_nombre'];

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
            $sql = "UPDATE estados SET est_nombre = '$est_nombre' WHERE est_id = $codigo_estado";
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
    <a href="../tipo_hab/consultar.php">Tipo Habitación</a>
    <a href="consultar.php">Regresar</a>
    </nav>

<center><div class="conten1">
    <p>Editar estado de Habitacion</p>
</div>
<form class="formulario" method="POST">

        <label class="eltext" for="estado_hab_id">Codigo estado de habitación</label><br>
        <input class='bloqu' type="text" id="est_id" name="est_id" readonly=true value="<?php echo $num ?>"><br>

        <label class="eltext" for="estado_hab">estado de habitación</label><br>
        <input class='bloqu' type="text" id="est_nombre" name="est_nombre" value="<?php echo $estado ?>"><br>

        <input class="boton" type="submit" id="enviar" name="enviar" value="Enviar datos">
</form></center>

</body>
</html>
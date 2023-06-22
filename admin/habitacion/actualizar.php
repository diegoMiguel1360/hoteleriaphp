<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/style.css">
    <title>Editar Habitacion</title>
</head>

<?php
    require "../../funciones.php";
    $actualiza_hab = $_GET["codigo"];
    $actualiza_hab = filter_var($actualiza_hab, FILTER_VALIDATE_INT);
    if(!$actualiza_hab){
        header("consultar.php");
    }

    $tipo= consultar_tipo(); 
    $bd = conectar_bd();
    $consulta_habitacion = "SELECT * FROM habitacion WHERE hab_numero=$actualiza_hab";
    $resultadox = mysqli_query($bd, $consulta_habitacion);
    $habi = mysqli_fetch_assoc($resultadox);
    
    $num = $habi['hab_numero'];
    $est = $habi['estado'];
    $tipox = $habi['tipo_hab_id'];
    $tarifa = $habi['hab_tarifa'];
    $capacidad = $habi['hab_capacidad'];
    $img = $habi['imagen'];

    $errores =  [];
    if($_SERVER['REQUEST_METHOD'] == 'POST'){
        $hab_numero = $_POST['hab_numero'];
        $tipo_hab_id = $_POST['tipo_hab_id'];
        $hab_tarifa = $_POST['hab_tarifa'];
        $hab_capacidad = $_POST['hab_capacidad'];
        $imagen = $_POST['imagen'];
            if(!$hab_numero){
                $errores[] = 'El número de habitacion es obligatorio';
            }
            if(!$tipo_hab_id){
                $errores[] = 'El tipo de habitacion es obligatorio';
            }
            if(!$hab_tarifa){
                $errores[] = 'La tarifa es obligatoria';
            }
            if(!$hab_capacidad){
                $errores[] = 'La capacidad es obligatoria';
            }
            if(!$imagen){
                $errores[] = 'La imagen es obligatoria';
            }
            if(empty($errores)){
                $sql = "UPDATE habitacion SET tipo_hab_id = '$tipo_hab_id', hab_tarifa = '$hab_tarifa', hab_capacidad = '$hab_capacidad', imagen = '$imagen' 
                WHERE hab_numero = '$actualiza_hab'";
                echo $sql;
                $resultado = mysqli_query($bd, $sql);
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
    <a href="../tipo_hab/consultar.php">Tipo Habitación</a>
    <a href="consultar.php">Regresar</a>
    </nav>
<div>
<center><div class="conten1">
    <h3>Editar Habitacion</h3>
    </div>

<form class="formulario" method="POST">

        <label class="eltext" for="hab_numero">No. Habitación</label><br>
        <input class='bloqu' type="text" id="hab_numero" name="hab_numero" value="<?php echo $num ?>"><br>

        <label class="eltext" for="tipo_hab_id">tipo de habitación</label><br>
        <select name="tipo_hab_id" id="tipo_hab_id" name="tipo_hab_id" value="<?php echo $tipox ?>">
            <?php
            while ($hab = mysqli_fetch_array($tipo)):
                $nom = $hab['tipo_hab'];
                $id = $hab['tipo_hab_id'];
                echo "<option value=$id>$nom</option>";
            endwhile;
            ?>
        </select><br>

        <label class="eltext" for="hab_tarifa">Tarifa</label><br>
        <input class='bloqu' type="text" id="hab_tarifa" name="hab_tarifa" value="<?php echo $tarifa ?>" ><br>

        <label class="eltext" for="hab_capacidad">Capacidad</label><br>
        <input class='bloqu' type="text" id="hab_capacidad" name="hab_capacidad" value="<?php echo $capacidad ?>" ><br>

        <label class="eltext" for="imagen">Imagen</label><br>
        <input class='bloqu' type="text" id="imagen" name="imagen" value="<?php echo $img ?>" ><br>

        <input class="boton" type="submit" id="enviar" name="enviar" value="Actualizar">
</form></center>
</div>
</body>
</html>

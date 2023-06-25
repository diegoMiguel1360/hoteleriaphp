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
    $codigo_hab = $_GET["codigo"];
    $codigo_hab = filter_var($codigo_hab, FILTER_VALIDATE_INT);
    if(!$codigo_hab){
        header("consultar.php");
    }

    $estadox= consultar_estado(); 
    $tipo= consultar_tipo(); 
    $bd = conectar_bd();
    $consulta_habitacion = "SELECT * FROM habitacion
                            INNER JOIN estados ON estados.est_id = habitacion.hab_estado
                            INNER JOIN tipo_habitacion ON tipo_habitacion.tipo_hab_id = habitacion.tipo_hab_id 
                            WHERE hab_numero=$codigo_hab";
    $resultadox = mysqli_query($bd, $consulta_habitacion);
    $habi = mysqli_fetch_assoc($resultadox);
    
    $num = $habi['hab_numero'];
    $est = $habi['hab_estado'];
    $tipox = $habi['tipo_hab_id'];
    $tarifa = $habi['hab_tarifa'];
    $capacidad = $habi['hab_capacidad'];
    $img = $habi['imagen'];

    $errores =  [];
    if($_SERVER['REQUEST_METHOD'] == 'POST'){
        $hab_numero = $_POST['hab_numero'];
        $hab_estado = $_POST['hab_estado'];
        $tipo_hab_id = $_POST['tipo_hab_id'];
        $hab_tarifa = $_POST['hab_tarifa'];
        $hab_capacidad = $_POST['hab_capacidad'];
        $imagen = $_POST['imagen'];
            if(!$hab_numero){
                $errores[] = 'El número de habitacion es obligatorio';
            }
            if(!$hab_estado){
                $errores[] = 'El estado de habitacion es obligatorio';
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
                $sql = "UPDATE habitacion SET hab_estado='$hab_estado', tipo_hab_id = '$tipo_hab_id', hab_tarifa = '$hab_tarifa', hab_capacidad = '$hab_capacidad', imagen = '$imagen' 
                WHERE hab_numero = '$codigo_hab'";
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
    <a href="../estados/consultar.php">Estado Habitación</a>
    <a href="consultar.php">Regresar</a>
    </nav>
<div>
<center><div class="conten1">
    <h3>Editar Habitacion</h3>
    </div>

<form class="formulario" method="POST">

        <label class="eltext" for="hab_numero">No. Habitación</label><br>
        <input class='bloqu' type="text" id="hab_numero" name="hab_numero" readonly=true value="<?php echo $num ?>"><br>

        <label class="eltext" for="hab_estado">estado de habitación</label><br>
        <select name="hab_estado" id="hab_estado">
            <option value="<?php echo $est?>"><?php echo $habi['est_nombre']?></option>
            <?php
            while ($estadx = mysqli_fetch_array($estadox)):
                $est = $estadx['est_id'];
                $nomest = $estadx['est_nombre'];
                echo "<option value=$est>$nomest</option>";
            endwhile;
            ?>
        </select><br>

        <label class="eltext" for="tipo_hab_id">tipo de habitación</label><br>
        <select name="tipo_hab_id" id="tipo_hab_id">
        <option value="<?php echo $tipox?>"><?php echo $habi['tipo_hab']?></option>
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
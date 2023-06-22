<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/style.css">
    <title>Crear Habitacion</title>
</head>

<?php
    require "../../funciones.php";
    $tipo= consultar_tipo(); 
    $bd = conectar_bd();
    $errores =  [];
    if($_SERVER['REQUEST_METHOD'] == 'POST'){
        $hab_numero = $_POST['hab_numero'];
        $estado = $_POST['hab_estado'];
        $tipo_hab_id = $_POST['tipo_hab_id'];
        $hab_tarifa = $_POST['hab_tarifa'];
        $hab_capacidad = $_POST['hab_capacidad'];
        $imagen = $_POST['imagen'];
            if(!$hab_numero){
                $errores[] = 'El número de habitacion es obligatorio';
            }
            if(!$estado){
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
                $sql = "INSERT INTO habitacion (hab_numero, hab_estado, tipo_hab_id, hab_tarifa, hab_capacidad, imagen) 
                VALUES ('$hab_numero', '$estado', '$tipo_hab_id', '$hab_tarifa', '$hab_capacidad', '$imagen')" ;
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
    <a href="../../index.php">Regresar</a>
    </nav>
<div>
<center><div class="conten1">
    <h3>Nueva Habitacion</h3>
    </div>

<form class="formulario" method="POST" action="crear.php">

        <label class="eltext" for="hab_numero">No. Habitación</label><br>
        <input class='bloqu' type="text" id="hab_numero" name="hab_numero"><br>

        <label class="eltext" for="tipo_hab_id">tipo de habitación</label><br>
        <select name="tipo_hab_id" id="tipo_hab_id" name="tipo_hab_id">
            <option selected="true" disabled="disabled"></option>
            <?php
            while ($hab = mysqli_fetch_array($tipo)):
                $nom = $hab['tipo_hab'];
                $id = $hab['tipo_hab_id'];
                echo "<option value=$id>$nom</option>";
            endwhile;
            ?>
        </select><br>

        <label class="eltext" for="hab_tarifa">Tarifa</label><br>
        <input class='bloqu' type="text" id="hab_tarifa" name="hab_tarifa" ><br>

        <label class="eltext" for="hab_capacidad">Capacidad</label><br>
        <input class='bloqu' type="text" id="hab_capacidad" name="hab_capacidad" ><br>

        <label class="eltext" for="imagen">Imagen</label><br>
        <input class='bloqu' type="text" id="imagen" name="imagen" ><br>

        <input class="boton" type="submit" id="enviar" name="enviar" value="Enviar datos">
</form></center>
</div>
</body>
</html>

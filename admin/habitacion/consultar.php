<?php
require_once "../../funciones.php";
$resultado= consultar_hab();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/style.css">
    <title>Lista de Habitaciones</title>
</head>
<body>
<center><div class="conten1">
    <h3>Kratos Hotelería</h3><br>
    <h3>Administración de Habitaciones</h3>
    </div></center>
    <nav>
    <a href="./crear.php">Crear Habitación</a>
    <a href="../tipo_hab/consultar.php">Tipo Habitación</a>
    <a href="../estados/consultar.php">Estado Habitación</a>
    <input type="submit" name="" value="Disponibles" id="Disponibles" onclick = "funcion()">
    <input type="submit" name="" value="Ocupadas" id="Ocupadas" onclick = "funcion()">
    <input type="submit" name="" value="Reservadas" id="Reservadas" onclick = "funcion()">
    <a href="../../index.php">Regresar</a>
    </nav>

<center><table class='tabla'>
    <tr>
        <th>Nro habitacion</th>
        <th>Estado</th>
        <th>Tipo habitacion</th>
        <th>Tarifa</th>
        <th>Capacidad</th>
        <th>Imagen</th>
        <th>Acciones</th>
    </tr>

    <?php
    while ($habitacion = mysqli_fetch_array($resultado)) {
        echo '<tr>
        <td>'.$habitacion['hab_numero'] . '</td>
        <td>'.$habitacion['hab_estado'] . '</td>
        <td>'.$habitacion['tipo_hab_id'] . '</td>
        <td>'.$habitacion['hab_tarifa'] . '</td>
        <td>'.$habitacion['hab_capacidad'] . '</td>
        <td>'.$habitacion['imagen'] . '</td>
        <td><a href="actualizar.php?codigo='.$habitacion['hab_numero'].'">Actualizar</a>
        <a href="eliminar.php?codigo='.$habitacion['hab_numero'].'">Eliminar</a></td>
        </tr>';
    }
    ?>
</table></center>
</body>
</html>

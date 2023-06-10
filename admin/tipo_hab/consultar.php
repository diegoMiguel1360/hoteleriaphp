<?php
require "../../funciones.php";
$resultado= consultar_tipo();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/style.css">
    <title>Lista tipo de Habitaciones</title>
</head>
<body>
<center><div class="conten1">
    <h3>Kratos Hotelería</h3><br>
    <h3>Administración de Habitaciones</h3>
    </div></center>
    <nav>
    <a href="crear.php">Crear tipo habitación</a>
    <a href="../habitacion/consultar.php">Habitaciones</a>
    <a href="../../index.php">Regresar</a>
    </nav>

<center><table class='tabla'>
    <tr>
        <th>Codigo</th>
        <th>Tipo habitacion</th>
        <th>Acciones</th>
    </tr>

    <?php
    while ($tipo = mysqli_fetch_array($resultado)) {
        echo '<tr>
        <td>'.$tipo['tipo_hab_id'] . '</td>
        <td>'.$tipo['tipo_hab'] . '</td>
        <td><a href="admin/habitacion/actualizar.php">Actualizar</a>
        <a href="admin/habitacion/eliminar.php">Eliminar</a></td>
        </tr>';
    }
    ?>
</table></center>
</body>
</html>
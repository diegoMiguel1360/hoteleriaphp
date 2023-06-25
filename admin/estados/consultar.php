<?php
require "../../funciones.php";
$resultado= consultar_estado();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/style.css">
    <title>Lista estado de Habitaciones</title>
</head>
<body>
<center><div class="conten1">
    <h3>Kratos Hotelería</h3><br>
    <h3>Administración de Habitaciones</h3>
    </div></center>
    <nav>
    <a href="crear.php">Crear estado habitación</a>
    <a href="../habitacion/consultar.php">Habitaciones</a>
    <a href="../tipo_hab/consultar.php">Tipo Habitación</a>
    <a href="../../index.php">Regresar</a>
    </nav>

<center><table class='tabla'>
    <tr>
        <th>Codigo</th>
        <th>Estado habitacion</th>
        <th>Acciones</th>
    </tr>

    <?php
    while ($estado = mysqli_fetch_array($resultado)) {
        echo '<tr>
        <td>'.$estado['est_id'] . '</td>
        <td>'.$estado['est_nombre'] . '</td>
        <td><a href="actualizar.php?codigo='.$estado['est_id'].'">Actualizar</a>
        <a href="eliminar.php?codigo='.$estado['est_id'].'">Eliminar</a></td>
        </tr>';
    }
    ?>
</table></center>
</body>
</html>
<?php 
require "../../funciones.php";  

$codigo_eliminar = $_GET['codigo'];
$codigo_eliminar = filter_var($codigo_eliminar, FILTER_VALIDATE_INT);

if(!$codigo_eliminar){
    header('consultar.php');
}

$bd = conectar_bd();

    $sql = "DELETE FROM tipo_habitacion WHERE tipo_hab_id = $codigo_eliminar";
    echo $sql;
    $resultado = mysqli_query($bd, $sql);

    if($resultado){
        header('location: consultar.php');
    }
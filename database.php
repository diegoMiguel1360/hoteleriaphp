<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hoteleria</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<?php
function conectar_bd(){
    $bd = mysqli_connect('localhost', 'root', '', 'kratoshotel');

    if(!$bd){
        echo '<p>No se pudo conectar a la base de datos</p>';
        exit;
    }else{
        echo '';
    }
    return $bd;
}

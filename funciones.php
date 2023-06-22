<?php

function consultar_hab(){
    try{
        require 'database.php';
        $sql = "SELECT * FROM habitacion ORDER BY hab_numero;";
        $bd = conectar_bd();
        $consulta = mysqli_query($bd, $sql);
        return $consulta;
    }catch(\Throwable $th){
        echo('<pre>');
        var_dump($th);
        echo('</pre>');
    }
}

function consultar_tipo(){
    try{
        require 'database.php';
        $sql = "SELECT * FROM tipo_habitacion ORDER BY tipo_hab_id;";
        $bd = conectar_bd();
        $consulta = mysqli_query($bd, $sql);
        return $consulta;
    }catch(\Throwable $th){
        echo('<pre>');
        var_dump($th);
        echo('</pre>');
    }
}

function consultar_estado(){
    try{
        require 'database.php';
        $sql = "SELECT * FROM estados ORDER BY est_id;";
        $bd = conectar_bd();
        $consulta = mysqli_query($bd, $sql);
        return $consulta;
    }catch(\Throwable $th){
        echo('<pre>');
        var_dump($th);
        echo('</pre>');
    }
}
<?php
require_once "../../USER/Admin.php";
    $obj = new UserAdmin();

    
    //$nombre = "z";
    //$temporada = 1;
    //$capitulo = 1;
    //$estado = "ver";

    $nombre = $_POST['nombre'];
    $temporada = $_POST['temporada'];
    $estado = $_POST['estado'];

    if (($nombre!= NULL)&&($temporada!= NULL)) {
        if (($obj->getEstados_ByPK($nombre, $temporada))) {
            echo ($obj->editarEstados_Estado($nombre, $temporada, $estado));
        }else {
            echo "Algo salió mal";
        }
    }else{
        echo "Algo salió mal";
    }
?>
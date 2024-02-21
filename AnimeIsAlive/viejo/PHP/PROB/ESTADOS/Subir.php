<?php
require_once "../../USER/Admin.php";
    $obj = new UserAdmin();

    
    //$nombre = "Aharen san";
    //$temporada = 1;
    //$capitulo = 1;
    //$estado = "ver";

    $nombre = $_POST['nombre'];
    $temporada = $_POST['temporada'];
    $capitulo = $_POST['capitulo'];
    $estado = $_POST['estado'];

    if (($nombre!= NULL)&&($temporada!= NULL)) {
        if ($capitulo=="0"||$capitulo=="") {
            $estado="ver";
            $capitulo="0";
        }elseif(intval($temporada)==0){
            $estado="ver pelicula";
        }elseif (intval($capitulo)>0) {
            $estado="viendo";
        }

        var_dump($obj->getEstados_ByPK($nombre, $temporada));

        if (($obj->getEstados_ByPK($nombre, $temporada)[0])!=0) {
            echo "Hay una temporada";
            echo"<br><br>EDITAR CAPITLO<br>";
            var_dump($obj->editarEstados_Capitulo($nombre, $temporada, $capitulo));
            echo"<br>";
            echo"<br>EDITAR ESTADO<br>";
            var_dump($obj->editarEstados_Estado($nombre, $temporada, $estado));
        }elseif(!($obj->getEstados_ByPK($nombre, $temporada)[0])) {
            echo "<br>No hay ninguna temporada<br>";
            echo($obj->subirEstados($nombre, $temporada, $capitulo, $estado));
        }else{
            echo "La clave está bien, pero nada más";
        }
    }else{
        echo "Algo salió mal";
    }
?>
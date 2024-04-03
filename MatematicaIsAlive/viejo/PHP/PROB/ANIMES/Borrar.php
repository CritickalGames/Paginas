<?php
require_once "../../USER/Admin.php";
    $objUserAdmin = new UserAdmin();

    $nombre = strtoupper($_POST['nombre']);


    if (($nombre!=NULL)) {
        $estado=$objUserAdmin->getEstados_nombre($nombre);
        
        $objUserAdmin->borrarPortadas($nombre);
        $objUserAdmin->borrarEstados($estado[0]["nombre"],$estado[0]["temporada"]);
        $objUserAdmin->borrarAnimes($nombre);
    }else{
        echo "Inicial: $nombre <br>";
    }
?>
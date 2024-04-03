<?php
require_once "../../USER/Admin.php";
    $objUserAdmin = new UserAdmin();

    
    //$nombre = "z";
    $nombre = $_POST['nombre'];

    if ($nombre!= NULL) {
        var_dump($objUserAdmin->subirAnimes("$nombre"));
    }else{
        echo "Algo salió mal";
    }
?>
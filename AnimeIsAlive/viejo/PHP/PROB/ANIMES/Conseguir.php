<?php
require_once "../USER/Admin.php";
$objUserAdmin = new UserAdmin();

$nombre = $_POST['nombre'];

if (($nombre!=NULL)) {
    
    $subido=$objUserAdmin->conseguirAnimeById("$nombre", $id);
        var_dump($subido[0]);
}else{
    echo "Inicial: $nombre <br>";
}

?>
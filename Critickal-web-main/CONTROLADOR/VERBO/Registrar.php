<?php
require_once "../Require.php";


$correo = strtoupper($_GET['correo']);
$contra = $_GET['pass'];
$nombre = $_GET['name'];
$date = $_GET['date'];


/***** */

    
    if (!empty($correo) && !empty($contra) && !empty($nombre) && !empty($date)) {
        $obj = new ModeloRegistrados();
        $obj->setRegistrados($correo, $contra, $nombre, $date);
        echo $correo."-".$contra."-".$nombre."-".$date;
    }

/***** */
?>
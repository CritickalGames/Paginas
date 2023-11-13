<?php
require_once "../Require.php";


$correo = strtoupper($_GET['correo']);
$contra = $_GET['pass'];



/***** */

    
    if (!empty($correo) && !empty($contra)) {
        $obj = new ModeloRegistrados();
        $mostrar=$obj->getRegistrados($correo, $contra);
        echo var_dump($mostrar["Correo"]);
    }
/***** */
?>
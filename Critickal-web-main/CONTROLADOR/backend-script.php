<?php

    require_once "Require.php";
    $obj = new ModeloPersona();
    $mostrar=$obj->getPersona_ALL();

    $myJSON = json_encode($mostrar);

    echo $myJSON;

?>

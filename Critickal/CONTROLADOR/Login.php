<?php

require_once "Require.php";


$correo = strtoupper($_POST['Correo']);
$contra = $_POST['Contraseña'];


/***** */

    $obj = new ModeloRegistrados();
    //$mostrar['Correo']==$correo && $mostrar['Contraseña']==$contra

    if (($obj->getRegistrados($correo, $contra))==TRUE) {
        //echo $mostrar['Correo'];
        header("Location: ./../HTML/PaginaDeInicio.html");
    }else{
        header("Location: ./../HTML/PaginaDeRegistro.html");
    }
    
    

    echo "<br><center><h1>".$correo."</h1></center>";


/***** */
?>
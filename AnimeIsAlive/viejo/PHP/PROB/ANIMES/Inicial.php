<?php
require_once "../USER/Admin.php";
    $objUserAdmin = new UserAdmin();
    
    $inicial = $_POST['inicial'];
    //$inicial = "";
    if (($inicial!=NULL)) {
        $animes=($objUserAdmin->listarAnimePorInicial("$inicial"));
        $estados=($objUserAdmin->agruparEstadosForTemporadaByInicial($inicial));
        
        foreach ($animes as $key => $value) {
            $array;
            $array[$key]=$value;
            
            foreach ($estados as $estadoK => $estadoV) {
                if (($value["nombre"]==$estadoV["nombre"])) {
                    $array[$key]=$estadoV;
                }else {
                    break;
                }
            }
        }
        echo json_encode($array);
    }else{
        $animes=($objUserAdmin->listarAnimePorInicial("A"));
        $estados=($objUserAdmin->agruparEstadosForTemporadaByInicial("A"));

        foreach ($animes as $key => $value) {
            $array;
            $array[$key]=$value;
            
            foreach ($estados as $estadoK => $estadoV) {
                if (($value["nombre"]==$estadoV["nombre"])) {
                    $array[$key]=$estadoV;
                }else {
                    break;
                }
            }
        }
        echo json_encode($array);
    }
?>
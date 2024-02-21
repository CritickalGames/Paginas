<?php
require_once "../USER/Admin.php";
    $objUserAdmin = new UserAdmin();
    $nombre = $_POST['nombre'];
    //$nombre = "Date";
    //$nombre = "";
    if (($nombre!=NULL)) {
        $animes=($objUserAdmin->buscarAnimeAll($nombre));
        $estados=($objUserAdmin->agruparEstadosForTemporadaByNombre($nombre));

        foreach ($animes as $key => $value) {
            $array;
            $array[$key]=$value;
            foreach ($estados as $estadoK => $estadoV) {
                if ($estadoV) {
                    if (($value["nombre"]==$estadoV["nombre"])) {
                        $array[$key]=$estadoV;
                    }else {
                        break;
                    }
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
                if ($estadoV) {
                    if (($value["nombre"]==$estadoV["nombre"])) {
                        $array[$key]=$estadoV;
                    }else {
                        break;
                    }
                }
            }
        }
        echo json_encode($array);
    }
?>
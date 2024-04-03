<?php
require_once "../../USER/Admin.php";
    $objUserAdmin = new UserAdmin();
    $nombre = $_POST['nombre'];
    $base=[
        "nombre"=> "",
        "url"=> "",
        "archivo"=> "",
        "formato"=> "",
        "temporada"=> "",
        "capitulo"=> "",
        "estado"=> "",
    ];
    $array=[];
    //$nombre = "Z";
    //$nombre = "a";
    if (($nombre!=NULL)) {
        $animes=($objUserAdmin->listarAnimes_nombre($nombre));
        $estados=($objUserAdmin->listarEstados_nombre($nombre));
        $portadas=($objUserAdmin->listarPortadas_nombre($nombre));

        foreach ($animes as $key => $value) {
            array_push($array,$base);
            $array[$key]["nombre"]=$value["nombre"];
            foreach ($portadas as $portadaK => $portadaV) {
                
                if ($portadaV) {
                    if (($value["nombre"]==$portadaV["nombre"])) {
                        $array[$key]["nombre"]=$portadaV["nombre"];
                            $array[$key]["url"]=$portadaV["url"];
                        if ($portadaV["archivo"]) {
                            $array[$key]["archivo"]=$portadaV["archivo"];
                            $array[$key]["formato"]=$portadaV["formato"];
                        }
                    }
                }
            }
            foreach ($estados as $estadoK => $estadoV) {
                if ($estadoV) {
                    if (($value["nombre"]==$estadoV["nombre"])) {
                        $array[$key]["temporada"]=$estadoV["temporada"];
                        $array[$key]["capitulo"]=$estadoV["capitulo"];
                        $array[$key]["estado"]=$estadoV["estado"];
                    }
                }
            }

        }
        echo json_encode($array);
    }else{
        $animes=($objUserAdmin->listarAnimes_nombre("A"));
        $estados=($objUserAdmin->listarEstados_nombre("A"));
        $portadas=($objUserAdmin->listarPortadas_nombre("A"));
        
        foreach ($animes as $key => $value) {
            
            array_push($array,$base);
            $array[$key]["nombre"]=$value["nombre"];
            foreach ($portadas as $portadaK => $portadaV) {
                
                if ($portadaV) {
                    if (($value["nombre"]==$portadaV["nombre"])) {
                        $array[$key]["nombre"]=$portadaV["nombre"];
                        $array[$key]["url"]=$portadaV["url"];
                        if ($portadaV["archivo"]) {
                            $array[$key]["archivo"]=$portadaV["archivo"];
                            $array[$key]["formato"]=$portadaV["formato"];
                        }
                    }else {
                    }
                }
            }
            foreach ($estados as $estadoK => $estadoV) {
                if ($estadoV) {
                    if (($value["nombre"]==$estadoV["nombre"])) {
                        $array[$key]["temporada"]=$estadoV["temporada"];
                        $array[$key]["capitulo"]=$estadoV["capitulo"];
                        $array[$key]["estado"]=$estadoV["estado"];
                    }else {
                    }
                }
            }
        }
        echo json_encode($array);
    }
?>
<?php

require_once "RControladores.php";

class Backoffice{
    function borrar(string $tabla, array $valores){
        
        switch (strtolower($tabla)) {
            case "animes":
                $obj = new ControladorAnimes();
                $obj->borrar(
                        $valores[0]);
            break;
            case "estados":
                $obj = new ControladorEstados();
                $obj->borrar(
                        $valores[0],
                        $valores[1]
                    );
            break;
            case "portadas":
                $obj = new ControladorPortadas();
                $obj->borrar(
                        $valores[0]);
            break;
        }
    }

    function buscar(string $tabla, array $valores){
        
        switch (strtolower($tabla)) {
            case "animes":
                $obj = new ControladorAnimes();
                $by = "buscarBy".$valores[0];
                return ($obj->{$by}($valores[1]));
                break;
        }
    }

    function contar(string $tabla){
        
        switch (strtolower($tabla)) {
            case "animes":
                $obj = new ControladorAnimes();
                return $obj->contar();
                break;
        }
        
    }

    function editar(string $tabla, array $valores){
        
        switch (strtolower($tabla)) {
            case "animes":
                $obj = new ControladorAnimes();
                $by = "editar_".$valores[0];
                return ($obj->{$by}(
                        $valores[1],
                        $valores[2]));
            break;
            case "estados":
                $obj = new ControladorEstados();
                $by = "editar_".$valores[0];
                return ($obj->{$by}(
                        $valores[1],
                        $valores[2],
                        $valores[3]));
            break;
        }
    }

    function get(string $tabla, array $valores){
        
        switch (strtolower($tabla)) {
            case "animes":
                $obj = new ControladorAnimes();
                $by = "get_".$valores[0];
                return ($obj->{$by}(
                    $valores[1]
                ));
                break;
            case "estados":
                $obj = new ControladorEstados();
                $by = "get_".$valores[0];
                return ($obj->{$by}(
                    $valores[1],
                    $valores[2]
                ));
                break;
            case "portadas":
                $obj = new ControladorPortadas();
                $by = "get_".$valores[0];
                return ($obj->{$by}(
                    $valores[1]
                ));
                break;
        }
    }

    function listar(string $tabla, array $valores){
        
        switch (strtolower($tabla)) {
            case "animes":
                $obj = new ControladorAnimes();
                $by = "listar_".$valores[0];
                return ($obj->{$by}(
                    $valores[1]
                ));
            break;
            case "estados":
                $obj = new ControladorEstados();
                $by = "listar_".$valores[0];
                return ($obj->{$by}(
                    $valores[1]
                ));
            break;
            case "portadas":
                $obj = new ControladorPortadas();
                $by = "listar_".$valores[0];
                return ($obj->{$by}(
                    $valores[1]
                ));
            break;
        }
        
    }
    function subir(string $tabla, array $valores){
        
        switch (strtolower($tabla)) {
            case "animes":
                $obj = new ControladorAnimes();
                ($obj->set(
                    $valores[0]
                ));
            break;
            case "estados":
                $obj = new ControladorEstados();
                return ($obj->set(
                    $valores[0],
                    $valores[1],
                    $valores[2],
                    $valores[3]
                ));
            break;
        }
    }
}

//$obj->{$strMetodo}();
/**
 
 */
?>


<?php

require_once "RModelos.php";

class ControladorPortadas extends ModeloPortadas
{

    public function set($valorColumna){
        $this->setPortadas($valorColumna);
    }
///////////////////Borrar
    public function borrar($valorClave){
        $this->borrarPortadas($valorClave);
    }
///////////////////Search
///////////////////Edit
///////////////////Get
    public function get_nombre($valorColumna){
        return $this->getPortadas_nombre($valorColumna);
    }
///////////////////Group
///////////////////Listar
    public function listar_nombre($valorColumnaDeCriterio){
        return $this->getPortadas_nombre($valorColumnaDeCriterio);
    }
///////////////////////////////
    public function contar(){
        return $this->contarPortadas();
    }
}
?>
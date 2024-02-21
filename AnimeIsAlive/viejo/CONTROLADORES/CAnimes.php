<?php

require_once "RModelos.php";

class ControladorAnimes extends ModeloAnimes
{

    public function set($valorColumna){
        $this->setAnimes($valorColumna);
    }
///////////////////Borrar
    public function borrar($valorColumna){
        $this->borrarAnimes($valorColumna);
    }
///////////////////Search
///////////////////Edit
///////////////////Get
///////////////////Group
///////////////////Listar
    public function listar_(){
        return $this->get_ALL();
    }

    public function listar_nombre($valorColumna){
        return $this->getAnimes_nombre("$valorColumna%");
    }
///////////////////////////////
    public function contar(){
        return $this->contarAnimes();
    }
}
?>
<?php

require_once "RModelos.php";

class ControladorEstados extends ModeloEstados
{

    public function set($valorClave1, $valorClave2, $valorColumna1, $valorColumna2){
        return $this->setEstados($valorClave1, $valorClave2, $valorColumna1, $valorColumna2);
    }
///////////////////Borrar
    public function borrar($valorClave1, $valorClave2){
        $this->borrarEstados($valorClave1, $valorClave2);
    }
///////////////////Search
///////////////////Edit
    public function editar_capitulo($valorClave1, $valorClave2, $valorColumna){
        return $this->editarEstados_capitulo($valorClave1, $valorClave2, $valorColumna);
    }
    public function editar_estado($valorClave1, $valorClave2, $valorColumna){
        return $this->editarEstados_estado($valorClave1, $valorClave2, $valorColumna);
    }
///////////////////Get
    public function get_PK($valorClave1, $valorClave2){
        return $this->getEstados_PK($valorClave1, $valorClave2);
    }
    public function get_nombre($valorColumna){
        return $this->getEstados_nombre($valorColumna);
    }
///////////////////Group
///////////////////Listar
    public function listar_nombre($valorColumnaDeCriterio){
        return $this->groupEstados_temporada_capitulo_ByNombre($valorColumnaDeCriterio);
    }
///////////////////////////////
    public function contar(){
        return $this->contarEstados();
    }
}
?>
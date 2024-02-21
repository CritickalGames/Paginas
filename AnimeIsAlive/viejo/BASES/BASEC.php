<?php

require_once "RModelos.php";

class ControladorTABLA extends ModeloTABLA
{

    public function setTABLA($KEY){
        $this->set($KEY);
    }
///////////////////Borrar
    public function borrarTABLA($KEY){
        $this->borrar($KEY);
    }
///////////////////Search
    public function buscarTABLAByAtributo($Atributo){
        return $this->buscar($Atributo);
    }
///////////////////Edit
    public function editarTABLA($KEY, $ATR){
        $this->editar($KEY, $ATR);
    }
///////////////////Get
    public function getTABLAByAtributo($Atributo){
        $Atributo = strtoupper($Atributo);
        return $this->getByAtributo($Atributo);
    }
///////////////////Listar
    public function listarTABLAByAll(){
        return $this->get_All();
    }

    public function listarTABLAByAtributo($Atributo){
        return $this->getByAtributo($Atributo);
    }

    public function listarTABLAWhere(string $where){
        return $this->get_All_Where($where);
    }
///////////////////////////////
    public function contarTABLA(){
        return $this->contar();
    }

    public function contarTABLAWhere(string $where){
        return $this->contarWhere($where);
    }
}
?>
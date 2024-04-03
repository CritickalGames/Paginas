<?php 

require_once "MConexion.php";


class ModeloTABLA extends ModeloConexion
{
    const tabla="TABLA";

    public function set($key, $atr)
    {
        echo "<br>-setEstados Modelo-";
        $tabla = self::tabla;
        return $this->sqlSet($tabla, "key, atr", 
            /*Value*/        "'$key', '$atr'");
    }
///////////////////Borrar
    public function borrar($atr){
        $tabla = self::tabla;
        return $this->sqlBorrar($tabla, "key",
                                $atr);
    }
///////////////////Search
    public function buscarPorAtributo($atr){
        $tabla = self::tabla;
        return $this->sqlBuscar($tabla, "atributo", "%$atr%");
    }
///////////////////Edit
    public function editarAtributo($key, $ATR){
        $tabla = self::tabla;
        $nombreDeClave= "key";
        return $this->sqlEditar($tabla, "atributo", $ATR, $nombreDeClave, $key);
    }
///////////////////Get
    public function getByAtributo($ATR){
        $tabla = self::tabla;
        return $this->sqlGetBy($tabla, "atributo", $ATR);
    }
///////////////////Group
    public function groupForTemporadaByNombre($nombre){//INVENTA LO QUE QUIERAS
        $sql="RELLENAR";
        return $this->get($sql);
    }
///////////////////////////////
    public function get_ALL(){
        $tabla = self::tabla;
        return $this->sqlGet($tabla);
    }

    public function contar(){
        $sql="SELECT * from Estados";
        return $this->count($sql);
    }
}

?>
<?php 

require_once "MConexion.php";


class ModeloPortadas extends ModeloConexion
{

    const tabla="portadas";
    const nombreClave="nombre";
    const nombreColumnas=["nombre"];

    public function setPortadas($valorClave){
        $tabla = self::tabla;
        $nombreColumnas = self::nombreColumnas;
        return $this->sqlSet($tabla, $nombreColumnas, $valorClave);
    }
///////////////////Borrar
    public function borrarPortadas($valorClave){
        $tabla = self::tabla;
        $nombreClave = self::nombreClave;
        return $this->sqlBorrar($tabla, $nombreClave, $valorClave);
    }
///////////////////Edit
///////////////////Get
    public function getPortadas_nombre($valorColumna){
        $tabla = self::tabla;
        return $this->sqlGetByLike($tabla, "nombre", "$valorColumna%");
    }
///////////////////Group
///////////////////////////////
    public function get_ALL(){
        $tabla = self::tabla;
        return $this->sqlGet($tabla);
    }

    public function contarPortadas(){
        $tabla = self::tabla;
        return $this->sqlCount($tabla);
    }
}
?>
<?php 

require_once "MConexion.php";


class ModeloAnimes extends ModeloConexion
{

    const tabla="animes";
    const nombreClave="nombre";
    const nombreColumnas=["nombre"];

    public function setAnimes($valorClave){
        $tabla = self::tabla;
        $nombreColumnas = self::nombreColumnas;
        return $this->sqlSet($tabla, $nombreColumnas, $valorClave);
    }
///////////////////Borrar
    public function borrarAnimes($valorClave){
        $tabla = self::tabla;
        $nombreClave = self::nombreClave;
        return $this->sqlBorrar($tabla, $nombreClave, $valorClave);
    }
///////////////////Search
///////////////////Edit
///////////////////Get
    public function getAnimes_nombre($valorColumna){
        $tabla = self::tabla;
        return $this->sqlGetByLike($tabla, "nombre", $valorColumna);
    }
///////////////////Group
///////////////////////////////
    public function get_ALL(){
        $tabla = self::tabla;
        return $this->sqlGet($tabla);
    }

    public function contarAnimes(){
        $tabla = self::tabla;
        return $this->sqlCount($tabla);
    }
}
?>
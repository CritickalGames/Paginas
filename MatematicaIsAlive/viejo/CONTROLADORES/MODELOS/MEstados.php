<?php 

require_once "MConexion.php";


class ModeloEstados extends ModeloConexion
{

    const tabla="estados";
    const nombreClave="nombre, temporada";
    const nombreColumnas=["nombre", "temporada", "capitulo", "estado"];

    public function setEstados($valorClave1, $valorClave2, $valorColumna1, $valorColumna2){
        $tabla = self::tabla;
        $nombreColumnas = self::nombreColumnas;
        return $this->sqlSet($tabla, $nombreColumnas, $valorClave1, $valorClave2,
                                                    $valorColumna1, $valorColumna2);
    }
///////////////////Borrar
    public function borrarEstados($valorClave1, $valorClave2){
        $tabla = self::tabla;
        $nombreClave = self::nombreClave;
        return $this->sqlBorrar($tabla, $nombreClave, $valorClave1, $valorClave2);
    }
///////////////////Search
///////////////////Edit
    public function editarEstados_capitulo($valorClave1, $valorClave2, $valorColumna){
        $tabla = self::tabla;
        $nombreClave= self::nombreClave;
        return $this->sqlEditar($tabla, "capitulo", $valorColumna, $nombreClave, $valorClave1, $valorClave2);
    }
    public function editarEstados_estado($valorClave1, $valorClave2, $valorColumna){
        $tabla = self::tabla;
        $nombreClave= self::nombreClave;
        return $this->sqlEditar($tabla, "estado", $valorColumna, $nombreClave, $valorClave1, $valorClave2);
    }
///////////////////Get
    public function getEstados_nombre($valorColumna){
        $tabla = self::tabla;
        return $this->sqlGetBy($tabla, "nombre", $valorColumna);
    }
    public function getEstados_PK($valorClave1, $valorClave2){
        $tabla = self::tabla;
        $nombreClave = self::nombreClave;
        return $this->sqlGetBy($tabla, $nombreClave, $valorClave1, $valorClave2);
    }
///////////////////Group
    public function groupEstados_temporada_capitulo_ByNombre($valordeColumna){
        $tabla = self::tabla;
        $sql = "SELECT * FROM $tabla e
        WHERE EXISTS(
            SELECT nombre, max(temporada) AS temporada, capitulo, estado FROM $tabla
            WHERE nombre LIKE '$valordeColumna%' AND 
                e.nombre= nombre
            GROUP BY nombre
            HAVING e.temporada= temporada
            )
        ";
        return $this->get($sql);
    }
    public function groupEstados_temporada_capitulo(){
        $sql="SELECT * FROM estados e
        WHERE EXISTS(
            SELECT nombre, max(temporada) AS temporada, capitulo, estado FROM estados
            WHERE e.nombre= nombre
            GROUP BY nombre
            HAVING e.temporada= temporada
        )";
        return $this->get($sql);
    }
///////////////////////////////
    public function get_ALL(){
        $tabla = self::tabla;
        return $this->sqlGet($tabla);
    }

    public function contarEstado(){
        $tabla = self::tabla;
        return $this->sqlCount($tabla);
    }
}
?>
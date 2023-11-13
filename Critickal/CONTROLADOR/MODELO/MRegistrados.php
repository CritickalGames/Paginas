<?php 

require_once "MConexion.php";


class ModeloRegistrados extends ModeloConexion
{
    public function setRegistrados($correo, $contra, $nombre, $date)
    {
        $sql = "INSERT INTO registro (Correo, Contraseña, Nombre, Nacimiento) 
        VALUES ('$correo', '$contra', '$nombre', '$date')";
        $this->sentencia_subir($sql);
    }

    public function getRegistrados($correo,$contra){
        $sql="SELECT * from registro where (Correo, Contraseña) = ('$correo','$contra')";
        return $this->sentencia_mostrar($sql);
    }
    public function getRegistrados_ALL(){
        $sql="SELECT * from registro";
        return $this->get_ALL($sql);
    }
}

?>
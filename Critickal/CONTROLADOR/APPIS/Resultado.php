<?php 
require("../Require.php");

class Resultado
{    
      function getAll(){
            $SQL = new Sql();
            $conexion = new Conexion();
            $mysqli = $conexion->conectarBD("critickalweb");

            $sql = "SELECT * FROM personas";

            $arry = array();
            $SQL->guardarTupla($mysqli, $sql, $arry);
      }
}
 ?>
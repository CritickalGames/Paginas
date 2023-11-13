<?php 

require("../Require.php");

class Publicidad{
	
	function descargarPublicidad(){
		$SQL = new Sql();
		$conexion = new Conexion();
		$mysqli= $conexion->conectarBD("CritickalWeb");
		$res2=array();
		$sql= "SELECT * FROM publicidad";
		$res=$SQL->consulta($mysqli, $sql);
		$SQL->cargarPublicidad($res, $res2);
		
	}
	function mostrarPublicidad(array $array){
		$numDeUrl=count($array);
		$imagenAleatoria= rand(0,$numDeUrl-1);
		$imagen=json_encode($array[$imagenAleatoria]);
		//como quitar lo que no va en la url
		$sobrantes=["[","]","\"","\\"];
	    $resultado = str_replace($sobrantes, "", $imagen);
		//echo "<br>". $resultado;
		echo "<img width=300px src=".$resultado.">";
		
	}

	}		
?>
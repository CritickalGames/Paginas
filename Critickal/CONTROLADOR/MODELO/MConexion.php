<?php

class ModeloConexion
{

  public function conectar(){
    $server = 'localhost:3306';
    $usuario = 'root';
    $contraseña = '';
    $basededatos = 'usuarios';
    $conexion = new mysqli($server, $usuario, $contraseña, $basededatos);
    if($conexion->connect_error){
      die("conexion fallida" . $conexion->connect_error);
    }
    return $conexion;
  }

  public function sentencia_mostrar(string $sql){
    $conexion=$this->conectar();
    $result=mysqli_query($conexion,$sql);
    $mostrar=mysqli_fetch_array($result);
    return $mostrar;
  }
  public function sentencia_subir(string $sql){
    $conexion=$this->conectar();
    $result=mysqli_query($conexion,$sql);
    $stmt = $conexion->query($sql);
    return $stmt;
  }

  public function get_ALL(string $sql){
    $conexion=$this->conectar();
    $exec=mysqli_query($conexion, $sql);
    if(mysqli_num_rows($exec)>0){
      $row= mysqli_fetch_all($exec);
      return $row;  
          
    }else{
      return $row=[];
    }
  }

}



?>
<?php
// Incluir la clase de conexión
include '../Modelo/MConexion.php';

// Crear una instancia de la clase de conexión
$conexion = new MConexion();

// Ejecutar una consulta para obtener la tabla "items"
$sql = "SELECT * FROM items";
$sentencia = $conexion->enviarConsulta($sql);

// Crear un array para almacenar los resultados
$resultados = array();
while($fila = $sentencia->fetch_assoc()) {
    $resultados[] = $fila;
}

// Cerrar la conexión
$conexion->close();

// Imprimir los resultados como JSON
echo json_encode($resultados);
?>

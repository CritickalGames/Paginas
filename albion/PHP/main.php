<?php
// Incluir la clase de conexión
include 'Modelo/MConexion.php';

// Crear una instancia de la clase de conexión
$conexion = new MConexion();

// Ejecutar una consulta de ejemplo
$sql = "SELECT * FROM items";
$resultado = $conexion->query($sql);

// Convertir el resultado en un array asociativo y enviarlo como JSON
$rows = array();
while($row = $resultado->fetch_assoc()) {
    $rows[] = $row;
}
echo json_encode($rows);

// Cerrar la conexión
$conexion->close();
?>

<?php

class MConexion {
    private $servername = "localhost";
    private $username = "root";
    private $password = "";
    private $database = "albion_tabla";
    private $conn;

    // Constructor
    public function __construct() {
        $this->conn = new mysqli($this->servername, $this->username, $this->password, $this->database);

        // Verificar conexión
        if ($this->conn->connect_error) {
            die("Error de conexión: " . $this->conn->connect_error);
        }
    }

    // Método para ejecutar consultas SQL
    public function query($sql) {
        $result = $this->conn->query($sql);
        return $result;
    }

    // Método para cerrar la conexión
    public function close() {
        $this->conn->close();
    }
}

// Ejemplo de uso:
/*
$conexion = new MConexion();

$sql = "SELECT * FROM tu_tabla";
$resultado = $conexion->query($sql);

if ($resultado->num_rows > 0) {
    // Procesar los resultados
} else {
    echo "No se encontraron resultados.";
}

$conexion->close();
*/

?>

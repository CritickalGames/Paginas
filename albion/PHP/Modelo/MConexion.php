<?php
class MConexion {
    private $server = 'localhost:3306';
    private $usuario = 'root';
    private $contraseña = '';
    private $basededatos = 'albion_tabla';
    private $conexion;

    public function __construct() {
        $this->conexion = new mysqli($this->server, $this->usuario, $this->contraseña, $this->basededatos);
        if ($this->conexion->connect_error) {
            die("Conexión fallida: " . $this->conexion->connect_error);
        }
    }

    public function conectar() {
        return $this->conexion;
    }

    public function enviarConsulta(string $sql) {
        $conexion = $this->conectar();
        $result = mysqli_query($conexion, $sql);
        return $result;
    }

    public function sentencia(string $sql) {
        if ($this->enviarConsulta($sql)) {
            return "-SENTENCIA ENVIADA <br>---<br>$sql";
        } else {
            return "-SENTENCIA ERROR <br>---<br>$sql";
        }
    }

    // Método para cerrar la conexión
    public function close() {
        $this->conexion->close();
    }
}
?>

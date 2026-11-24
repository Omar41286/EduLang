<?php
class Conexion {
    private $servername = "127.0.0.1";
    private $username = "root";
    private $password = "";
    private $database = "Edulang";
    private $conn;

    function __construct() {
        $this->conn = new mysqli($this->servername, $this->username, $this->password, $this->database);

        if ($this->conn->connect_error) {
            die("Error de conexión: " . $this->conn->connect_error);
        }
    }

    function getConnection() {
        return $this->conn;
    }
}
?>
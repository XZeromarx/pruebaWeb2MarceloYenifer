<?php

require_once("Conexion.php");

class Data {

    private $con;

    public function __construct() {
        $this->con = new Conexion("id5908109_db_encuesta");
    }

    public function ejecutarQuery($query) {

        $this->con->conectar();
        $this->con->ejecutar($query);
        $this->con->desconectar();
    }


}

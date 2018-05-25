<?php

require_once("Conexion.php");

class Data {

    private $con;

    public function __construct() {
        $this->con = new Conexion("db_encuesta");
    }

    public function ejecutarQuery($query) {

        $this->con->conectar();
        $this->con->ejecutar($query);
        $this->con->desconectar();
    }

    public function mostrarOpciones() {
        $this->con->conectar();
        $rs = $this->con->ejecutar("SELECT op1.op AS 'Opcion1', op2.op AS 'Opcion2'
                                    FROM pregunta p
                                    INNER JOIN opcion1 op1 ON p.fk_opcion1 = op1.id
                                    INNER JOIN opcion2 op2 ON p.fk_opcion2 = op2.id
                                    WHERE op1.id = fk_opcion1 AND
                                    op2.id = fk_opcion2;");
        $this->con->desconectar();
        return $rs;
    }

}

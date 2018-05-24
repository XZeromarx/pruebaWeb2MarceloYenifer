/**
 * Author:  XZeroMarx
 * Created: 23-05-2018
 */

CREATE DATABASE db_encuesta;

USE db_encuesta;

CREATE TABLE opcion( -- DROP TABLE opcion
id INT AUTO_INCREMENT,
opcion VARCHAR(100) NOT NULL,
contOp1 INT DEFAULT 0,
PRIMARY KEY (id)
); -- SELECT * FROM opciones

CREATE TABLE pregunta( -- DROP TABLE pregunta
id INT AUTO_INCREMENT,
fk_opcion1 INT,
fk_opcion2 INT,
contGeneral INT DEFAULT 0,
PRIMARY KEY (id),
FOREIGN KEY (fk_opcion1) REFERENCES opcion(id),
FOREIGN KEY (fk_opcion2) REFERENCES opcion(id)
); -- SELECT * FROM pregunta



INSERT INTO opcion(op1) VALUES('Colo Colo');
INSERT INTO opcion(op1) VALUES('La U');


UPDATE opciones
SET opcion = opcion + 1,
    contGeneral = contGeneral + 1 --siempre aumenta en 1 cuando se actualiza la tabla
WHERE
id = 'ID OPCION';

DELIMITER $$
CREATE FUNCTION crearPregunta(IN _opcion1 VARCHAR(100),
                               IN _opcion2 VARCHAR(100)) RETURNS VARCHAR(100)
BEGIN

DECLARE _correcto1 BOOLEAN = FALSE;
DECLARE _correcto2 BOOLEAN = FALSE;

DECLARE _opcion1Rescatada VARCHAR() = 

IF _opcion1 = 
SELECT 'asdasdasd'

INSERT INTO opciones (op1,op2) VALUES(_opcion1,_opcion2);--en caso que no existan las opciones(o en este caso, que no se repita una)

END $$
DELIMITER ;
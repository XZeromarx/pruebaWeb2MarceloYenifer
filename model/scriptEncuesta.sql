/**
 * Author:  XZeroMarx
 * Created: 23-05-2018
 */

CREATE DATABASE db_encuesta;

USE db_encuesta;

CREATE TABLE opciones( -- DROP TABLE opciones
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
FOREIGN KEY (fk_opcion1) REFERENCES opciones(id),
FOREIGN KEY (fk_opcion2) REFERENCES opciones(id)
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

DECLARE _existeOpcion1 BIT = (SELECT COUNT(*) FROM opciones WHERE opcion = _opcion1);
DECLARE _existeOpcion2 BIT = (SELECT COUNT(*) FROM opciones WHERE opcion = _opcion2);



IF _existeOpcion1 = 0
    BEGIN
        SELECT 'OPCION 1 NO ES IGUAL'
        INSERT INTO opciones (opcion) VALUES(_opcion1);
        DECLARE _idOpcion1 INT = (SELECT id FROM opciones WHERE opcion = _opcion1)
        SET _correcto1 = TRUE
    END
ELSE
    SELECT 'NO SE HA INSERTADO NADA YA QUE YA EXISTE LA OPCIÓN'

IF _existeOpcion2 = 0
    BEGIN
        SELECT 'OPCION 2 NO ES IGUAL'
        INSERT INTO opciones (op1,op2) VALUES(_opcion1,_opcion2);--en caso que no existan las opciones(o en este caso, que no se repita una)
        DECLARE _idOpcion2 INT = (SELECT id FROM opciones WHERE opcion = _opcion2)
        SET _correcto2 = TRUE
    END
ELSE
    SELECT 'NO SE HA INSERTADO NADA YA QUE YA EXISTE LA OPCIÓN'

IF _correcto1 = TRUE AND _correcto2 = TRUE
    BEGIN
    DECLARE retorno VARCHAR (100) = 'Realizado correctamente'
    RETURN retorno
    END
ELSE
    BEGIN
        DECLARE retorno VARCHAR (100) = 'Error, una opcion está repetida'
        RETURN retorno
    END

END $$
DELIMITER ;
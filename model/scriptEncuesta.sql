/**
 * Author:  XZeroMarx
 * Created: 23-05-2018
 */

CREATE DATABASE db_encuesta; -- DROP DATABASE db_encuesta;

USE db_encuesta; -- USE mysql;

CREATE TABLE opcion1( -- DROP TABLE opcion1
id INT AUTO_INCREMENT,
op VARCHAR(100),
contOp1 INT DEFAULT 0,
PRIMARY KEY (id)
); -- SELECT * FROM opcion1

CREATE TABLE opcion2( -- DROP TABLE opcion2
id INT AUTO_INCREMENT,
op VARCHAR(100),
contOp1 INT DEFAULT 0,
PRIMARY KEY (id)
); -- SELECT * FROM opcion2


CREATE TABLE pregunta( -- DROP TABLE pregunta
id INT AUTO_INCREMENT,
fk_opcion1 INT,
fk_opcion2 INT,
contGeneral INT DEFAULT 0,
PRIMARY KEY (id),
FOREIGN KEY (fk_opcion1) REFERENCES opcion1(id),
FOREIGN KEY (fk_opcion2) REFERENCES opcion2(id)
); -- SELECT * FROM pregunta


UPDATE opciones
SET opcion = opcion + 1,
    contGeneral = contGeneral + 1 --siempre aumenta en 1 cuando se actualiza la tabla
WHERE
id = 'ID OPCION';


DELIMITER $$
CREATE PROCEDURE registrarPregunta( 
    IN _opcion1 VARCHAR(100),                               
    IN _opcion2 VARCHAR(100) ) --DROP PROCEDURE registrarPregunta;
   BEGIN

     
    DECLARE _existeOpcion1 BIT DEFAULT 0;
    DECLARE _existeOpcion2 BIT DEFAULT 0;
    DECLARE _fkOpcion1 INT;
    DECLARE _fkOpcion2 INT;
    SET _existeOpcion1 = (SELECT COUNT(*) FROM opcion1 WHERE _opcion1 = op);
    SET _existeOpcion2 = (SELECT COUNT(*) FROM opcion2 WHERE _opcion2 = op );
    IF _existeOpcion1 = 0 THEN
        INSERT INTO opcion1(op) VALUES(_opcion1);
    END IF;
    SET _fkOpcion1 =(SELECT id FROM opcion1 WHERE _opcion1 = op);
  

    

    IF _existeOpcion2 = 0 THEN

        INSERT INTO opcion2(op) VALUES(_opcion2);
    END IF;
    SET _fkOpcion2 =(SELECT id FROM opcion2 WHERE op = _opcion2);

    INSERT INTO pregunta(fk_opcion1,fk_opcion2) VALUES (_fkOpcion1,_fkOpcion2);

END $$
DELIMITER;

CALL registrarPregunta('primeraOpcion2','segundaOpcion2');


INSERT INTO opcion(op) VALUES('asdasd');



CREATE VIEW mostrarOpcionesEmparejadas AS
SELECT op1.op AS 'Opcion1', op2.op AS 'Opcion2'
FROM pregunta p
INNER JOIN opcion1 op1 ON p.fk_opcion1 = op1.id
INNER JOIN opcion2 op2 ON p.fk_opcion2 = op2.id
WHERE op1.id = fk_opcion1 AND
op2.id = fk_opcion2;

SELECT * FROM mostrarOpcionesEmparejadas
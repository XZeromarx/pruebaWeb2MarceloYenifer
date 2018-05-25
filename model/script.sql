/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  MOMORA
 * Created: 24-05-2018
 */
CREATE DATABASE bd_web;
USE bd_web;

CREATE TABLE preguntas(
    id INT  AUTO_INCREMENT,
    nombre VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE respuesta(
    id INT AUTO_INCREMENT,
    respuesta VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE preg_resp(
    id INT AUTO_INCREMENT,
    pregunta_fk INT,
    respuesta_fk INT,
    FOREIGN KEY (pregunta_fk) REFERENCES pregunta (id),
    FOREIGN KEY (respuesta_fk) REFERENCES respuesta(id),
    PRIMARY KEY (id)
);

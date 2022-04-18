/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  castulo
 * Created: 16/04/2022
 */

// EX - EXTERNO
// IN - INTERNO
// MM - MUESTRA MEDICA
// LQ - LABORATORIO

CREATE TABLE tipoSolicitud(
    TIPOSOLI_id int PRIMARY KEY AUTO_INCREMENT,
    TIPOSOLI_solicitud VARCHAR(20) NOT NULL
)

INSERT INTO tipoSolicitud (TIPOSOLI_solicitud) VALUES ("MM"),("LQ")

CREATE TABLE tipoUsuario(
    USU_id int PRIMARY KEY AUTO_INCREMENT,
    USU_tipoUsuario VARCHAR(20) NOT NULL
)

INSERT INTO tipoUsuario (USU_tipoUsuario) VALUES ("IN"),("EX")



CREATE TABLE manteSolicitud(
    MANTESOLI_id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    MANTESOLI_tipoSolicitante VARCHAR(20) NOT NULL,
    MANTESOLI_tipoSolicitud VARCHAR(20) NOT NULL,
    MANTESOLI_descripcion TEXT NOT NULL,
    MANTESOLI_correlativo VARCHAR(100) NOT NULL,
    MANTESOLI_fechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    MANTESOLI_fechaModificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

INSERT INTO manteSolicitud (MANTESOLI_tipoSolicitante,MANTESOLI_tipoSolicitud,MANTESOLI_descripcion,MANTESOLI_correlativo) VALUES (
    "IN","LQ","Solicitud interna para muestra medica que actualmente esta en el laboratorio","2022-04-15-5486942356"
),(
    "IN","MM","Solicitud interna para muestra medica que se genero por un cliente en otro departamento","2022-01-01-9873456879"
),(
    "EX","LQ","Solicitud externa de una muestra medica que ha sido generado por ente externo para el laboratorio","2022-02-28-6649321579"
)


// SM- solicitud medica
// ET - examen externo
// FP - factura
// HO - Hoja de oficio

CREATE TABLE tipoSoporte(
    TIPOSOPORTE_id INT PRIMARY KEY AUTO_INCREMENT,
    TIPOSOPORTE_soporte VARCHAR(5) NOT NULL
)

INSERT INTO tipoSoporte (TIPOSOPORTE_soporte) VALUES ("SM"),("ET"),("FP"),("HO")

CREATE TABLE soporteContacto(
    SOPORTECONT_id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    SOPORTECONT_tipoSoporte VARCHAR(5) NOT NULL,
    SOPORTECONT_noSoporte VARCHAR(50) NOT NULL,
    SOPORTECONT_telefono VARCHAR(8) NOT NULL,
    SOPORTECONT_email VARCHAR(100) NOT NULL,
    SOPORTECONT_no
    SOPORTECONT_fechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    SOPORTECONT_fechaModificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

INSERT INTO soporteContacto (SOPORTECONT_tipoSoporte,SOPORTECONT_noSoporte,SOPORTECONT_telefono,SOPORTECONT_email) VALUES (
    "SM","8875564FAFF466","63549325","correo001@mail.com"
),(
    "ET","33554FAEAA22NBNH","49731652","correo002@mail.com"
),(
    "FP","9978653221JHKYUI1554","83115763","correo003@mail.com"
),(
    "HO","ADTYIU21551321FAYJ5","11367758","correo004@mail.com"
)

CREATE TABLE validacionEstado(
    VALIESTADO_id int PRIMARY KEY AUTO_INCREMENT,
    VALIESTADO_estado VARCHAR(20) NOT NULL
)

INSERT INTO validacionEstado(VALIESTADO_estado)VALUES("Creado"),
("Enviado"),("Asignado"),("Analisis"),("Espera"),("Revision"),("Finalizado"),("Rechazado")
CREATE DATABASE IF NOT EXISTS DB_vitacora;

USE DB_vitacora;

############################################################

CREATE TABLE IF NOT EXISTS DB_vitacora.Turnos (
	id_turno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    turno VARCHAR(30),
    fecha_turno DATE NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	id_novedad INT,
    id_tarea INT,
    id_control INT,
    id_tecnico INT
);

############################################################

CREATE TABLE IF NOT EXISTS DB_vitacora.Novedades (
	id_novedad INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(30),
    descripcion VARCHAR(5000),
    id_tipo INT,
    id_estado INT,
    id_tecnico INT
);

CREATE TABLE IF NOT EXISTS DB_vitacora.Tipos_novedades (
	id_tipo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS DB_vitacora.Estados_novedades (
	id_estado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    estado VARCHAR(30)
);

############################################################

CREATE TABLE IF NOT EXISTS DB_vitacora.Tareas (
	id_tarea INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tarea VARCHAR(5000),
    observacion VARCHAR(1000),
    id_tecnico INT,
    id_cumplimiento INT
);

CREATE TABLE IF NOT EXISTS DB_vitacora.Estados_cumplimiento_tarea (
	id_cumplimiento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	cumplimiento TINYINT DEFAULT 0
);

############################################################

CREATE TABLE IF NOT EXISTS DB_vitacora.Tecnicos (
	id_tecnico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    id_estado INT,
    id_tipo INT
);

CREATE TABLE IF NOT EXISTS DB_vitacora.Estados_tecnico (
	id_estado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    estado TINYINT DEFAULT 1
);

CREATE TABLE IF NOT EXISTS DB_vitacora.Tipos_tecnico (
	id_tipo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(30)
);

############################################################

CREATE TABLE IF NOT EXISTS DB_vitacora.Controles_diarios (
	id_control INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_tecnico INT,
    id_control_maquinas INT,
    id_control_herramientas INT
);

CREATE TABLE IF NOT EXISTS DB_vitacora.Control_herramientas (
	id_control_herramientas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fecha_control_herramienta DATE NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    decripcion VARCHAR(50),
    marca VARCHAR(100),
    stock_inicial INT,
    estado VARCHAR(50),
    observacion VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS DB_vitacora.Control_maquinas (
	id_control_maquinas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fecha_control_maquinas DATE NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    id_mfs INT,
    id_bfs INT,
    id_ifs INT,
    id_sacl INT
);

############################################################

CREATE TABLE IF NOT EXISTS DB_vitacora.Mfs (
	id_mfs INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fecha_fuera_de_servicio DATE NOT NULL,
    maquina INT
);

CREATE TABLE IF NOT EXISTS DB_vitacora.Bfs (
	id_bfs INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fecha_fuera_de_servicio DATE NOT NULL,
    maquina INT
);

CREATE TABLE IF NOT EXISTS DB_vitacora.Ifs (
	id_ifs INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fecha_fuera_de_servicio DATE NOT NULL,
    maquina INT
);

############################################################

CREATE TABLE IF NOT EXISTS DB_vitacora.Sacl (
	id_sacl INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    maquina INT,
    id_detalle INT
);

CREATE TABLE IF NOT EXISTS DB_vitacora.Sacl_detalles (
	id_detalle INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	motivo VARCHAR(500),
    accion_implementada VARCHAR(2000)
);

############################################################

ALTER TABLE Turnos
ADD CONSTRAINT fk_turnos_novedades 
FOREIGN KEY (id_novedad)
REFERENCES Novedades (id_novedad);

ALTER TABLE Turnos
ADD CONSTRAINT fk_turnos_tareas 
FOREIGN KEY (id_tarea)
REFERENCES Tareas (id_tarea);

ALTER TABLE Turnos
ADD CONSTRAINT fk_turnos_controlesDiarios 
FOREIGN KEY (id_control)
REFERENCES Controles_diarios (id_control);

ALTER TABLE Turnos
ADD CONSTRAINT fk_turnos_tecnicos 
FOREIGN KEY (id_tecnico)
REFERENCES Tecnicos (id_tecnico);

ALTER TABLE Novedades
ADD CONSTRAINT fk_novedades_tiposNovedades 
FOREIGN KEY (id_tipo)
REFERENCES Tipos_novedades (id_tipo);

ALTER TABLE Novedades
ADD CONSTRAINT fk_novedades_estadosNovedades 
FOREIGN KEY (id_estado)
REFERENCES Estados_novedades (id_estado);

ALTER TABLE Novedades
ADD CONSTRAINT fk_novedades_tecnicos
FOREIGN KEY (id_tecnico)
REFERENCES Tecnicos (id_tecnico);

ALTER TABLE Tareas
ADD CONSTRAINT fk_tareas_tecnicos
FOREIGN KEY (id_tecnico)
REFERENCES Tecnicos (id_tecnico);

ALTER TABLE Tareas
ADD CONSTRAINT fk_tareasEstados_cumplimientoTarea
FOREIGN KEY (id_cumplimiento)
REFERENCES Estados_cumplimiento_tarea (id_cumplimiento);

ALTER TABLE Tecnicos
ADD CONSTRAINT fk_tecnicos_estadosTecnico
FOREIGN KEY (id_estado)
REFERENCES Estados_tecnico(id_estado);

ALTER TABLE Tecnicos
ADD CONSTRAINT fk_tecnicos_tiposTecnico
FOREIGN KEY (id_tipo)
REFERENCES Tipos_tecnico(id_tipo);

ALTER TABLE Controles_diarios
ADD CONSTRAINT fk_controlesDiarios_tecnicos
FOREIGN KEY (id_tecnico)
REFERENCES Tecnicos (id_tecnico);

ALTER TABLE Controles_diarios
ADD CONSTRAINT fk_controlesDiarios_controlHerramientas
FOREIGN KEY (id_control_herramientas)
REFERENCES Control_herramientas(id_control_herramientas);

ALTER TABLE Controles_diarios
ADD CONSTRAINT fk_controlesDiarios_controlMaquinas
FOREIGN KEY (id_control_maquinas)
REFERENCES Control_maquinas(id_control_maquinas);

ALTER TABLE Control_maquinas
ADD CONSTRAINT fk_controlMaquinas_mfs
FOREIGN KEY (id_mfs)
REFERENCES Mfs (id_mfs);

ALTER TABLE Control_maquinas
ADD CONSTRAINT fk_controlMaquinas_bfs
FOREIGN KEY (id_bfs)
REFERENCES Bfs (id_bfs);

ALTER TABLE Control_maquinas
ADD CONSTRAINT fk_controlMaquinas_ifs
FOREIGN KEY (id_ifs)
REFERENCES Ifs (id_ifs);

ALTER TABLE Control_maquinas
ADD CONSTRAINT fk_controlMaquinas_sacl
FOREIGN KEY (id_sacl)
REFERENCES Sacl (id_sacl);

ALTER TABLE Sacl
ADD CONSTRAINT fk_sacl_saclDetalles
FOREIGN KEY (id_detalle)
REFERENCES Sacl_detalles (id_detalle);
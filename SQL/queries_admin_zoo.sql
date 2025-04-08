CREATE DATABASE admin_zoo

USE admin_zoo

CREATE TABLE zoologico(
    id_zoologico INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    nombre VARCHAR(75) NOT NULL,
    direccion VARCHAR(125) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    anio_fundacion INT NOT NULL,
    estado TINYINT DEFAULT 1
)

CREATE TABLE persona(
    id_persona INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    numero_identificacion DECIMAL(13,0) NOT NULL UNIQUE,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    direccion VARCHAR(125) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    fecha_inicio_labores DATE NOT NULL,
    horario_laboral VARCHAR(18) NOT NULL,
    salario DECIMAL(18,2) NOT NULL,
)

CREATE TABLE cuidador(
    id_cuidador INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    id_zoologico INT NOT NULL,
    id_persona INT NOT NULL,
    fecha_encargo_especie DATE NOT NULL,
    estado TINYINT DEFAULT 1,
    FOREIGN KEY(id_zoologico) REFERENCES zoologico(id_zoologico),
    FOREIGN KEY(id_persona) REFERENCES persona(id_persona)
)

create table guia (
    id_guia int not null PRIMARY KEY IDENTITY(1,1),
    id_zoologico int not null,
    id_persona int not null,
    estado TINYINT DEFAULT 1,
    FOREIGN KEY(id_zoologico) references zoologico(id_zoologico),
    foreign key(id_persona) references persona(id_persona)
)

create table horario_zoologico(
    id_horario int not null primary key IDENTITY(1,1),
    id_zoologico int not null,
    horario varchar(20) not null,
    estado TINYINT default 1,
    FOREIGN key(id_zoologico) references zoologico(id_zoologico)
)

create table especie(
    id_especie int not null primary key IDENTITY(1,1),
    nombre_es varchar(30) not null,
    nombre_cientifico varchar(50) not null,
    riesgo_extincion TINYINT default 1,
)

create table especie_zoologico(
    id_especie_zoologico int not null primary key IDENTITY(1,1),
    id_especie int not null,
    id_zoologico int not null,
    cantidad int not null,
    foreign key(id_especie) references especie(id_especie),
    foreign key(id_zoologico) references zoologico(id_zoologico)
)

create table alimento(
    id_alimento int not null primary key IDENTITY(1,1),
    nombre_alimento varchar(40) not null,
)

create table especie_alimento(
    id_especie_alimento int not null primary key IDENTITY(1,1),
    id_especie int not null,
    id_alimento int not null,
    foreign key(id_especie) references especie(id_especie),
    foreign key(id_alimento) references alimento(id_alimento)
)

create table cuidador_especie(
    id_cuidador_especie int not null primary key IDENTITY(1,1),
    id_cuidador int not null,
    id_especie int not null,
    FOREIGN key(id_cuidador) references cuidador(id_cuidador),
    FOREIGN key(id_especie) REFERENCES especie(id_especie)
)

create table itinerario(
    id_itinerario int not null primary KEY IDENTITY(1,1),
    nombre_itinerario varchar(25) not null,
    duracion_tiempo_min int not null,
    longitud_itinerario int not null,
    maximo_visitantes int not null,
    horario_itinerario varchar(50) not null,
)

create table itinerario_especie(
    id_itinerario_especie int not null PRIMARY key IDENTITY(1,1),
    id_especie int not null,
    id_itinerario int not null,
    FOREIGN key(id_especie) REFERENCES especie(id_especie),
    FOREIGN key(id_itinerario) REFERENCES itinerario(id_itinerario)
)

create table zona(
    id_zona int not null primary key IDENTITY(1,1),
    nombre varchar(25) not null,
    descripcion varchar(125) not null,
    extension_territorial int not null,
    estado TINYINT default 1,
)

create table zona_especie(
    id_zona_especie int not null primary key IDENTITY(1,1),
    id_especie int not null,
    id_zona int not null
    foreign key(id_especie) references especie(id_especie),
    foreign key(id_zona) references zona(id_zona)
)

create table habitat(
    id_habitat int not null primary key IDENTITY(1,1),
    nombre varchar(40) not null,
    estado TINYINT default 1
)

create table habitat_especie(
    id_habitat_especie int not null primary key IDENTITY(1,1),
    id_habitat int not null,
    id_especie int not null,
    foreign key(id_habitat) references habitat(id_habitat),
    foreign key(id_especie) references especie(id_especie)
)

create table itinerario_guia(
    id_itinerario_guia int not null primary key IDENTITY(1,1),
    id_itinerario int not null,
    id_guia int not null,
    FOREIGN key(id_itinerario) REFERENCES itinerario(id_itinerario),
    FOREIGN key(id_guia) REFERENCES guia(id_guia)
)

create table itinerario_zona(
    id_itinerario_zona int not null primary key IDENTITY(1,1),
    id_itinerario int not null,
    id_zona int not null,
    FOREIGN key(id_itinerario) references itinerario(id_itinerario),
    foreign key(id_zona) references zona(id_zona)
)

create table continente(
    id_contiente int not null primary key IDENTITY(1,1),
    descripcion varchar(30) not null 
)

create table clima(
    id_clima int not null primary key IDENTITY(1,1),
    descripcion varchar(30) not null 
)

create table continente_habitat(
    id_continente_habitat int not null primary key IDENTITY(1,1),
    id_habitat int not null,
    id_continente int not null,
    FOREIGN key(id_habitat) references habitat(id_habitat),
    FOREIGN key(id_continente) references continente(id_contiente)
)

create table clima_habitat(
    id_clima_habitat int not null primary key IDENTITY(1,1),
    id_habitat int not null,
    id_clima int not null,
    FOREIGN key(id_habitat) references habitat(id_habitat),
    FOREIGN key(id_clima) references clima(id_clima)
)

create table tipo_vegetacion(
    id_tipo_vegetacion int not null primary key IDENTITY(1,1),
    descripcion varchar(45) not null 
)

create table vegetacion_habitat(
    id_vegetacion_habitat int not null primary key IDENTITY(1,1),
    id_habitat int not null,
    id_tipo_vegetacion int not null,
    FOREIGN key(id_habitat) references habitat(id_habitat),
    FOREIGN key(id_tipo_vegetacion) references tipo_vegetacion(id_tipo_vegetacion)
)

create table persona_telefono(
    id_persona_telefono int not null primary key IDENTITY(1,1),
    id_persona int not null,
    numero_telefono varchar(15),
    es_corporativo TINYINT default 1,
    FOREIGN key(id_persona) references persona(id_persona)
)


-- Ingresar datos en la tabla 'zoologico'
INSERT INTO zoologico (nombre, direccion, telefono, anio_fundacion) 
VALUES
    ('Zoológico la Aurora', 'Finca la Aurora Zona 13, Guatemala', '2463-0463', 0),
    ('Auto Safari Chapin', 'Km 87.5, Carretera a Taxisco,Guatemala', '2244-7400', 0);

-- Ingresar datos en la tabla 'horario_zoologico'
INSERT INTO horario_zoologico (id_zoologico, horario) 
VALUES
    (1, 'lunes - cerrado'),
    (1, 'martes - cerrado'),
    (1, 'miércoles - cerrado'),
    (1, 'jueves: 8:30 - 17:30'),
    (1, 'viernes: 8:30 - 17:30'),
    (1, 'sábado: 8:30 - 17:30'),
    (1, 'domingo: 8:30 - 16:00'),
    (2, 'lunes - cerrado'),
    (2, 'martes: 9:00 - 16:00'),
    (2, 'Miercoles: 9:00 - 16:00'),
    (2, 'Jueves: 9:00 - 16:00'),
    (2, 'Viernes: 9:00 - 16:00'),
    (2, 'Sábado: 9:00 - 16:00'),
    (2, 'Domingo: 9:00 - 16:00');

-- Ingresar datos en la tabla 'especie'
INSERT INTO especie (nombre_es, nombre_cientifico, riesgo_extincion) 
VALUES
    ('oso negro americano', 'ursus americanus', 0),
    ('Conejo', 'Oryctolagus cuniculus', 0),
    ('León Africano', 'Panthera leo', 0),
    ('Serpiente de Cascabel', 'Crotalus', 0),
    ('Elefante Africano', 'Laxodonta africana', 0),
    ('Jaguar', 'Panthera onca', 0),
    ('Chimpancé', 'Pan troglodytes', 0),
    ('Suricata', 'Suricata suricatta', 0),
    ('Loro Frente Roja', 'Amazona viridigenalis', 0);

-- Ingresar datos en la tabla 'especie_zoologico'
INSERT INTO especie_zoologico (id_especie, id_zoologico, cantidad) 
VALUES
    (1, 1, 0),
    (2, 1, 0),
    (3, 1, 0),
    (4, 1, 0),
    (5, 1, 0),
    (6, 1, 0),
    (7, 1, 0),
    (8, 1, 0),
    (9, 1, 0),
    (1, 2, 0),
    (2, 2, 0),
    (3, 2, 0),
    (4, 2, 0),
    (5, 2, 0),
    (6, 2, 0),
    (7, 2, 0),
    (8, 2, 0),
    (9, 2, 0);

-- Ingresar datos en la tabla 'alimento'
INSERT INTO alimento (nombre_alimento) 
VALUES
    ('Frutas'),
    ('Bayas'),
    ('Nueces'),
    ('Hierbas'),
    ('Semillas'),
    ('Corteza'),
    ('Hojas y Ramas'),
    ('Insectos'),
    ('Roedores'),
    ('Vegetales'),
    ('Árboles'),
    ('Peces'),
    ('Carroña'),
    ('Reptiles');

-- Ingresar datos en la tabla 'especie_alimento'
INSERT INTO especie_alimento (id_especie, id_alimento) 
VALUES
    (1, 9),
    (2, 8),
    (3, 1),
    (4, 14),
    (5, 11),
    (6, 10),
    (7, 12),
    (8, 2),
    (9, 7);
    
-- Ingresar datos en la tabla 'persona'
INSERT INTO persona (numero_identificacion, nombre, apellido, direccion, fecha_nacimiento, fecha_inicio_labores, horario_laboral, salario) 
VALUES
    (40638106316, 'Javier', 'Alvarez', 'Zona 18, Guatemala', '1900-01-01', '1900-01-01', '8:00 - 16:00', 0),
    (394884821811, 'Felipe', 'Barrios', 'Zona 25, Guatemala', '1900-01-01', '1900-01-01', '8:00 - 16:00', 0),
    (13760393735, 'Norman', 'Cardona', 'Zona 8, Guatemala', '1900-01-01', '1900-01-01', '8:00 - 16:00', 0),
    (25055325156, 'Oscar', 'Dominguez', 'Zona 11, Guatemala', '1900-01-01', '1900-01-01', '8:00 - 16:00', 0),
    (25438967812, 'María', 'Esteban', 'Zona 12, Guatemala', '1900-01-01', '1900-01-01', '8:00 - 16:00', 0),
    (272060291020, 'Felicia', 'Fernandez', 'Zona 9, Guatemala', '1900-01-01', '1900-01-01', '8:00 - 16:00', 0),
    (12305282126, 'Amilcar', 'Galicia', 'Zona 3, Guatemala', '1900-01-01', '1900-01-01', '8:00 - 16:00', 0),
    (31274896611, 'Boris', 'Hernandez', 'Zona 12, Guatemala', '1900-01-01', '1900-01-01', '8:00 - 16:00', 0),
    (2547640671, 'Carlos', 'Ibarra', 'Zona 5, Guatemala', '1900-01-01', '1900-01-01', '8:00 - 16:00', 0),
    (329460682024, 'Dionisio', 'Ibañez', 'Zona 14, Guatemala', '1900-01-01', '1900-01-01', '8:00 - 16:00', 0),
    (372612831925, 'Ernesto', 'Juarez', 'Zona 11, Guatemala', '1900-01-01', '1900-01-01', '8:00 - 16:00', 0),
    (245671581515, 'Felix', 'Jerez', 'Zona 3, Guatemala', '1900-01-01', '1900-01-01', '8:00 - 16:00', 0),
    (274635201233, 'Gabriela', 'Muñoz', 'Zona 19, Guatemala', '1900-01-01', '1900-01-01', '8:00 - 16:00', 0),
    (35030196528, 'Hector', 'Melgar', 'Zona 8, Guatemala', '1900-01-01', '1900-01-01', '8:00 - 16:00', 0),
    (214797971632, 'Ignacio', 'Perez', 'Zona 14, Guatemala', '1900-01-01', '1900-01-01', '8:00 - 16:00', 0);

-- Ingresar datos en la tabla 'persona_telefono'
INSERT INTO persona_telefono (id_persona, numero_telefono, es_corporativo) 
VALUES
    (1, '5836-7352', 1),
    (2, '6858-7801', 1),
    (3, '6938-6600', 1),
    (4, '6972-6133', 1),
    (5, '5133-4481', 1),
    (6, '8157-3186', 1),
    (7, '6478-8966', 1),
    (8, '8030-8030', 1),
    (9, '7427-7488', 1),
    (10, '7819-7396', 1),
    (11, '8906-3533', 1),
    (12, '5038-3694', 1),
    (13, '7877-4292', 1),
    (14, '6020-4467', 1),
    (15, '5610-4782', 1);

-- Ingresar datos en la tabla 'persona_telefono'
INSERT INTO persona_telefono (id_persona, numero_telefono, es_corporativo) 
VALUES
    (1, '5836-7352', 0),
    (2, '6858-7801', 0),
    (3, '6938-6600', 0),
    (4, '6972-6133', 0),
    (5, '5133-4481', 0),
    (6, '8157-3186', 0),
    (7, '6478-8966', 0),
    (8, '8030-8030', 0),
    (9, '7427-7488', 0),
    (10, '2547640671', 0),
    (11, '329460682024', 0),
    (12, '372612831925', 0),
    (13, '245671581515', 0),
    (14, '274635201233', 0),
    (15, '35030196528', 0),
    (16, '214797971632', 0);

-- Ingresar datos en la tabla 'guia'
INSERT INTO guia (id_zoologico, id_persona, estado) 
VALUES
    (1, 1, 0),
    (1, 2, 0),
    (1, 3, 0),
    (1, 4, 0),
    (1, 5, 0),
    (1, 6, 0),
    (2, 7, 0),
    (2, 8, 0),
    (2, 9, 0),
    (2, 10, 0),
    (2, 11, 0),
    (2, 12, 0),
    (2, 13, 0),
    (2, 14, 0),
    (2, 15, 0);

-- Ingresar datos en la tabla 'cuidador'
INSERT INTO cuidador (id_zoologico, id_persona, fecha_encargo_especie, estado) 
VALUES
    (1, 1, '1900-01-01', 0),
    (1, 2, '1900-01-01', 0),
    (1, 3, '1900-01-01', 0),
    (1, 4, '1900-01-01', 0),
    (1, 5, '1900-01-01', 0),
    (1, 6, '1900-01-01', 0),
    (2, 7, '1900-01-01', 0),
    (2, 8, '1900-01-01', 0),
    (2, 9, '1900-01-01', 0),
    (2, 10, '1900-01-01', 0),
    (2, 11, '1900-01-01', 0),
    (2, 12, '1900-01-01', 0),
    (2, 13, '1900-01-01', 0),
    (2, 14, '1900-01-01', 0),
    (2, 15, '1900-01-01', 0);

-- Ingresar datos en la tabla 'cuidador_especie'
INSERT INTO cuidador_especie (id_cuidador, id_especie) 
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 1),
    (11, 2),
    (12, 3),
    (13, 4),
    (14, 5),
    (15, 6);

-- Ingresar datos en la tabla 'itinerario'
INSERT INTO itinerario (nombre_itinerario, duracion_tiempo_min, longitud_itinerario, maximo_visitantes, horario_itinerario) 
VALUES
    ('Itinerario 1', 77, 1192, 0, '9:00 hrs; 13:00 hrs'),
    ('Itinerario 2', 90, 1248, 0, '10:00 hrs; 15:00 hrs'),
    ('Itinerario 3', 66, 1285, 0, '10:00 hrs; 13:00 hrs'),
    ('Itinerario 4', 67, 1382, 0, '9:00 hrs; 14:00 hrs'),
    ('Itinerario 5', 76, 1193, 0, '12:00 hrs; 15:00 hrs'),
    ('Itinerario 6', 81, 1420, 0, '12:00 hrs; 15:00 hrs'),
    ('Itinerario 7', 89, 1323, 0, '11:00 hrs; 14:00 hrs');

-- Ingresar datos en la tabla 'itinerario_especie'
INSERT INTO itinerario_especie (id_especie, id_itinerario)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 1),
    (9, 2),
    (10, 3),
    (11, 4),
    (12, 5),
    (13, 6),
    (14, 7);

-- Ingresar datos en la tabla 'zonas'
INSERT INTO zona (nombre, descripcion, extension_territorial, estado)
VALUES
    ('Sabana Africana', 'Sabana Africana', 0, 1),
    ('Animales de Asia', 'Asia animales de Asia', 0, 1),
    ('Animales de América', 'Terra América', 0, 1),
    ('Animales Desérticos', 'Reino Khan animales deserticos', 0, 1),
    ('Animales Acuáticos', 'Acuario animales acuáticos', 0, 1),
    ('Animales Domésticos', 'Granjita animales domésticos', 0, 1),
    ('Animales Exóticos', 'Oceania animales exóticos', 0, 1),
    ('Aves', 'Aviario aves', 0, 1),
    ('Plantas Clima', 'Botánico plantas clima', 0, 1);

-- Ingresar datos en la tabla 'zonas_especie'
INSERT INTO zona_especie (id_especie, id_zona)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 1),
    (11, 2),
    (12, 3),
    (13, 4),
    (14, 5),
    (15, 6);

-- Ingresar datos en la tabla 'continente'
INSERT INTO continente (descripcion)
VALUES
    ('Boreal'),
    ('Tropical'),
    ('Subtropical'),
    ('Frio'),
    ('Seco'),
    ('Cálido'),
    ('Húmedo'),
    ('Monzónico'),
    ('Ventoso');

-- Ingresar datos en la tabla 'clima'
INSERT INTO clima (descripcion)
VALUES
    ('Templado'),
    ('África'),
    ('Asia'),
    ('Europa'),
    ('América'),
    ('Europa'),
    ('Frio'),
    ('África'),
    ('Asia'),
    ('Oceania'),
    ('Húmedo'),
    ('Monzónico'),
    ('Ventoso');

-- Ingresar datos en la tabla 'habitat'
INSERT INTO habitat (nombre)
VALUES
    ('Bosque'),
    ('Desierto'),
    ('Pradera'),
    ('Sabana'),
    ('Sabana Tropical'),
    ('Selva Tropical'),
    ('Selva Templada'),
    ('Tundras'),
    ('Manglares');

-- Ingresar datos en la tabla 'continente_habitat'
INSERT INTO continente_habitat (id_habitat, id_continente)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9);

-- Ingresar datos en la tabla 'clima_habitat'
INSERT INTO clima_habitat (id_habitat, id_clima)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9);

-- Ingresar datos en la tabla 'habitat_especie'
INSERT INTO habitat_especie (id_habitat, id_especie)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9);

-- Ingresar datos en la tabla 'itinerario_guia'
INSERT INTO itinerario_guia (id_itinerario, id_guia)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9);

-- Ingresar datos en la tabla 'itinerario_zona'
INSERT INTO itinerario_zona (id_itinerario, id_zona)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7);

-- Ingresar datos en la tabla 'tipo_vegetacion'
INSERT INTO tipo_vegetacion (descripcion)
VALUES
    ('Árboles frondosos'),
    ('Cactus'),
    ('Matorrales'),
    ('Pastos'),
    ('Juncos'),
    ('Flores'),
    ('Árbol de Mangle'),
    ('Robles'),
    ('Arces'),
    ('Hayas'),
    ('Amapola'),
    ('Bayas'),
    ('Hierbas');

-- Ingresar datos en la tabla 'vegetacion_habitat'
INSERT INTO vegetacion_habitat (id_habitat, id_tipo_vegetacion)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13);


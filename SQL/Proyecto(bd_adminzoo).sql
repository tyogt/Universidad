CREATE DATABASE bd_zoo
GO

USE bd_zoo
GO

CREATE TABLE cargo(
    id_cargo INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
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
    tipo_persona VARCHAR(20) NOT NULL,
    telefono VARCHAR(15),
    es_telefono_corporativo TINYINT DEFAULT 0,
    id_cargo INT NOT NULL,
    FOREIGN KEY(id_cargo) REFERENCES cargo(id_cargo)
)

CREATE TABLE especie(
    id_especie INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    nombre_es VARCHAR(30) NOT NULL,
    nombre_cientifico VARCHAR(50) NOT NULL,
    riesgo_extincion TINYINT DEFAULT 1,
    categoria_taxonomica VARCHAR(50) NOT NULL,
    cantidad INT NOT NULL,
    fecha_registro DATE NOT NULL,
    descripcion VARCHAR(200)
)

CREATE TABLE persona_especie(
    id_persona_especie INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    id_persona INT NOT NULL,
    id_especie INT NOT NULL,
    fecha_asignacion DATE,
    FOREIGN KEY(id_persona) REFERENCES persona(id_persona),
    FOREIGN KEY(id_especie) REFERENCES especie(id_especie)
)

CREATE TABLE alimento(
    id_alimento INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    nombre_alimento VARCHAR(40) NOT NULL,
    tipo_alimento VARCHAR(30) NOT NULL,
    descripcion VARCHAR(200)
)

CREATE TABLE especie_alimento(
    id_especie_alimento INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    id_especie INT NOT NULL,
    id_alimento INT NOT NULL,
    cantidad_diaria DECIMAL(10,2) NOT NULL,
    horario_alimentacion VARCHAR(50),
    FOREIGN KEY(id_especie) REFERENCES especie(id_especie),
    FOREIGN KEY(id_alimento) REFERENCES alimento(id_alimento)
)

CREATE TABLE habitat(
    id_habitat INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(40) NOT NULL,
    estado TINYINT DEFAULT 1,
    descripcion VARCHAR(200),
    ubicacion VARCHAR(100),
    clima VARCHAR(50),
    tipo_vegetacion VARCHAR(50)
)

CREATE TABLE habitat_especie(
    id_habitat_especie INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    id_habitat INT NOT NULL,
    id_especie INT NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY(id_habitat) REFERENCES habitat(id_habitat),
    FOREIGN KEY(id_especie) REFERENCES especie(id_especie)
)

CREATE TABLE zona(
    id_zona INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200),
    ubicacion VARCHAR(100)
)

CREATE TABLE zona_habitat(
    id_zona_habitat INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    id_zona INT NOT NULL,
    id_habitat INT NOT NULL,
    FOREIGN KEY(id_zona) REFERENCES zona(id_zona),
    FOREIGN KEY(id_habitat) REFERENCES habitat(id_habitat)
)

CREATE TABLE itinerario(
    id_itinerario INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200),
    duracion INT,
    horario VARCHAR(50)
)

CREATE TABLE itinerario_zona(
    id_itinerario_zona INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    id_itinerario INT NOT NULL,
    id_zona INT NOT NULL,
    FOREIGN KEY(id_itinerario) REFERENCES itinerario(id_itinerario),
    FOREIGN KEY(id_zona) REFERENCES zona(id_zona)
)
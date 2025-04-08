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

INSERT INTO zoologico(nombre, direccion, telefono, anio_fundacion)VALUES('Zoológico la Aurora','Finca la Aurora Zona 13, Guatemala','+502 2463-0463',1924)INSERT INTO zoologico(direccion, nombre, anio_fundacion, telefono)VALUES('Km 87.5, Carretera a Taxico,Guatemala','Auto Safari Chapin',1987,'+502 2244-7400')UPDATE dbo.zoologicoSET direccion = 'Km 87.5, Carretera a Taxisco,Guatemala'WHERE id_zoologico = 3DELETE FROM dbo.zoologico WHERE id_zoologico = 4-- ALTER TABLE ALTER COLUMNALTER TABLE dbo.horario_zoologicoALTER COLUMN horario VARCHAR(50)-- INSERT MULTIPLE
INSERT INTO dbo.horario_zoologico(id_zoologico, horario)VALUES(1, 'Miercoles: 9:00 - 16:00'),(1, 'Jueves: 9:00 - 16:00'),(1, 'Viernes: 9:00 - 16:00'),(1, 'Sábado: 9:00 - 16:00'),(1, 'Domingo: 9:00 - 16:00')
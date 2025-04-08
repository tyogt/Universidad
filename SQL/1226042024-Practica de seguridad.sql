-- Crear base de datos
CREATE DATABASE Practica_seguridad_1

USE Practica_seguridad_1
GO

-- Crear tabla empleados_morales
CREATE TABLE empleados_morales(
id_empleado INT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
departamento VARCHAR(50) NOT NULL,
salario DECIMAL(10, 2) NOT NULL
);

-- Crear tabla proyectos_morales
CREATE TABLE proyectos_morales(
id_proyectos INT IDENTITY (1,1) PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
fecha_inicio DATE NOT NULL,
fecha_fin DATE NOT NULL
);

-- Crear tabla clientes_morales
CREATE TABLE clientes_morales(
id_clientes INT IDENTITY (1,1) PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
telefono VARCHAR(20) NOT NULL,
nit INT NOT NULL
);

-- Crear tabla ventas_morales
CREATE TABLE ventas_morales(
id_ventas INT IDENTITY (1,1) PRIMARY KEY,
cliente_id INT NOT NULL,
producto VARCHAR(100) NOT NULL,
cantidad INT NOT NULL,
fecha DATE NOT NULL,
FOREIGN KEY (cliente_id) REFERENCES clientes_morales(id_clientes)
);

-- Insertar datos en la tabla empleados_morales
INSERT INTO empleados_morales (nombre, departamento, salario)
VALUES
    ('Juan Pérez', 'Ventas', 2500.00),
    ('María Gómez', 'Marketing', 3000.00),
    ('Pedro Rodríguez', 'Desarrollo', 3500.00),
    ('Laura Torres', 'Recursos Humanos', 2800.00),
    ('Carlos Hernández', 'Finanzas', 4000.00);

-- Insertar datos en la tabla proyectos_morales
INSERT INTO proyectos_morales (nombre, fecha_inicio, fecha_fin)
VALUES
    ('Proyecto A', '2023-01-01', '2023-06-30'),
    ('Proyecto B', '2023-02-15', '2023-08-31'),
    ('Proyecto C', '2023-03-10', '2023-09-30'),
    ('Proyecto D', '2023-04-01', '2023-11-30'),
    ('Proyecto E', '2023-05-01', '2023-12-31');

-- Insertar datos en la tabla clientes_morales
INSERT INTO clientes_morales (nombre, email, telefono, nit)
VALUES
    ('Cliente 1', 'cliente1@example.com', '123456789', 1234),
    ('Cliente 2', 'cliente2@example.com', '987654321', 2345),
    ('Cliente 3', 'cliente3@example.com', '456789123', 3456),
    ('Cliente 4', 'cliente4@example.com', '789123456', 4567),
    ('Cliente 5', 'cliente5@example.com', '321654987', 5678);

-- Insertar datos en la tabla ventas_morales
INSERT INTO ventas_morales (cliente_id, producto, cantidad, fecha)
VALUES
    (1, 'Producto A', 10, '2023-05-01'),
    (2, 'Producto B', 5, '2023-05-02'),
    (3, 'Producto C', 8, '2023-05-03'),
    (4, 'Producto D', 12, '2023-05-04'),
    (5, 'Producto E', 6, '2023-05-05');

select * from proyectos_morales

-- login con acceso de SELECT e INSERT a las tablas Empleados y Proyectos
CREATE LOGIN login2 WITH PASSWORD = 'seguridad.insert';
CREATE USER usuario2 FOR LOGIN login2;
GRANT SELECT, INSERT ON empleados_morales TO usuario2;
GRANT SELECT, INSERT ON proyectos_morales TO usuario2;


-- ogin con acceso de SELECT y DELETE a las tablas Clientes y Ventas
CREATE LOGIN login4 WITH PASSWORD = 'seguridad.delete';
CREATE USER usuario4 FOR LOGIN login4;
GRANT SELECT, DELETE ON clientes_morales TO usuario4;
GRANT SELECT, DELETE ON ventas_morales TO usuario4;


-- Ingresar al login2
EXECUTE AS LOGIN = 'login2';

-- Verificar usuario actual
SELECT SYSTEM_USER;

-- Ejecutar consultas y comandos con los permisos de login2
SELECT * FROM empleados_morales;
SELECT * FROM proyectos_morales;

INSERT INTO empleados_morales (nombre, departamento, salario)
VALUES
    ('Juan Hernández', 'Desarrollo', 4500.00);

INSERT INTO proyectos_morales (nombre, fecha_inicio, fecha_fin)
VALUES
    ('Proyecto F', '2023-06-01', '2023-11-30');

-- Verificar permisos de login2
SELECT * FROM clientes_morales;
DELETE FROM ventas_morales WHERE id_ventas = 1;

-- Volver a la identidad original
REVERT;


-- Ingresar al login4
EXECUTE AS LOGIN = 'login4';

-- Verificar identidad actual
SELECT SYSTEM_USER;

-- Permisos de login4
DELETE FROM clientes_morales WHERE id_clientes = 5;
DELETE FROM ventas_morales WHERE id_ventas = 5;

SELECT * FROM clientes_morales;
SELECT * FROM ventas_morales;

-- Verificar permisos de login4
SELECT * FROM proyectos_morales;
DELETE FROM empleados_morales WHERE id_empleado = 1;

-- Volver a la identidad original
REVERT;
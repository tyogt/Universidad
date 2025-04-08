CREATE DATABASE BD_DannyMorales;

USE BD_DannyMorales;

-- Crear tabla Verduras
CREATE TABLE Verduras (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50)
);

-- Insertar datos en la tabla Verduras
INSERT INTO Verduras (ID, Nombre) VALUES 
(1, 'Zanahoria'),
(2, 'Lechuga'),
(3, 'Tomate'),
(4, 'Brócoli'),
(5, 'Pimiento');

-- Crear tabla Frutas
CREATE TABLE Frutas (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50)
);

-- Insertar datos en la tabla Frutas
INSERT INTO Frutas (ID, Nombre) VALUES 
(1, 'Manzana'),
(2, 'Banana'),
(3, 'Naranja'),
(4, 'Uva'),
(5, 'Pera');


-- Crear tabla adicional Carnes
CREATE TABLE Carnes (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50)
);

-- Insertar datos en la tabla adicional Carnes
INSERT INTO Carnes (ID, Nombre) VALUES 
(1, 'Res'),
(2, 'Pollo'),
(3, 'Pescado'),
(4, 'Cerdo'),
(5, 'Cordero');

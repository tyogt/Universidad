CREATE DATABASE DW_Zoologico;
GO

USE DW_Zoologico;
GO

-- Tablas de dimensiones
CREATE TABLE Dim_Tipo_Entrada (
    id_tipo_entrada INT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion VARCHAR(200),
    precio DECIMAL(10,2)
);

CREATE TABLE Dim_Fecha (
    id_fecha INT PRIMARY KEY,
    fecha DATE,
    dia INT,
    mes INT,
    anio INT
);

CREATE TABLE Dim_Zona (
    id_zona INT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion VARCHAR(200),
    ubicacion VARCHAR(100)
);

CREATE TABLE Dim_Categoria_Gasto (
    id_categoria_gasto INT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion VARCHAR(200)
);

-- Tablas de hechos
CREATE TABLE Fact_Ventas (
    id_venta INT PRIMARY KEY,
    id_tipo_entrada INT,
    id_fecha INT,
    id_zona INT,
    cantidad INT,
    total_venta DECIMAL(10,2),
    FOREIGN KEY (id_tipo_entrada) REFERENCES Dim_Tipo_Entrada(id_tipo_entrada),
    FOREIGN KEY (id_fecha) REFERENCES Dim_Fecha(id_fecha),
    FOREIGN KEY (id_zona) REFERENCES Dim_Zona(id_zona)
);

CREATE TABLE Fact_Gastos (
    id_gasto INT PRIMARY KEY,
    id_categoria_gasto INT,
    id_fecha INT,
    monto DECIMAL(10,2),
    FOREIGN KEY (id_categoria_gasto) REFERENCES Dim_Categoria_Gasto(id_categoria_gasto),
    FOREIGN KEY (id_fecha) REFERENCES Dim_Fecha(id_fecha)
);
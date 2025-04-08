CREATE DATABASE bd_banco;

USE bd_banco;

CREATE TABLE clientes (
id_cliente INT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellidos VARCHAR(50) NOT NULL,
fecha_nacimiento DATE NOT NULL,
direccion VARCHAR(100) NOT NULL,
telefono VARCHAR(20) NOT NULL
);

CREATE TABLE cuentas (
id_cuenta INT IDENTITY(1,1) PRIMARY KEY,
id_cliente INT NOT NULL,
num_cuenta VARCHAR(20) NOT NULL,
tipo_cuenta VARCHAR(20) NOT NULL,
fecha_apertura DATE NOT NULL,
FOREIGN KEY (id_cliente)
REFERENCES clientes(id_cliente)
);

CREATE TABLE saldos (
id_saldo INT IDENTITY(1,1) PRIMARY KEY,
id_cuenta INT NOT NULL,
fecha DATE NOT NULL,
saldo DECIMAL(10,2) NOT NULL,
FOREIGN KEY (id_cuenta)
REFERENCES cuentas(id_cuenta)
);

CREATE TABLE sucursales (
id_sucursal INT IDENTITY(1,1) PRIMARY KEY,
direccion VARCHAR(100) NOT NULL
);

CREATE TABLE empleados (
id_empleado INT IDENTITY(1,1) PRIMARY KEY,
id_sucursal INT NOT NULL,
nombre VARCHAR(50) NOT NULL,
apellidos VARCHAR(50) NOT NULL,
puesto VARCHAR(50) NOT NULL,
FOREIGN KEY (id_sucursal)
REFERENCES sucursales(id_sucursal)
);

CREATE TABLE transacciones(
id_transaccion INT IDENTITY(1,1) PRIMARY KEY,
id_cuenta INT NOT NULL,
id_cuenta_destino INT NULL, 
id_empleado INT NOT NULL,   
fecha DATE NOT NULL,
tipo VARCHAR(20) NOT NULL,
cantidad DECIMAL(10,2) NOT NULL,
FOREIGN KEY (id_cuenta)  
REFERENCES cuentas(id_cuenta),
FOREIGN KEY (id_empleado)
REFERENCES empleados(id_empleado)
);

INSERT INTO sucursales (direccion)
VALUES
  ('5ta Avenida 4-10, Ciudad de Guatemala'),
  ('Diagonal 6 13-01, Zona 10'),
  ('2da Calle 5-80, zona 1');

INSERT INTO empleados (id_sucursal, nombre, apellidos, puesto)  
VALUES
  (1, 'Juan', 'Pérez', 'Gerente'),
  (1, 'Maria', 'Gonzalez','Cajero'),
  (2, 'Pedro', 'García', 'Asesor'),
  (3, 'Ana', 'Hernandez', 'Gerente');  

INSERT INTO clientes (nombre, apellidos, fecha_nacimiento, direccion, telefono)
VALUES
  ('Luis', 'López','1980-05-06','4ta Ave 15-45, Zona 3', 55558888),
  ('María', 'Martínez','1992-02-04', '2da Calle 2-22, Zona 4', 55558989),  
  ('José', 'Ramírez','1975-09-19','3ra Ave 12-32, Mixco', 55512233),
  ('Ana', 'García','1960-04-08','9na Calle 10-32, Zona 1', 55158877),
  ('Pablo', 'Muñoz','1999-10-28','2da Ave 8-15, Zona 4', 99887766), 
  ('Claudia','Pérez','1977-03-05','1ra Calle 12-32, Mixco', 22554433),
  ('Jorge','Morales','1987-07-15','5ta Calle 9-30, Zona 9', 11225888),
  ('Mónica','Cruz','1979-09-19','6ta Ave 17-10, Zona 4', 11332277),
  ('Edgar','Hernandez','1985-12-06','4ta Calle 12-45, Zona 3', 55441122),
  ('Marta','Ruiz','1991-02-01','4ta Calle 15-22, Zona 1', 77553399);  

INSERT INTO cuentas(id_cliente, num_cuenta, tipo_cuenta, fecha_apertura)
VALUES
  (1,'019283765','Ahorro','2017-05-29'),
  (2,'102938476','Monetaria','2022-01-05'),
  (3,'283657245','Ahorro','2018-03-15'), 
  (4,'736251438','Monetaria','2018-11-03'),
  (5,'643827119','Monetaria','2020-09-18'),
  (6,'874261357','Ahorro','2015-05-06'),
  (7,'963187256','Monetaria','2021-03-21'),
  (8,'719364832','Ahorro','2016-01-22'),
  (9,'328174619','Monetaria','2018-02-11'),
  (10,'192183736','Ahorro','2019-11-24');

INSERT INTO saldos(id_cuenta, fecha, saldo)
VALUES
  (1,'2023-02-16', 8250.25),  
  (2,'2023-02-16', 12556.80),
  (3,'2023-02-16', 8450.15),
  (4,'2023-02-16', 6587.50),
  (5,'2023-02-16', 35892.80),
  (6,'2023-02-16', 22331.65),
  (7,'2023-02-16', 19438.74),
  (8,'2023-02-16', 38229.90), 
  (9,'2023-02-16', 12268.85),
  (10,'2023-02-16', 48338.15)
;

INSERT INTO transacciones(id_cuenta, id_cuenta_destino, id_empleado, fecha, tipo, cantidad )  
VALUES  
  (1, NULL, 1, '2023-02-16', 'Depósito', 500),
  (2, NULL, 1, '2023-02-16', 'Retiro', 800),
  (3, NULL, 2, '2023-02-17', 'Depósito', 1500), 
  (4, NULL, 3, '2023-02-17', 'Pago Tarjeta', 2000),
  (5, NULL, 2, '2023-02-18', 'Retiro', 125),
  (6, NULL, 3, '2023-02-19', 'Retiro', 310),
  (7, NULL, 4, '2023-02-20', 'Depósito', 1360),
  (1, NULL, 1, '2023-02-21', 'Retiro', 100),
  (8, NULL, 2, '2023-02-22', 'Pago Servicios', 850),
  (9, NULL, 3, '2023-02-25', 'Depósito', 90),  
  (6, NULL, 4, '2023-02-26', 'Pago Tarjeta', 1500), 
  (10, NULL, 2, '2023-03-01', 'Retiro', 75), 
  (2, 1, 1, '2023-03-02', 'Transferencia', 360),  
  (5, NULL, 3, '2023-03-05', 'Pago Servicios', 175),
  (3, NULL, 4, '2023-03-07', 'Depósito', 900),
  (2, 1, 1, '2023-03-02', 'Transferencia', 360), 
  (5, 7, 2, '2023-03-10', 'Transferencia', 500),
  (4, 8, 1, '2023-03-15', 'Transferencia', 200),
  (6, 9, 3, '2023-03-20', 'Transferencia', 100),
  (10, 2, 4, '2023-03-28', 'Transferencia', 800),
  (3, 5, 2, '2023-03-29', 'Transferencia', 125)  
;

CREATE PROCEDURE TransferirCuentas
@cuentaOrigen INT,
@cuentaDestino INT,
@monto DECIMAL(10,2),
@idEmpleado INT
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @saldoOrigen DECIMAL(10,2);

  SELECT @saldoOrigen = saldo 
  FROM saldos
  WHERE id_cuenta = @cuentaOrigen;

  IF (@saldoOrigen IS NULL OR @saldoOrigen < @monto)
  BEGIN
     RAISERROR('Saldo insuficiente en cuenta origen', 16, 1);
     RETURN
  END
    
  UPDATE saldos
  SET saldo = saldo - @monto
  WHERE id_cuenta = @cuentaOrigen;

  IF @cuentaDestino IS NOT NULL 
  BEGIN
    UPDATE saldos    
    SET saldo = saldo + @monto
    WHERE id_cuenta = @cuentaDestino;

    INSERT INTO transacciones(id_cuenta, id_cuenta_destino, id_empleado, fecha, tipo, cantidad)
    VALUES(@cuentaOrigen, @cuentaDestino, @idEmpleado, GETDATE(), 'Transferencia', @monto);
  END
  ELSE 
  BEGIN
    INSERT INTO transacciones(id_cuenta, id_empleado, fecha, tipo, cantidad)
    VALUES(@cuentaOrigen, @idEmpleado, GETDATE(), 'Transferencia (Sin destino)', @monto);
  END
END

EXEC TransferirCuentas 
    @cuentaOrigen = 7,  
    @cuentaDestino = 4, 
    @monto = 500,
    @idEmpleado = 3; 


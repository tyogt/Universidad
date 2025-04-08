CREATE DATABASE Proyecto_Vehiculos

USE Proyecto_Vehiculos

CREATE TABLE marcas_vehiculos (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(255),
  logo VARCHAR(255),
  descripcion TEXT
);

CREATE TABLE tipos_vehiculos (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(255),
  descripcion TEXT,
  estado VARCHAR(10) CHECK (estado IN ('Activo','Inactivo')),
  foto VARCHAR(255)
);

CREATE TABLE usuarios_administrativos (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombres VARCHAR(255),
  apellidos VARCHAR(255),  
  edad INT,
  direccion VARCHAR(255),
  telefono VARCHAR(255),
  email VARCHAR(255),
  fecha_inicio DATE,
  foto VARCHAR(255)
);

CREATE TABLE vehiculos (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(255),
  descripcion TEXT,
  num_asientos INT,
  transmision VARCHAR(255),
  num_puertas INT,
  amenidades TEXT,
  precio DECIMAL(10,2),
  color VARCHAR(255),
  fotos TEXT,
  capacidad_equipaje INT,
  motor VARCHAR(255),
  num_chasis VARCHAR(255),
  anio INT, 
  kilometraje INT
);

CREATE TABLE vehiculos_marcas (
  vehiculo_id INT,
  marca_id INT,
  PRIMARY KEY(vehiculo_id, marca_id),
  FOREIGN KEY(vehiculo_id) REFERENCES vehiculos(id),
  FOREIGN KEY(marca_id) REFERENCES marcas_vehiculos(id)
);

CREATE TABLE vehiculos_tipos (
  vehiculo_id INT,
  tipo_id INT,
  PRIMARY KEY(vehiculo_id, tipo_id),
  FOREIGN KEY(vehiculo_id) REFERENCES vehiculos(id),
  FOREIGN KEY(tipo_id) REFERENCES tipos_vehiculos(id)
);

CREATE TABLE solicitudes_arrendamiento (
  id INT IDENTITY(1,1) PRIMARY KEY, 
  vehiculo_id INT,
  fecha_inicio DATETIME,
  fecha_fin DATETIME,
  usuario VARCHAR(255),
  monto DECIMAL(10,2),
  FOREIGN KEY(vehiculo_id) REFERENCES vehiculos(id)
);

CREATE TABLE ordenes_salida (
  id INT IDENTITY(1,1) PRIMARY KEY,
  vehiculo_id INT,
  usuario_admin_id INT,
  fecha_hora_salida DATETIME,
  kilometraje_salida INT,
  FOREIGN KEY(vehiculo_id) REFERENCES vehiculos(id),
  FOREIGN KEY(usuario_admin_id) REFERENCES usuarios_administrativos(id)
);

CREATE TABLE ordenes_entrada (
  id INT IDENTITY(1,1) PRIMARY KEY,
  vehiculo_id INT,
  usuario_admin_id INT,
  fecha_hora_entrada DATETIME,
  kilometraje_entrada INT, 
  observaciones TEXT,
  FOREIGN KEY(vehiculo_id) REFERENCES vehiculos(id),
  FOREIGN KEY(usuario_admin_id) REFERENCES usuarios_administrativos(id)
);

CREATE TABLE usuarios_arrendatarios (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(255),
  apellido VARCHAR(255), 
  username VARCHAR(255),
  email VARCHAR(255),
  telefono VARCHAR(255),
  foto VARCHAR(255),
  documento_identificacion VARCHAR(255)
);

CREATE TABLE reservaciones (
  id INT IDENTITY(1,1) PRIMARY KEY,
  vehiculo_id INT,
  usuario_arrendatario_id INT,
  fecha_inicio DATETIME,
  fecha_fin DATETIME,
  FOREIGN KEY(vehiculo_id) REFERENCES vehiculos(id),
  FOREIGN KEY(usuario_arrendatario_id) REFERENCES usuarios_arrendatarios(id)
);

CREATE TABLE resenas (
  id INT IDENTITY(1,1) PRIMARY KEY,
  vehiculo_id INT,
  usuario_arrendatario_id INT,
  comentario TEXT,
  puntuacion TINYINT,
  FOREIGN KEY(vehiculo_id) REFERENCES vehiculos(id),
  FOREIGN KEY(usuario_arrendatario_id) REFERENCES usuarios_arrendatarios(id)
);

CREATE TABLE facturas (
  id INT IDENTITY(1,1) PRIMARY KEY,
  reservacion_id INT,
  fecha DATE,
  monto DECIMAL(10,2),
  FOREIGN KEY(reservacion_id) REFERENCES reservaciones(id)
);

CREATE TABLE reportes (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(255),
  parametros NVARCHAR(MAX),
  fecha_generacion DATETIME
);


--Insertar
-- Insertar datos en la tabla marcas_vehiculos
INSERT INTO marcas_vehiculos (nombre, logo, descripcion) VALUES
('Toyota', 'toyota_logo.png', 'Fabricante de vehículos de alta calidad'),
('Honda', 'honda_logo.png', 'Diseño y tecnología innovadores'),
('Ford', 'ford_logo.png', 'Líder en vehículos pickup y SUVs');

-- Insertar datos en la tabla tipos_vehiculos
INSERT INTO tipos_vehiculos (nombre, descripcion, estado, foto) VALUES
('Sedán', 'Vehículos de cuatro puertas', 'Activo', 'sedan.jpg'),
('SUV', 'Vehículos deportivos utilitarios', 'Activo', 'suv.jpg'),
('Camioneta', 'Vehículos para carga y pasajeros', 'Activo', 'camioneta.jpg');

-- Insertar datos en la tabla usuarios_administrativos
INSERT INTO usuarios_administrativos (nombres, apellidos, edad, direccion, telefono, email, fecha_inicio, foto) VALUES
('Juan', 'Pérez', 35, 'Calle 123, Ciudad', '555-123-4567', 'juan@email.com', '2023-01-15', 'juan_foto.jpg'),
('María', 'Gómez', 42, 'Avenida 456, Ciudad', '555-987-6543', 'maria@email.com', '2023-02-20', 'maria_foto.jpg');

-- Insertar datos en la tabla vehiculos
INSERT INTO vehiculos (nombre, descripcion, num_asientos, transmision, num_puertas, amenidades, precio, color, fotos, capacidad_equipaje, motor, num_chasis, anio, kilometraje) VALUES
('Toyota Corolla', 'Sedán compacto', 5, 'Automática', 4, 'Aire acondicionado, Bluetooth', 20000.00, 'Rojo', 'corolla1.jpg,corolla2.jpg', 4, '1.8L', 'CH-123456', 2022, 10000),
('Honda CR-V', 'SUV espaciosa', 5, 'Automática', 4, 'Navegación, Techo solar', 28000.00, 'Azul', 'crv1.jpg,crv2.jpg', 6, '2.4L', 'CH-987654', 2023, 8000);

-- Insertar datos en la tabla vehiculos_marcas (asociación de vehículos y marcas)
INSERT INTO vehiculos_marcas (vehiculo_id, marca_id) VALUES
(1, 1),  -- Asociar Toyota Corolla con Toyota
(2, 2); -- Asociar Honda CR-V con Honda

-- Insertar datos en la tabla vehiculos_tipos (asociación de vehículos y tipos)
INSERT INTO vehiculos_tipos (vehiculo_id, tipo_id) VALUES
(1, 1),  -- Asociar Toyota Corolla con Sedán
(2, 2); -- Asociar Honda CR-V con SUV

-- Insertar datos en la tabla solicitudes_arrendamiento
INSERT INTO solicitudes_arrendamiento (vehiculo_id, fecha_inicio, fecha_fin, usuario, monto) VALUES
(1, '2023-03-01 10:00:00', '2023-03-05 16:00:00', 'usuario1', 400.00),
(2, '2023-03-10 09:00:00', '2023-03-15 14:00:00', 'usuario2', 600.00);

-- Insertar datos en la tabla ordenes_salida
INSERT INTO ordenes_salida (vehiculo_id, usuario_admin_id, fecha_hora_salida, kilometraje_salida) VALUES
(1, 1, '2023-03-01 10:00:00', 10000),
(2, 2, '2023-03-10 09:00:00', 8000);

-- Insertar datos en la tabla ordenes_entrada
INSERT INTO ordenes_entrada (vehiculo_id, usuario_admin_id, fecha_hora_entrada, kilometraje_entrada, observaciones) VALUES
(1, 1, '2023-03-06 18:00:00', 10500, 'Sin problemas'),
(2, 2, '2023-03-16 16:00:00', 8500, 'Pequeño rasguño en la parte trasera');

-- Insertar datos en la tabla usuarios_arrendatarios
INSERT INTO usuarios_arrendatarios (nombre, apellido, username, email, telefono, foto, documento_identificacion) VALUES
('Carlos', 'López', 'carlos123', 'carlos@email.com', '555-111-2222', 'carlos_foto.jpg', 'ID-12345'),
('Luisa', 'García', 'luisa456', 'luisa@email.com', '555-333-4444', 'luisa_foto.jpg', 'ID-67890');

-- Insertar datos en la tabla reservaciones
INSERT INTO reservaciones (vehiculo_id, usuario_arrendatario_id, fecha_inicio, fecha_fin) VALUES
(1, 1, '2023-03-02 14:00:00', '2023-03-05 12:00:00'),
(2, 2, '2023-03-12 11:00:00', '2023-03-15 10:00:00');

-- Insertar datos en la tabla resenas
INSERT INTO resenas (vehiculo_id, usuario_arrendatario_id, comentario, puntuacion) VALUES
(1, 1, 'El Corolla es un coche muy confiable', 4),
(2, 2, 'La CR-V tiene mucho espacio y es cómoda', 5);

-- Insertar datos en la tabla facturas
INSERT INTO facturas (reservacion_id, fecha, monto) VALUES
(1, '2023-03-06', 400.00),
(2, '2023-03-16', 600.00);

-- Insertar datos en la tabla reportes
INSERT INTO reportes (nombre, parametros, fecha_generacion) VALUES
('Reporte de Ventas', 'Parámetros de filtro', '2023-03-20 09:00:00');


--Seleccionar 
-- tabla marcas_vehiculos
CREATE PROCEDURE SeleccionarDatosMarcasVehiculos
AS
BEGIN
    SELECT nombre, descripcion
    FROM marcas_vehiculos;
END;

-- tabla tipos_vehiculos
CREATE PROCEDURE SeleccionarDatosTiposVehiculos
AS
BEGIN
    SELECT nombre, descripcion, estado
    FROM tipos_vehiculos;
END;

-- tabla usuarios_administrativos
CREATE PROCEDURE SeleccionarDatosUsuariosAdministrativos
AS
BEGIN
    SELECT nombres, apellidos, email, telefono
    FROM usuarios_administrativos;
END;

-- tabla vehiculos
CREATE PROCEDURE SeleccionarDatosVehiculos
AS
BEGIN
    SELECT nombre, descripcion, precio, anio
    FROM vehiculos;
END;

-- tabla vehiculos_marcas
CREATE PROCEDURE SeleccionarDatosVehiculosMarcas
AS
BEGIN
    SELECT vehiculo_id, marca_id
    FROM vehiculos_marcas;
END;

-- tabla vehiculos_tipos
CREATE PROCEDURE SeleccionarDatosVehiculosTipos
AS
BEGIN
    SELECT vehiculo_id, tipo_id
    FROM vehiculos_tipos;
END;

-- tabla solicitudes_arrendamiento
CREATE PROCEDURE SeleccionarDatosSolicitudesArrendamiento
AS
BEGIN
    SELECT fecha_inicio, fecha_fin, usuario, monto
    FROM solicitudes_arrendamiento;
END;

-- tabla ordenes_salida
CREATE PROCEDURE SeleccionarDatosOrdenesSalida
AS
BEGIN
    SELECT fecha_hora_salida, kilometraje_salida
    FROM ordenes_salida;
END;

-- tabla ordenes_entrada
CREATE PROCEDURE SeleccionarDatosOrdenesEntrada
AS
BEGIN
    SELECT fecha_hora_entrada, kilometraje_entrada, observaciones
    FROM ordenes_entrada;
END;

-- tabla usuarios_arrendatarios
CREATE PROCEDURE SeleccionarDatosUsuariosArrendatarios
AS
BEGIN
    SELECT nombre, apellido, email, telefono
    FROM usuarios_arrendatarios;
END;

-- tabla reservaciones
CREATE PROCEDURE SeleccionarDatosReservaciones
AS
BEGIN
    SELECT fecha_inicio, fecha_fin
    FROM reservaciones;
END;

-- tabla resenas
CREATE PROCEDURE SeleccionarDatosResenas
AS
BEGIN
    SELECT comentario, puntuacion
    FROM resenas;
END;

-- tabla facturas
CREATE PROCEDURE SeleccionarDatosFacturas
AS
BEGIN
    SELECT fecha, monto
    FROM facturas;
END;

--tabla reportes
CREATE PROCEDURE SeleccionarDatosReportes
AS
BEGIN
    SELECT nombre, parametros, fecha_generacion
    FROM reportes;
END;

--Actualizar

-- tabla reservaciones
CREATE PROCEDURE ActualizarReservacion
    @reservacion_id INT,
    @nueva_fecha_inicio DATETIME,
    @nueva_fecha_fin DATETIME
AS
BEGIN
    UPDATE reservaciones
    SET fecha_inicio = @nueva_fecha_inicio, fecha_fin = @nueva_fecha_fin
    WHERE id = @reservacion_id;
END;

-- tabla usuarios_arrendatarios
CREATE PROCEDURE ActualizarUsuarioArrendatario
    @usuario_arrendatario_id INT,
    @nuevo_nombre VARCHAR(255),
    @nuevo_apellido VARCHAR(255),
    @nuevo_email VARCHAR(255),
    @nuevo_telefono VARCHAR(255)
AS
BEGIN
    UPDATE usuarios_arrendatarios
    SET nombre = @nuevo_nombre, apellido = @nuevo_apellido, email = @nuevo_email, telefono = @nuevo_telefono
    WHERE id = @usuario_arrendatario_id;
END;
-- tabla ordenes_entrada
CREATE PROCEDURE ActualizarOrdenEntrada
    @orden_entrada_id INT,
    @nueva_fecha_hora_entrada DATETIME,
    @nuevo_kilometraje_entrada INT,
    @nuevas_observaciones TEXT
AS
BEGIN
    UPDATE ordenes_entrada
    SET fecha_hora_entrada = @nueva_fecha_hora_entrada, kilometraje_entrada = @nuevo_kilometraje_entrada, observaciones = @nuevas_observaciones
    WHERE id = @orden_entrada_id;
END;

-- tabla vehiculos
CREATE PROCEDURE ActualizarVehiculo
    @vehiculo_id INT,
    @nuevo_nombre VARCHAR(255),
    @nueva_descripcion TEXT,
    @nuevo_precio DECIMAL(10,2),
    @nuevo_anio INT
AS
BEGIN
    UPDATE vehiculos
    SET nombre = @nuevo_nombre, descripcion = @nueva_descripcion, precio = @nuevo_precio, anio = @nuevo_anio
    WHERE id = @vehiculo_id;
END;

-- tabla usuarios_administrativos
CREATE PROCEDURE ActualizarUsuarioAdministrativo
    @usuario_admin_id INT,
    @nuevos_nombres VARCHAR(255),
    @nuevos_apellidos VARCHAR(255),
    @nueva_direccion VARCHAR(255),
    @nuevo_telefono VARCHAR(255),
    @nuevo_email VARCHAR(255)
AS
BEGIN
    UPDATE usuarios_administrativos
    SET nombres = @nuevos_nombres, apellidos = @nuevos_apellidos, direccion = @nueva_direccion, telefono = @nuevo_telefono, email = @nuevo_email
    WHERE id = @usuario_admin_id;
END;

--Eliminar

-- eliminar una reservación
CREATE PROCEDURE EliminarReservacion
    @reservacion_id INT
AS
BEGIN
    DELETE FROM reservaciones
    WHERE id = @reservacion_id;
END;

-- eliminar un usuario arrendatario
CREATE PROCEDURE EliminarUsuarioArrendatario
    @usuario_arrendatario_id INT
AS
BEGIN
    DELETE FROM usuarios_arrendatarios
    WHERE id = @usuario_arrendatario_id;
END;

-- eliminar una orden de entrada
CREATE PROCEDURE EliminarOrdenEntrada
    @orden_entrada_id INT
AS
BEGIN
    DELETE FROM ordenes_entrada
    WHERE id = @orden_entrada_id;
END;

-- eliminar un vehículo
CREATE PROCEDURE EliminarVehiculo
    @vehiculo_id INT
AS
BEGIN
    DELETE FROM vehiculos
    WHERE id = @vehiculo_id;
END;

-- eliminar un usuario administrativo
CREATE PROCEDURE EliminarUsuarioAdministrativo
    @usuario_admin_id INT
AS
BEGIN
    DELETE FROM usuarios_administrativos
    WHERE id = @usuario_admin_id;
END;


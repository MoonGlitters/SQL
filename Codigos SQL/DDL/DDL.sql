-- Creacion de base de datos
CREATE DATABASE negocio;

-- Crear tabla clientes
CREATE TABLE Clientes (
    ID_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    correo VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(20) UNIQUE NOT NULL
);

--Crear tabla direcciones
CREATE TABLE Direcciones (
    ID_direccion SERIAL PRIMARY KEY,
    ID_cliente INT NOT NULL,
    villa VARCHAR(255) NOT NULL,
    calle VARCHAR(255) NOT NULL,
    numero INT NOT NULL,
    FOREIGN KEY (ID_cliente) REFERENCES Clientes(ID_cliente) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Crear Tabla productos
CREATE TABLE Productos (
    ID_producto SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

-- Crear tabla estados pedido
CREATE TABLE Estados_pedido (
    ID_estado SERIAL PRIMARY KEY,
    estado VARCHAR(50) UNIQUE NOT NULL
);

-- Crear tabla pedidos
CREATE TABLE Pedidos (
    ID_pedido SERIAL PRIMARY KEY,
    ID_cliente INT NOT NULL,
    ID_estado INT NOT NULL,
    fecha_pedido DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (ID_cliente) REFERENCES Clientes(ID_cliente) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (ID_estado) REFERENCES Estados_pedido(ID_estado) ON DELETE RESTRICT ON UPDATE CASCADE
);

--Crear tabla detalle
CREATE TABLE Detalle (
    ID_detalle SERIAL PRIMARY KEY,
    ID_producto INT NOT NULL,
    ID_pedido INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10, 2) NOT NULL CHECK (precio_unitario >= 0),
    FOREIGN KEY (ID_producto) REFERENCES Productos(ID_producto) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (ID_pedido) REFERENCES Pedidos(ID_pedido) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (ID_producto, ID_pedido)
);

-- Crear tabla metodos de pago
CREATE TABLE Metodos_pago (
    ID_metodos_pago SERIAL PRIMARY KEY,
    tipo VARCHAR(50) UNIQUE NOT NULL
);

-- Crear tabla pagos
CREATE TABLE Pagos (
    ID_pago SERIAL PRIMARY KEY,
    ID_pedido INT NOT NULL,
    ID_metodos_pago INT NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    fecha_pago DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (ID_pedido) REFERENCES Pedidos(ID_pedido) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ID_metodos_pago) REFERENCES Metodos_pago(ID_metodos_pago) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Modificaciones para las tablas (Para que los valores sean numeros positivos)
ALTER TABLE Direcciones ADD CONSTRAINT check_numero CHECK (numero > 0);
ALTER TABLE Productos ADD CONSTRAINT check_precio CHECK (precio >= 0);
ALTER TABLE Productos ADD CONSTRAINT check_stock CHECK (stock >= 0);
ALTER TABLE Detalle ADD CONSTRAINT check_cantidad CHECK (cantidad > 0);
ALTER TABLE Detalle ADD CONSTRAINT check_precio_unitario CHECK (precio_unitario >= 0);
ALTER TABLE Pagos ADD CONSTRAINT check_monto CHECK (monto >= 0);

-- Tabla de ejemplo
CREATE TABLE Empleados_Ejemplo (
    ID_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    puesto VARCHAR(255)
);

-- Eliminacion de la tabla
DELETE TABLE Empleados_Ejemplo;

-- Creacion de indices para las llaves foraneas
CREATE INDEX index_direcciones_id_cliente ON Direcciones (ID_cliente);
CREATE INDEX index_pedidos_id_cliente ON Pedidos (ID_cliente);
CREATE INDEX index_pedidos_id_estado ON Pedidos (ID_estado);
CREATE INDEX index_detalle_id_producto ON Detalle (ID_producto);
CREATE INDEX index_detalle_id_pedido ON Detalle (ID_pedido);
CREATE INDEX index_pagos_id_pedido ON Pagos (ID_pedido);
CREATE INDEX index_pagos_id_metodos_pago ON Pagos (ID_metodos_pago);
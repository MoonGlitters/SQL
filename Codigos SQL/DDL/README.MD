# Consultas DDL utilizadas

## CREATE DATABASE
Este comando se utiliza para crear una nueva base de datos. Una base de datos es un contenedor donde se almacenan todas las tablas, vistas y otros objetos de un proyecto.

shell"""
CREATE DATABASE negocio;
"""

## CREATE TABLE
Este comando sirve para crear una nueva tabla dentro de una base de datos. Una tabla es la estructura principal para guardar datos, organizada en filas y columnas. Al crearla, defines el nombre de cada columna, el tipo de dato que guardará y las reglas.

shell"""
CREATE TABLE Clientes (
    ID_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    correo VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(20) UNIQUE NOT NULL
);
"""

## DROP TABLE
Elimina la tabla completa.

shell"""
DROP TABLE Clientes;
"""

## ALTER TABLE
Este comando se utiliza para modificar la estructura de una tabla que ya existe. Te permite añadir nuevas columnas, eliminar columnas, cambiar el tipo de dato de una columna o agregar y quitar restricciones. 

shell"""
ALTER TABLE Clientes ADD COLUMN run VARCHAR(255);
"""

## CREATE INDEX
Este comando se usa para crear un índice en una columna o grupo de columnas de una tabla. Mejora significativamente el rendimiento de las búsquedas y consultas, especialmente en tablas grandes.

shell"""
CREATE INDEX idx_nombre_producto ON Productos (nombre_producto);
"""
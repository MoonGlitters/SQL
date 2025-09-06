# Portafolio SQL

## SQL (Structured Query Language)

SQL es un lenguaje de programación diseñado específicamente para gestionar y manipular bases de datos relacionales.

## Se usa para:

1. Crear bases de datos y tablas
2. Insertar, modificar y eliminar datos
3. Consultar y recuperar información específica
4. Gestionar permisos y seguridad

## Componentes basicos de una BD Relacional

1. Tablas: 
Es la estructura fundamental de una base de datos que representa una entidad, es una coleccion de datos organizados por filas y columnas, similar a una hoja de calculos.

2. Campos o Columnas:
Cada columna define un tipo especifico de dato que se almacenara, representa un atributo o caracteristica de la entidad.

3. Filas:
Cada fila en una tabla representa una instancia unica o ocurrencia individual de la entidad, Contiene los datos reales de un solo elemento por ejemplo un cliente especifico

4. Llave primaria: 
Representa un valor unico o identificador de cada registro de una tabla para asegurar que dos filas no sean identicas.

5. Llave Foranea: 
Es un campo en una tabla que hace referencia a la llave primaria de otra tabla (Establece un vinculo entre 2 tablas).

## Gestion y almacenamiento en tablas

Los datos se almacenan de forma estructurada y siguiendo las reglas de normalizacion:

- ¿Qué es la Normalización?
Es el proceso de dividir una tabla en tablas más pequeñas y sin redundancia, manteniendo las relaciones mediante claves foráneas.

1. Primera Forma Normal (1FN)
Eliminar grupos repetitivos y asegurar que cada columna contenga valores atómicos.

2. Segunda Forma Normal (2FN)
Todos los atributos no clave deben depender por completo de la clave primaria.

3. Tercera Forma Normal (3FN)
Eliminar dependencias transitivas: Un campo no clave no debe depender de otro campo no clave.

## ¿Por qué normalizar?

- Reduce la redundancia de datos.
- Mejora la integridad de los datos.
- Facilita mantenimiento y actualizaciones.
- Evita anomalías en inserciones, modificaciones y eliminaciones.







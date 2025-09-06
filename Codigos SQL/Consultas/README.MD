# Querys utilizados

## SELECT con WHERE
Estas consultas buscan datos específicos que cumplen una condición.

Obtener productos con stock menor a 50:
```SQL
SELECT nombre_producto, stock FROM Productos WHERE stock < 50;
```

## SELECT con JOIN
Estas consultas combinan información de dos o más tablas para obtener una vista más completa.

Listar todos los pedidos, mostrando el nombre del cliente y el estado del pedido:
```SQL
SELECT c.nombre AS cliente, e.estado AS estado_pedido, pe.fecha_pedido FROM Pedidos pe JOIN Clientes c ON pe.ID_cliente = c.ID_cliente JOIN Estados_pedido e ON pe.ID_estado = e.ID_estado;
```

## SELECT con GROUP BY
Estas consultas agrupan filas que tienen valores similares en una columna para realizar cálculos con funciones de agregación (SUM, COUNT, AVG)

Calcular el valor total de cada pedido:
```SQL
SELECT ID_pedido, SUM(cantidad * precio_unitario) AS total_pedido FROM Detalle GROUP BY ID_pedido;
```
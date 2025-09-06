
-- SELECT con WHERE

-- Obtener productos con stock menor a 50:
SELECT nombre_producto, stock FROM Productos WHERE stock < 50;
-- Encontrar pedidos cancelados:
SELECT * FROM Pedidos WHERE ID_estado = (SELECT ID_estado FROM Estados_pedido WHERE estado = 'Cancelado');
-- Listar clientes cuyo nombre contiene "Ana":
SELECT nombre, correo FROM Clientes WHERE nombre LIKE '%Ana%';

-- SELECT con JOIN

-- Obtener el nombre de los clientes y sus direcciones:
SELECT c.nombre, d.calle, d.numero FROM Clientes c JOIN Direcciones d ON c.ID_cliente = d.ID_cliente;
-- Ver el detalle de un pedido específico, incluyendo el nombre del producto:
SELECT p.nombre_producto, d.cantidad, d.precio_unitario FROM Detalle d JOIN Productos p ON d.ID_producto = p.ID_producto WHERE d.ID_pedido = 2;
--Listar todos los pedidos, mostrando el nombre del cliente y el estado del pedido:
SELECT c.nombre AS cliente, e.estado AS estado_pedido, pe.fecha_pedido FROM Pedidos pe JOIN Clientes c ON pe.ID_cliente = c.ID_cliente JOIN Estados_pedido e ON pe.ID_estado = e.ID_estado;

--SELECT con GROUP BY (SUM, COUNT)

-- Calcular el total gastado por cada cliente:
SELECT c.nombre, SUM(pa.monto) AS total_gastado FROM Pagos pa JOIN Pedidos pe ON pa.ID_pedido = pe.ID_pedido JOIN Clientes c ON pe.ID_cliente = c.ID_cliente GROUP BY c.nombre;
-- Contar cuántos pedidos tiene cada cliente:
SELECT c.nombre, COUNT(pe.ID_pedido) AS numero_de_pedidos FROM Pedidos pe JOIN Clientes c ON pe.ID_cliente = c.ID_cliente GROUP BY c.nombre;
-- Obtener el número total de productos vendidos en cada pedido:
SELECT ID_pedido, SUM(cantidad) AS productos_vendidos FROM Detalle GROUP BY ID_pedido;
-- Calcular el valor total de cada pedido:
SELECT ID_pedido, SUM(cantidad * precio_unitario) AS total_pedido FROM Detalle GROUP BY ID_pedido;


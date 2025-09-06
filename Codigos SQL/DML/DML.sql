-- Inserciones en la tabla Estados_pedido
INSERT INTO Estados_pedido (estado) VALUES
('Pendiente'),
('Procesando'),
('Enviado'),
('Entregado'),
('Cancelado');

-- Inserciones en la tabla Metodos_pago
INSERT INTO Metodos_pago (tipo) VALUES
('Tarjeta de Credito'),
('Transferencia Bancaria'),
('PayPal'),
('Efectivo'),
('Bitcoin');

-- Inserciones en la tabla Clientes
INSERT INTO Clientes (nombre, correo, telefono) VALUES
('Juan Pérez', 'juan.perez@example.com', '56912345678'),
('Ana Gomez', 'ana.gomez@example.com', '56923456789'),
('Carlos Ramirez', 'carlos.ramirez@example.com', '56934567890'),
('Luisa Torres', 'luisa.torres@example.com', '56945678901'),
('Sofía Diaz', 'sofia.diaz@example.com', '56956789012');

-- Inserciones en la tabla Direcciones
INSERT INTO Direcciones (ID_cliente, villa, calle, numero) VALUES
(1, 'La Florida', 'Los Nardos', 123),
(2, 'Providencia', 'Manuel Montt', 456),
(3, 'Las Condes', 'Avenida Principal', 789),
(4, 'Santiago Centro', 'San Diego', 101),
(5, 'Vitacura', 'El Bosque', 222);

-- Inserciones en la tabla Productos
INSERT INTO Productos (nombre_producto, descripcion, precio, stock) VALUES
('Laptop Dell XPS', 'Ordenador portatil de alto rendimiento', 1500.00, 20),
('Monitor Samsung 27"', 'Pantalla LED con alta resolucion', 250.00, 50),
('Teclado Mecanico RGB', 'Teclado para gaming con luces', 80.00, 100),
('Mouse Inalambrico', 'Mouse ergonomico para oficina', 30.00, 200),
('Auriculares Gaming', 'Cascos con microfono y sonido envolvente', 120.00, 75);

-- Inserciones en la tabla Pedidos
INSERT INTO Pedidos (ID_cliente, ID_estado, fecha_pedido) VALUES
(1, 1, '2025-08-01'), -- Juan Perez, Pendiente
(2, 2, '2025-08-02'), -- Ana Gomez, Procesando
(3, 3, '2025-08-03'), -- Carlos Ramirez, Enviado
(4, 4, '2025-08-04'), -- Luisa Torres, Entregado
(5, 5, '2025-08-05'); -- Sofia Diaz, Cancelado

-- Inserciones en la tabla Detalle (usando los IDs de los pedidos y productos)
INSERT INTO Detalle (ID_producto, ID_pedido, cantidad, precio_unitario) VALUES
(1, 1, 1, 1500.00), -- Laptop en el Pedido 1
(2, 2, 2, 250.00),  -- 2 Monitores en el Pedido 2
(3, 3, 1, 80.00),   -- Teclado en el Pedido 3
(4, 4, 3, 30.00),   -- 3 Mouses en el Pedido 4
(5, 5, 1, 120.00);  -- Auriculares en el Pedido 5

-- Inserciones en la tabla Pagos
INSERT INTO Pagos (ID_pedido, ID_metodos_pago, monto, fecha_pago) VALUES
(1, 1, 1500.00, '2025-08-01'), -- Pago por Tarjeta para el Pedido 1
(2, 2, 500.00, '2025-08-02'),  -- Pago por Transferencia para el Pedido 2
(3, 3, 80.00, '2025-08-03'),   -- Pago por PayPal para el Pedido 3
(4, 4, 90.00, '2025-08-04'),   -- Pago por Efectivo para el Pedido 4
(5, 5, 120.00, '2025-08-05');  -- Pago por Bitcoin para el Pedido 5

-- Actualizaciones de datos

-- Nuevo correo para cliente 1
UPDATE Clientes SET correo = 'juan.perez.nuevo@example.com' WHERE ID_cliente = 1;
-- Nuevo stock para producto 1
UPDATE Productos SET stock = 15 WHERE ID_producto = 1;
-- Nuevo estado para pedido 2 (Enviado)
UPDATE Pedidos SET ID_estado = 3 WHERE ID_pedido = 2;

-- Eliminacion de datos

-- Elimina el pago numero 5
DELETE FROM Pagos WHERE ID_pago = 5;
-- Elimina el cliente id 5 (Se eliminaran todas sus direcciones)
DELETE FROM Clientes WHERE ID_cliente = 5;
-- Elimina el producto con id 5
DELETE FROM Productos WHERE ID_producto = 5;
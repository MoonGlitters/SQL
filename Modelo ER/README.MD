# Explicacion diagrama MER (Entidad Relacion):

## Entidades

1. Clientes
Guarda la identidad y contacto del comprador.

2. Direcciones
Direcciones de envío/facturación del cliente. Se separa de Clientes porque un cliente puede tener múltiples direcciones.

3. Productos
nombre, descripción, precio vigente y stock.

4. Pedidos
quién compra, cuándo y estado del pedido.

5. Detalle
cada producto con su cantidad y su precio_unitario al momento de la compra.

6. Estados_pedido
Catálogo de estados (pendiente, pagado, enviado, entregado, etc.).

7. Metodos_pago
Catálogo de métodos (tarjeta, transferencia, etc.).

8. Pagos
Registra transacciones de pago asociadas a un pedido (monto, fecha, método).

## Relaciones

1. Clientes 1 — N Direcciones:
Un cliente puede registrar varias direcciones, se evita duplicar datos de cliente en cada dirección.

2. Clientes 1 — N Pedidos:
Un cliente puede hacer muchos pedidos; el pedido necesita saber a quién pertenece.

3. Pedidos 1 — N Detalle
Un pedido puede tener varias líneas, la separación evita columnas repetidas.

4. Productos 1 — N Detalle
Un producto puede aparecer en muchas líneas de muchos pedidos.

5. Estados_pedido 1 — N Pedidos
Un pedido tiene exactamente un estado vigente, y el catálogo evita repetir textos.

6. Metodos_pago 1 — N Pagos
Un pago se efectúa con un método, un método participa en muchos pagos.

7. Pedidos 1 — N Pagos
Un pedido puede registrarse con uno o varios pagos.

## Normalizacion

1. 1NF – Atributos atómicos y sin grupos repetidos

- Separar Detalle de Pedidos hace que cada fila represente una sola combinación pedido–producto–cantidad, no hay columnas repetidas ni listas dentro de una celda.

- Direcciones separada evita meter varias direcciones en una sola columna tipo “texto largo”.

2. 2NF – Dependencia total de la clave

En Detalle, los atributos cantidad y precio_unitario dependen de la clave primaria.

En Pagos, los atributos dependen de su ID_pago

3. 3NF – Sin dependencias transitivas

- El nombre del estado no está en Pedidos, sino en Estados_pedido.

- La descripción del método de pago no está en Pagos ni Pedidos, sino en Metodos_pago.

- Los datos del cliente no se repiten en Pedidos ni Direcciones.

- 4NF – Hechos independientes en tablas independientes

Un pedido tiene dos multivaluados: productos y pagos. Modelarlos en Detalle y Pagos evita combinaciones y duplicación masiva.
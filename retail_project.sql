CREATE TABLE clientes (
id_cliente SERIAL PRIMARY KEY,
nombre_cliente VARCHAR (100) NOT NULL,
email VARCHAR (50) UNIQUE NOT NULL
);
CREATE TABLE productos (
id_producto SERIAL PRIMARY KEY,
nombre_producto VARCHAR (100) UNIQUE NOT NULL,
stock INT NOT NULL,
precio DECIMAL (10,2) NOT NULL,
CONSTRAINT chk_stock CHECK (stock>=0),
CONSTRAINT chk_precio CHECK (precio >0)
);

CREATE TABLE ventas (
id_venta SERIAL PRIMARY KEY,
id_cliente INT NOT NULL,
id_producto INT NOT NULL,
CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
CONSTRAINT fk_id_producto FOREIGN KEY (id_producto) REFERENCES productos (id_producto)
);   
ALTER TABLE clientes
ADD COLUMN edad INT,
ADD CONSTRAINT chk_edad CHECK (edad >= 18);



BEGIN;
INSERT INTO clientes
(nombre_cliente, email, edad) VALUES
('Martin', 'martin@gmail.com', 22),
('Sofia', 'sofia@gmail.com', 19),
('Lucas', 'lucas@gmail.com', 30),
('Ana', 'ana@gmail.com', 25),
('Pedro', 'pedro@gmail.com', 40);
 
INSERT INTO productos (nombre_producto, stock, precio) VALUES
('Notebook', 10, 800000.00),
('Mouse', 25, 15000.00),
('Teclado', 20, 25000.00),
('Monitor', 8, 250000.00),
('Auriculares', 15, 50000.00);
 
INSERT INTO ventas (id_cliente, id_producto) VALUES
(1,1),
(2,3),
(3,2),
(4,5),
(5,4);
 COMMIT;

UPDATE productos
SET precio = precio * 1.10
WHERE precio < 100000;

DELETE FROM ventas
WHERE id_venta = 5;

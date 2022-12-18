DROP DATABASE IF EXISTS celulares; #Elimina la base de datos si ya existe.
CREATE DATABASE celulares; #Genera la base de datos.
USE celulares; #Usa la base de datos recién creada.

#Creación de tablas con sus atributos:
CREATE TABLE IF NOT EXISTS marca (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE telefono (
  numero INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  modelo VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_marca INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_marca) REFERENCES marca(codigo)
);

CREATE TABLE pedido (
  orden INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  fecha DATE NOT NULL,
  dirección VARCHAR(100) NOT NULL,
  gasto DOUBLE NOT NULL,
  codigo_marca INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_marca) REFERENCES marca(codigo),
  numero_telefono INT UNSIGNED NOT NULL,
  FOREIGN KEY (numero_telefono) REFERENCES telefono(numero)
);

CREATE TABLE telefono2 (
  numero INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  modelo VARCHAR(100) NOT NULL,
  codigo_marca INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_marca) REFERENCES marca(codigo)
);

ALTER TABLE pedido RENAME compra; #Cambia el nombre de la tabla llamada "pedido".
DROP TABLE telefono2; #Elimina tabla duplicada.

#Insertado de registros:
INSERT INTO telefono VALUES(1, 'Redmi Note 11', 9000, 1); #Considera los campos correspondientes de la tabla.
INSERT INTO telefono VALUES(2, 'Samsung A52S', 7500, 2);
INSERT INTO telefono VALUES(3, 'Huawuei Y6', 2500, 3);
INSERT INTO telefono VALUES(4, 'iPhone X', 13000, 4);
INSERT INTO telefono VALUES(5, 'Oppo X5', 8000, 5);

INSERT INTO compra VALUES(1, '2022-05-18','Venecia 304', 18000, 1, 1); #Considera los campos correspondientes de la tabla.
INSERT INTO compra VALUES(2, '2022-05-19','Avenida Universidad', 15000, 2, 2);
INSERT INTO compra VALUES(3, '2022-05-20','León Mordeno 302', 5000, 3, 3);
INSERT INTO compra VALUES(4, '2022-05-21','Brisas del Lago 120', 26000, 4, 4);
INSERT INTO compra VALUES(5, '2022-05-22','Centro 505', 16000, 5, 5);

#Más consultas:
SELECT * FROM marca; #Muestra contenido de la tabla después de importación .csv. 
SELECT * FROM telefono; #Muestra la tabla de "telefono".
SELECT * FROM compra; #Muestra la tabla de "compra".
UPDATE telefono SET precio = 3000 WHERE precio= 2500; SET SQL_SAFE_UPDATES=0; #Actualiza el precio donde este originalmente sea 2,500.
SELECT CONCAT(precio, " ", TRUNCATE (precio*0.046,2), " ", TRUNCATE (precio*0.051,2)) AS Teléfono_precioEUR_precioUSD FROM telefono; #Convierte los precios de los celulares a dólares y euros, los muestra con alias.
SELECT modelo, precio FROM telefono ORDER BY precio DESC; #Ordena descendentemente los precios.
SELECT modelo, precio FROM telefono ORDER BY precio ASC; #Ordena ascendentemente los precios.
SELECT modelo FROM telefono WHERE (modelo LIKE '%Samsung%'); #Muestra los celulares que cumplan con tener "Samsung" en la descripción de su modelo.
SELECT*FROM marca WHERE codigo BETWEEN 4 and 5; #Muestra las marcas que cumplan con el rango establecido.
SELECT orden, gasto FROM compra WHERE gasto>=15000 ORDER BY gasto DESC; #Organiza las órdenes de la tabla "Compra" según la condición de gasto, descendentemente.
SELECT MAX(precio) AS PrecioMásAlto FROM telefono; #Imprime el teléfono más caro.
SELECT MIN(precio) AS PrecioMásBajo FROM telefono;  #Imprime el teléfono más barato.
SELECT AVG(gasto) AS PromedioPrecio FROM compra; #Imprime el promedio de gasto de las compras expedidas.
SELECT nombre FROM marca LIMIT 3; #Limita la consulta de nombres de marcas hasta 3 tuplas.
SELECT UPPER(modelo) AS Mayúsculas FROM telefono;  #Convierte los nombres de los celulares a mayúsculas.
SELECT LOWER(modelo) AS Mayúsculas FROM telefono;  #Convierte los nombres de los celulares a minúsculas.
SELECT SUBSTRING(modelo,3) AS TresLetras FROM telefono; #Elimina las primeras letras del modelo de los celulares.
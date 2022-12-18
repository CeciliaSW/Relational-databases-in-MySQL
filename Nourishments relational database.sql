#CREAR BASE DE DATOS.
CREATE DATABASE SQL_TAQUERÍA_COPACABANA;
USE SQL_TAQUERÍA_COPACABANA;

#CREAR TABLAS.
CREATE TABLE Mesero(
	IdMesero INT PRIMARY KEY, 
	Nombre VARCHAR(50) NOT NULL UNIQUE,
	AñoContratación INT NOT NULL,
    Contraseña VARCHAR(16),
	NúmeroÓrdenes INT NOT NULL DEFAULT(0),
    IdOrden INT FOREIGN KEY REFERENCES Orden(IdOrden)
)

CREATE TABLE Orden(
	IdOrden INT PRIMARY KEY IDENTITY (1,1),
	NúmeroOrden INT NOT NULL UNIQUE,
    PagoTotal FLOAT NOT NULL,
	FechaOrden DATE NOT NULL,
    Estado VARCHAR(15) NOT NULL;
	NúmeroVentasTacos INT NOT NULL DEFAULT(0),
	NúmeroVentasAguas INT NOT NULL DEFAULT(0),
    IdMesa INT FOREIGN KEY REFERENCES Mesa(IdMesa),
	IdMesero INT FOREIGN KEY REFERENCES Mesero(IdMesero),
    IdCocinero INT FOREIGN KEY REFERENCES Cocinero(IdCocinero),
    IdPlatillo INT FOREIGN KEY REFERENCES Menú(IdPlatillo);
)

CREATE TABLE Mesa(
	IdMesa INT PRIMARY KEY,
	NúmeroMesa INT NOT NULL UNIQUE,
	Disponibilidad BIT NOT NULL,
)

CREATE TABLE Cocinero(
	IdCocinero INT PRIMARY KEY, 
	Nombre VARCHAR(50) NOT NULL UNIQUE, 
	FechaNacimiento DATE NOT NULL,
	AñoContratación INT NOT NULL,
	NúmeroTacosDía INT NOT NULL DEFAULT(0),
	NúmeroAguasDía INT NOT NULL DEFAULT(0),
    IdOrden INT FOREIGN KEY REFERENCES Orden(IdOrden)
)

CREATE TABLE CocineroMayor(
	IdCocineroMayor INT PRIMARY KEY, 
	Nombre VARCHAR(50) NOT NULL UNIQUE, 
	FechaNacimiento DATE NOT NULL,
	AñoContratación INT NOT NULL,
	NúmeroTacosDía INT NOT NULL DEFAULT(0),
	NúmeroAguasDía INT NOT NULL DEFAULT(0),
)

CREATE TABLE Ingrediente(
	IdLote INT PRIMARY KEY,
	NombreIngrediente VARCHAR(50) NOT NULL,
    Cantidad INT NOT NULL DEFAULT(0)
    Precio FLOAT NOT NULL,
    Proveedor VARCHAR(50) NOT NULL,
    Receptor VARCHAR(50) NOT NULL,
    Fecha VARCHAR(50) NOT NULL
)

CREATE TABLE Menú(
	IdPlatillo INT PRIMARY KEY,
    NombrePlatillo VARCHAR(50) NOT NULL,
    Precio FLOAT NOT NULL
)

#INSERCIÓN DE REGISTROS.
INSERT INTO Mesero VALUES
(1, 'Juan Pérez', '2020', '****', '150'),
(2, 'Pablo Peña', '2019', '****', '200'),
(3, 'Horacio Picón', '2021', '****', '100'),

INSERT INTO Orden VALUES
(1, '1', '2021-12-05', '500', '6', '6'),
(2, '2', '2020-08-03', '278', '3', '3'),
(3, '3', '2021-12-31', '344', '4', '4'),
(4, '4', '2019-1-23', '110', '2', '1'),
(5, '5', '2018-4-14', '230', '3', '2'),
(6, '6', '2021-2-16', '780', '8', '8'),
(7, '7', '2021-09-09', '1043.33', '10', '10'),
(8, '8', '2021-10-31', '1378.5', '13', '13'),
(9, '9', '2021-04-06', '1713.69', '17', '17'),
(10, '10', '2021-7-25', '2048.8', '20', '20');

INSERT INTO Mesa VALUES
(1, '1', 1, 1),
(2, '2', 1, 2),
(3, '3', 1, 3),
(4, '4', 1, 4),
(5, '5', 1, 5),
(6, '6', 1, 6),
(7, '7', 1, 7),
(8, '8', 1, 8),
(9, '9', 1, 9),
(10, '10', 1, 10);

INSERT INTO Cocinero VALUES
(1, 'Erika Juárez', '1980-2-19', '2020', '7', '7'),
(2, 'Héctor Lara', '2003-3-18', '2018', '5', '3'),
(3, 'Soledad Bravo', '1968-4-30', '2021', '8', '4'),
(4, 'Mónica Bravo', '1988-06-07', '2003', '4', '1'),
(5, 'Julio Contreras', '1987-9-29', '2002', '6', '4'),
(6, 'Facundo Vargas', '1992-03-13', '2001', '17', '16'),
(7, 'Guillermo Duarte', '1990-04-17', '2000', '21', '15'),
(8, 'Marcos Casillas', '1987-08-06', '2009', '32', '41'),
(9, 'Daniel Robles', '1989-11-20', '2015', '71', '17'),
(10, 'Manuel López', '1990-05-26', '2014', '30', '23');

INSERT INTO CocineroMayor VALUES (2, 'Raúl González', '2003-06-03', '2019', '12', '12');

INSERT INTO Ingrediente VALUES
(1, 'Tortilla'),
(2, 'Limón'),
(3, 'Cebolla'),
(4, 'Cilantro'),
(5, 'Salsa de tomate'),
(6, 'Pastor'),
(7, 'Bistec'),
(8, 'Chorizo'),
(9, 'Arrachera'),
(10, 'Mango'),
(11, 'Fresa'),
(12, 'Mamey'),
(13, 'Melón');

#IMPRIMIR.
SELECT * FROM Mesero;
SELECT * FROM Orden;
SELECT * FROM Mesa;
SELECT * FROM Cocinero;
SELECT * FROM CocineroMayor;
SELECT * FROM DetailOrden;
SELECT * FROM Ingrediente;
SELECT * FROM DetalleCocinero;

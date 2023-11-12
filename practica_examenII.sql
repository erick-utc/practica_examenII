CREATE DATABASE practica2
GO

USE practica2
GO

CREATE TABLE piezas(
	Codigo INT PRIMARY KEY IDENTITY(1,1),
	Nombre  NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE proveedores(
	Id CHAR(4) PRIMARY KEY,
	Nombre NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE suministros(
	CodigoPieza INT,
	IdProveedor CHAR(4),
	Precio FLOAT DEFAULT 0,
	CONSTRAINT FK_CodigoPieza FOREIGN KEY (CodigoPieza) REFERENCES piezas(Codigo),
	CONSTRAINT FK_IdProveedor FOREIGN KEY (IdProveedor) REFERENCES proveedores(Id)
)
GO

INSERT INTO piezas(Nombre) VALUES ('Tarjeta Madre')
INSERT INTO piezas(Nombre) VALUES ('Memoria Ram')
INSERT INTO piezas(Nombre) VALUES ('Tarjeta Video')
GO

INSERT INTO proveedores(Id, Nombre) VALUES ('EXT',	'Extreme Tech')
INSERT INTO proveedores(Id, Nombre) VALUES ('CB', 'Compubetel')
INSERT INTO proveedores(Id, Nombre) VALUES ('CE', 'Compuelecta')
INSERT INTO proveedores(Id, Nombre) VALUES ('TZ', 'Techzilla')
GO

INSERT INTO suministros(CodigoPieza, IdProveedor, Precio) VALUES (3, 'EXT', 150000)
INSERT INTO suministros(CodigoPieza, IdProveedor, Precio) VALUES (2, 'CE', 25000)
GO

SELECT Nombre FROM piezas

SELECT * FROM proveedores

SELECT Nombre FROM proveedores INNER JOIN suministros ON proveedores.Id = suministros.IdProveedor AND suministros.CodigoPieza = 1

UPDATE suministros SET Precio = ([Precio] * 0.5)

DELETE FROM suministros WHERE Precio < 100

SELECT piezas.Nombre as NombreDePieza, proveedores.Nombre as NomreDeProveedor, suministros.Precio
FROM suministros
JOIN piezas ON piezas.Codigo = suministros.CodigoPieza
JOIN proveedores ON proveedores.Id = suministros.IdProveedor



-- Create DATABASE DireStraits;
Create table albumes
(id_album char(3) primary key,
nombre varchar(50) not null unique, 
fecha_lanzamiento date,
numero_canciones int, 
duracion time);

Create table artistas
(id_artista char(3) primary key,
nombre varchar(50) not null,
apellidos varchar(50) not null, 
instrumento varchar(50));

Create table album_artistas
(id_album char(3),
id_artista char(3),
primary key (id_album, id_artista),
foreign key id_artista (id_artista) references Artistas(id_artista),
foreign key id_album (id_album) references albumes(id_album)
ON delete cascade on update cascade);

Create table tour
(id_tour char(3) primary key,
nombre varchar(50) not null,
id_album char(3),
foreign key id_album(id_album) references albumes(id_album)
ON delete set null on update cascade);

Create table Conciertos
(id_concierto char(3) primary key,
fecha date not null,
ciudad varchar(50),
pais varchar(50),
id_tour char(3),
foreign key id_tour(id_tour) references tour(id_tour)
on delete cascade on update cascade);


INSERT INTO albumes (id_album, nombre, fecha_lanzamiento, numero_canciones, duracion) VALUES 
('A01', 'Dire Straits', '1978-10-07', 9, '00:41:34'),
('A02', 'Communiqué', '1979-06-15', 9, '00:42:24'),
('A03', 'Making Movies', '1980-10-17', 7, '00:37:39'),
('A04', 'Love over Gold', '1982-09-20', 5, '00:40:58'),
('A05', 'Brothers in Arms', '1985-05-13', 9, '00:47:21');

INSERT INTO albumes (id_album, nombre, fecha_lanzamiento, numero_canciones, duracion) VALUES 
('A06', 'On Every Street', '1991-09-09', 12, '00:59:39'),
('A07', 'Alchemy: Dire Straits Live', '1984-03-16', 10, '01:34:00'),
('A08', 'On the Night', '1993-05-10', 10, '01:13:00'),
('A09', 'Money for Nothing (Best of)', '1988-10-17', 12, '01:06:00'),
('A10', 'Encores (EP)', '1993-05-10', 4, '00:22:00');

INSERT INTO artistas (id_artista, nombre, apellidos, instrumento) VALUES 
('M01', 'Mark', 'Knopfler', 'Guitarra solista y Voz'),
('M02', 'David', 'Knopfler', 'Guitarra rítmica'),
('M03', 'John', 'Illsley', 'Bajo'),
('M04', 'Pick', 'Withers', 'Batería'),
('M05', 'Guy', 'Fletcher', 'Teclados'),
('M06', 'Alan', 'Clark', 'Teclados y Piano'),
('M07', 'Terry', 'Williams', 'Batería'),
('M08', 'Hal', 'Lindes', 'Guitarra rítmica'),
('M09', 'Chris', 'White', 'Saxofón y Flauta');

INSERT INTO artistas (id_artista, nombre, apellidos, instrumento) VALUES 
('M10', 'Jack', 'Sonni', 'Guitarra rítmica'),
('M11', 'Mel', 'Collins', 'Saxofón'),
('M12', 'Tommy', 'Igoe', 'Batería'),
('M13', 'Danny', 'Cummings', 'Percusión'),
('M14', 'Paul', 'Franklin', 'Pedal steel guitar'),
('M15', 'Jeff', 'Sipe', NULL);

INSERT INTO album_artistas (id_album, id_artista) VALUES 
('A01', 'M01'), 
('A01', 'M02'), 
('A01', 'M03'), 
('A01', 'M04'), 
('A05', 'M01'), 
('A05', 'M03'), 
('A05', 'M05'), 
('A05', 'M06'), 
('A05', 'M07'), 
('A05', 'M09');

INSERT INTO tour (id_tour, nombre, id_album) VALUES 
('T01', 'Dire Straits Tour', 'A01'),        
('T02', 'Making Movies Tour', 'A03'),      
('T03', 'Love over Gold Tour', 'A04'),   
('T04', 'Brothers in Arms Tour', 'A05'),   
('T05', 'On Every Street Tour', 'A06');    

INSERT INTO Conciertos (id_concierto, fecha, ciudad, pais, id_tour) VALUES 
('C01', '1978-01-29', 'Londres', 'Reino Unido', 'T01'), 
('C02', '1983-07-23', 'Londres', 'Reino Unido', 'T03'), 
('C03', '1985-07-13', 'Londres', 'Reino Unido', 'T04'), 
('C04', '1992-05-13', 'Madrid', 'España', 'T05'),      
('C05', '1992-05-16', 'Barcelona', 'España', 'T05');   


INSERT INTO Conciertos (id_concierto, fecha, ciudad, pais, id_tour) VALUES 
('C06', '1979-05-12', 'París', 'Francia', 'T01'),
('C07', '1979-12-21', 'Londres', 'Reino Unido', 'T01'),
('C08', '1981-07-05', 'Milán', 'Italia', 'T02'),
('C09', '1981-11-14', 'Nueva York', 'EE.UU.', 'T02'),
('C10', '1983-05-20', 'Dublín', 'Irlanda', 'T03'),
('C11', '1985-12-19', 'Sídney', 'Australia', 'T04'),
('C12', '1986-04-26', 'Rio de Janeiro', 'Brasil', 'T04'),
('C13', '1991-08-30', 'Dublín', 'Irlanda', 'T05'),
('C14', '1992-09-29', 'Nimes', 'Francia', 'T05'),
('C15', '1992-10-09', 'Zaragoza', 'España', 'T05');

-- Vamos a añadir una 6ta tabla, 
CREATE TABLE canciones 
(id_cancion CHAR(3) primary key,
titulo VARCHAR(100) NOT NULL,
duracion TIME NOT NULL,
id_album CHAR(3) NOT NULL,
pista_numero INT CHECK (pista_numero > 0),
FOREIGN KEY (id_album) REFERENCES albumes(id_album)
ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO canciones (id_cancion, titulo, duracion, id_album, pista_numero) VALUES 
('S01', 'Sultans of Swing', '00:05:48', 'A01', 1),
('S02', 'Down to the Waterline', '00:03:55', 'A01', 2),
('S03', 'Lady Writer', '00:03:45', 'A02', 1),
('S04', 'Once Upon a Time in the West', '00:05:25', 'A02', 2),
('S05', 'Tunnel of Love', '00:08:11', 'A03', 1),
('S06', 'Romeo and Juliet', '00:06:00', 'A03', 2),
('S07', 'Telegraph Road', '00:14:18', 'A04', 1),
('S08', 'Private Investigations', '00:06:46', 'A04', 2),
('S09', 'So Far Away', '00:05:12', 'A05', 1),
('S10', 'Money for Nothing', '00:08:26', 'A05', 2),
('S11', 'Walk of Life', '00:04:12', 'A05', 3),
('S12', 'Brothers in Arms', '00:07:00', 'A05', 4),
('S13', 'Calling Elvis', '00:06:26', 'A06', 1),
('S14', 'Heavy Fuel', '00:05:10', 'A06', 2),
('S15', 'On Every Street', '00:05:04', 'A06', 3);

-- Unas consultillas, ¿no German?
-- Artistas que se apellidan Knopfler y qué tocan.
SELECT nombre, instrumento 
FROM artistas 
WHERE apellidos = 'Knopfler';

-- Cuenta el número total de discos 
SELECT COUNT(*) AS total_discos 
FROM albumes;

-- Subconsulta que relaciones artistas y albumes.
SELECT nombre, apellidos, instrumento
FROM artistas
WHERE id_artista IN 
(SELECT id_artista 
FROM album_artistas 
WHERE id_album = 'A05');

-- Subconsulta que relaciona conciertos y tours
SELECT fecha, ciudad, pais
FROM Conciertos
WHERE id_tour = 
(SELECT id_tour 
FROM tour 
WHERE nombre = 'On Every Street Tour');

-- Subconsulta que relaciona los artistas y numero total de albumes en orden descendente
SELECT nombre, apellidos, 
(SELECT COUNT(*) 
FROM album_artistas 
WHERE album_artistas.id_artista = artistas.id_artista) AS total_albumes
FROM artistas
ORDER BY total_albumes DESC;

-- Cuenta el numero de conciertos por paises
SELECT pais, COUNT(id_concierto) AS numero_conciertos
FROM Conciertos
GROUP BY pais
ORDER BY numero_conciertos DESC;

-- Relaciona los álbumes, y los ordena por duracion, siempre que tenga mas de 5 canciones.
SELECT nombre AS disco, duracion, numero_canciones
FROM albumes
WHERE numero_canciones > 5
GROUP BY id_album, nombre, duracion, numero_canciones;

-- hacemos la misma consulta de otra manera:
SELECT nombre AS disco, duracion, numero_canciones
FROM albumes
GROUP BY id_album, nombre, duracion, numero_canciones
HAVING numero_canciones > 5;

-- Relaciona el concierto con el tour
SELECT Conciertos.ciudad, Conciertos.fecha, tour.nombre AS Nombre_Gira
FROM Conciertos
JOIN tour ON Conciertos.id_tour = tour.id_tour;

-- La misma de antes con left join
SELECT Conciertos.ciudad, Conciertos.fecha, tour.nombre AS Nombre_Gira
FROM Conciertos
LEFT JOIN tour ON Conciertos.id_tour = tour.id_tour;

-- Relaciona los artistas con los albumes que han tocado.
SELECT artistas.nombre, artistas.apellidos, album_artistas.id_album
FROM artistas
JOIN album_artistas ON artistas.id_artista = album_artistas.id_artista;

-- la madre de todas las consultas: Unimos varias columnas, por un lado album_artista y por otro albumes, que los une a los de artistas, los agroupamos y añadimos un having.
SELECT artistas.nombre, artistas.apellidos, SUM(albumes.duracion) AS minutos_totales
FROM artistas
JOIN album_artistas ON artistas.id_artista = album_artistas.id_artista
JOIN albumes ON album_artistas.id_album = albumes.id_album
GROUP BY artistas.id_artista, artistas.nombre, artistas.apellidos
HAVING minutos_totales > 4000
ORDER BY minutos_totales DESC;

-- Añadiremos un par de consultas sobre la tabla nueva de canciones (habia hecho solo 5 tablas y he tenido que añadir una mas a posteriori)
-- Para encontrar canciones con una duración superior a la media
SELECT titulo, duracion, id_album
FROM canciones
WHERE duracion > (SELECT AVG(duracion) FROM canciones)
ORDER BY duracion DESC;

-- Aqui buscamos las canciones largas (> 5 min) y el nombre del album
SELECT c.titulo AS Cancion, c.duracion AS Duracion, a.nombre AS Album
FROM canciones c
JOIN albumes a ON c.id_album = a.id_album
WHERE c.duracion > '00:05:00'
ORDER BY c.duracion DESC;

-- Procedimientos

DELIMITER //

CREATE PROCEDURE ConsultarConciertos
(IN p_pais varchar(50))
BEGIN

SELECT fecha, ciudad, pais
FROM Conciertos
WHERE pais = p_pais
ORDER BY fecha ASC; 

END //
DELIMITER ;

CALL ConsultarConciertos('España');
CALL ConsultarConciertos('Reino Unido');
CALL ConsultarConciertos('Andorra'); -- no muestra ninguno porque no hay

DELIMITER //

DELIMITER //

CREATE PROCEDURE BuscarCancion
(IN p_texto VARCHAR(50))
BEGIN
SELECT titulo, duracion, id_album
FROM canciones
WHERE titulo LIKE CONCAT('%', p_texto, '%');
END //

DELIMITER ;

CALL BuscarCancion('Swing'); 
CALL BuscarCancion('Love');

-- Funciones

DELIMITER //

CREATE FUNCTION CalcularSegundos(duracion TIME) 
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIME_TO_SEC(duracion);
END //

DELIMITER ;

SELECT titulo, duracion, CalcularSegundos(duracion) AS 'Tiempo en Segundos'
FROM canciones;

DELIMITER //

CREATE FUNCTION DiscoLargo(p_cantidad INT) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    IF p_cantidad > 8 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END //

DELIMITER ;

-- (si quisieramos que no salieran números si no ''sí'' o ''no'', deberiamos hacer returns varchar(2) y ya)

SELECT nombre, numero_canciones, DiscoLargo(numero_canciones) AS '¿Es_Largo?'
FROM albumes;

-- Vamos ahora con los triggers

DELIMITER //

CREATE TRIGGER tr_instrumentoDefecto
BEFORE INSERT ON artistas
FOR EACH ROW
BEGIN
    IF NEW.instrumento IS NULL THEN
        SET NEW.instrumento = 'Voz';
    END IF;
END //

DELIMITER ;

-- Vamos a comprobarlo, me han dicho que German ahora es músico:
INSERT INTO artistas (id_artista, nombre, apellidos, instrumento) 
VALUES ('G67', 'German', 'Calvo', NULL);
SELECT * FROM artistas WHERE id_artista = 'G67';

DELIMITER //

CREATE TRIGGER tr_paisMayusculas
BEFORE INSERT ON Conciertos
FOR EACH ROW
BEGIN
    SET NEW.pais = UPPER(NEW.pais);
END //

DELIMITER ;

-- un poco chorra pero no se me ocurria otro, vamos a comprobar:
INSERT INTO Conciertos (id_concierto, fecha, ciudad, pais, id_tour) 
VALUES ('C99', '2026-05-20', 'Andorra', 'España', 'T05');

SELECT * FROM Conciertos WHERE id_concierto = 'C99';



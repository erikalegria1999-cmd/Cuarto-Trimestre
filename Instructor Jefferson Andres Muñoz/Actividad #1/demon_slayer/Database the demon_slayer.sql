CREATE DATABASE IF NOT EXISTS demon_slayer; 
USE demon_slayer; 

CREATE TABLE escuadron ( 
id_escuadron INT PRIMARY KEY AUTO_INCREMENT, 
nombre VARCHAR(100) NOT NULL, 
ubicacion VARCHAR(100), 
nivel VARCHAR(50) 
); 
CREATE TABLE cazador ( 
id_cazador INT PRIMARY KEY AUTO_INCREMENT, 
nombre VARCHAR(100) NOT NULL, 
apellido VARCHAR(100) NOT NULL, 
rango VARCHAR(50), 
respiracion VARCHAR(100), 
edad INT, 
id_escuadron INT, 
CONSTRAINT fk_cazador_escuadron 
FOREIGN KEY (id_escuadron) 
REFERENCES escuadron(id_escuadron) 
); 
INSERT INTO escuadron 
(nombre, ubicacion, nivel) 
VALUES 
('Escuadrón Mariposa', 'Mansión Mariposa', 'Alto'), 
('Escuadrón Agua', 'Monte Sagiri', 'Medio'), 
('Escuadrón Llamas', 'Región del Fuego', 'Alto'), 
('Escuadrón Viento', 'Montañas', 'Medio'), 
('Escuadrón Niebla', 'Bosque de Niebla', 'Alto'), 
('Escuadrón Sonido', 'Distrito del Entretenimiento', 'Alto'), 
('Escuadrón Serpiente', 'Región Central', 'Medio'), 
('Escuadrón Amor', 'Región Este', 'Alto'), 
('Escuadrón Bestia', 'Montañas Nevadas', 'Medio'), 
('Escuadrón Insecto', 'Mansión Mariposa', 'Alto'); 
INSERT INTO cazador 
(nombre, apellido, rango, respiracion, edad, id_escuadron) 
VALUES 
('Tanjiro', 'Kamado', 'Kanoe', 'Respiración del Agua', 15, 2), 
('Zenitsu', 'Agatsuma', 'Kanoe', 'Respiración del Trueno', 16, 3), 
('Inosuke', 'Hashibira', 'Kanoe', 'Respiración de la Bestia', 15, 9), 
('Kanao', 'Tsuyuri', 'Tsuchinoto', 'Respiración de la Flor', 16, 1), 
('Genya', 'Shinazugawa', 'Kanoe', 'Sin respiración', 16, 4), 
('Aoi', 'Kanzaki', 'Kanoe', 'Respiración del Agua', 16, 1), 
('Murata', 'Murata', 'Mizunoto', 'Respiración del Agua', 18, 2), 
('Giyu', 'Tomioka', 'Hashira', 'Respiración del Agua', 21, 2), 
('Kyojuro', 'Rengoku', 'Hashira', 'Respiración de la Llama', 20, 3), 
('Tengen', 'Uzui', 'Hashira', 'Respiración del Sonido', 23, 6), 
('Mitsuri', 'Kanroji', 'Hashira', 'Respiración del Amor', 19, 8), 
('Muichiro', 'Tokito', 'Hashira', 'Respiración de la Niebla', 14, 5), 
('Shinobu', 'Kocho', 'Hashira', 'Respiración del Insecto', 18, 10), 
('Sanemi', 'Shinazugawa', 'Hashira', 'Respiración del Viento', 21, 4), 
('Obanai', 'Iguro', 'Hashira', 'Respiración de la Serpiente', 21, 7), 
('Sakonji', 'Urokodaki', 'Instructor', 'Respiración del Agua', 50, 2), 
('Jigoro', 'Kuwajima', 'Instructor', 'Respiración del Trueno', 60, 3), 
('Kanae', 'Kocho', 'Hashira', 'Respiración de la Flor', 17, 1), 
('Masachika', 'Kumeno', 'Cazador', 'Respiración del Viento', 18, 4), 
('Sabito', 'Sabito', 'Cazador', 'Respiración del Agua', 13, 2), 
('Makomo', 'Makomo', 'Cazador', 'Respiración de la Flor', 13, 1), 
('Aoi', 'Kanzaki', 'Cazador', 'Respiración del Agua', 16, 1), 
('Goto', 'Goto', 'Cazador', 'Sin respiración', 20, 6), 
('Ozaki', 'Ozaki', 'Cazador', 'Respiración del Agua', 17, 2), 
('Takeuchi', 'Takeuchi', 'Cazador', 'Respiración del Viento', 19, 4), 
('Murata', 'Murata', 'Cazador', 'Respiración del Agua', 18, 2), 
('Haganezuka', 'Hotaru', 'Herrero', 'Sin respiración', 37, 5), 
('Kozo', 'Kanao', 'Cazador', 'Respiración de la Flor', 18, 1), 
('Kagaya', 'Ubuyashiki', 'Líder', 'Sin respiración', 23, 5), 
('Amane', 'Ubuyashiki', 'Líder', 'Sin respiración', 27, 5); 

#Realice una consulta utilizando CROSS JOIN que muestre: 
#• Nombre del cazador. 
#• Apellido del cazador. 
#• Nombre del escuadrón. 

select concat_ws(" ", cazador.nombre,cazador.apellido) as "nombre completo",
escuadron.nombre as "Nombre Del Escuadron"
from cazador
cross join escuadron;

# El líder de los cazadores quiere analizar las posibles combinaciones entre cazadores 
# y escuadrones de nivel Alto. 
# Utilice CROSS JOIN para mostrar: 
# • Nombre completo del cazador. 
# • Nombre del escuadrón. 
# • Nivel del escuadrón. 
# Muestre únicamente los escuadrones cuyo nivel sea Alto.
 
select concat_ws(" ", cazador.nombre,cazador.apellido) as "nombre completo",
escuadron.nombre as "Nombre Del Escuadron" , escuadron.nivel
from cazador
cross join escuadron
where escuadron.nivel = "alto";
# Ejercicio 3 – INNER JOIN 
# Muestre los cazadores junto con el escuadrón al que realmente pertenecen. 
# La consulta debe mostrar: 
# • Nombre completo del cazador. 
# • Rango. 
# • Respiración. 
# • Nombre del escuadrón. 
# Utilice INNER JOIN. 

select concat_ws(" ", cazador.nombre, cazador.apellido) as "Nombre Completo",
 cazador.rango , cazador.respiracion, escuadron.nombre as "Nombre Escuadron"
 from cazador
 inner join escuadron;

# Ejercicio 4 – INNER JOIN con condición 
# Los responsables de entrenamiento necesitan conocer los cazadores que pertenecen 
# a escuadrones de nivel Alto. 
# Muestre: 
# • Nombre completo del cazador. 
# • Rango. 
# • Respiración. 
# • Nombre del escuadrón. 
# • Nivel del escuadrón. 
# Utilice INNER JOIN y muestre únicamente los escuadrones de nivel Alto. 
select escuadron.nombre as "Nombre Escuadron", nivel
 from cazador
 inner join escuadron
 where nivel = "alto";
 
# Ejercicio 5 – Comparación CROSS JOIN e INNER JOIN 
# Realice dos consultas diferentes: 
# Consulta A 
# Utilice CROSS JOIN para mostrar todas las combinaciones posibles entre cazadores y 
# escuadrones.

SELECT CONCAT_WS(' ', cazador.nombre, cazador.apellido) AS "nombre completo",
       escuadron.nombre AS "Nombre del Escuadron"
FROM cazador
CROSS JOIN escuadron;

 
# Consulta B 
# Utilice INNER JOIN para mostrar únicamente las combinaciones que representan una 
# relación real entre un cazador y su escuadrón.

# CROSS JOIN
SELECT COUNT(*) AS total
FROM cazador
CROSS JOIN escuadron;
# INNER JOIN
SELECT COUNT(*) AS total
FROM cazador
INNER JOIN escuadron
ON cazador.id_escuadron = escuadron.id_escuadron;


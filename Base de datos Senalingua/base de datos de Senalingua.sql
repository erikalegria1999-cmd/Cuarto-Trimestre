create database senalingua;
use senalingua;
#emmanuel
create table roles(
idrol int unsigned auto_increment primary key not null,
nombrerol varchar(30) not null);
desc roles;
create table usuarios(
idusuario int unsigned auto_increment primary key not null,
correo varchar(150) not null,
id_rol int unsigned not null,
contraseña varchar(255) not null,
nombre varchar(60) not null,
apellidos varchar(60) not null,
fecha_registro datetime not null, 
foreign key (id_rol) references roles(idrol)); 
desc usuarios;
#andres
CREATE TABLE pruebasDiagnosticas (
    id_prueba INT AUTO_INCREMENT,
    titulo_prueba VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_prueba)
);
CREATE TABLE preguntas (
    id_pregunta INT AUTO_INCREMENT,
    id_prueba INT NOT NULL,
    enunciado TEXT NOT NULL,
    opcion_a VARCHAR(255) NOT NULL,
    opcion_b VARCHAR(255) NOT NULL,
    opcion_c VARCHAR(255) NOT NULL,
    opcion_d VARCHAR(255) NOT NULL,
    respuesta_correcta ENUM('A', 'B', 'C', 'D') NOT NULL,
    habilidad_MCER ENUM('Reading', 'Listening', 'Speaking', 'Writing') NOT NULL,
    PRIMARY KEY (id_pregunta),
    CONSTRAINT fk_preguntas_pruebas FOREIGN KEY (id_prueba) REFERENCES pruebasDiagnosticas(id_prueba) 
);
CREATE TABLE resultadosDiagnosticos (
    id_resultado INT AUTO_INCREMENT,
    id_usuario INT NOT NULL, 
    id_prueba INT NOT NULL,
    puntaje_global DECIMAL(5,2) NOT NULL,
    nivel_sugerido ENUM('A1', 'A2', 'B1') NOT NULL,
    fecha_evaluacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_resultado),
    CONSTRAINT fk_resultados_pruebas FOREIGN KEY (id_prueba) REFERENCES pruebasDiagnosticas(id_prueba) 
);
#cristian }
create table Aulas (
	id_aula int unsigned auto_increment primary key,
	codigo_aula varchar(10) unique not null,
	nombre_aula varchar(100) not null,
	ficha_SENA varchar(20) not null,
	id_instructor int unsigned,
	fecha_creacion datetime,
    foreign key (id_instructor) references usuarios(idusuario)
);

create table matriculaAula (
    id_usuario int unsigned,
    id_aula int unsigned,
    fecha_inscripcion datetime,
    primary key (id_usuario, id_aula),
    foreign key (id_usuario) references usuarios(idusuario),
    foreign key (id_aula) references Aulas(id_aula)
);
#erik Santiago Alegria 
create table rutaAprendizaje (
    id_ruta int auto_increment primary key,
    id_usuario int unsigned not null,
    fecha_asignacion datetime,
    foreign key (id_usuario) references usuarios(idusuario)
);
 create table modulosTematicos (
 id_modulo int auto_increment primary key,
 codigo_modulo varchar(20) unique,
 titulo_modulo varchar (100),
 nivel_MCER enum ("A1","A2","B1") 
 );
 create table rutaModulo (
    id_ruta int,
    id_modulo int,
    posición_secuencial int,
    primary key (id_ruta, id_modulo),
    foreign key (id_ruta) references rutaAprendizaje(id_ruta),
    foreign key (id_modulo) references modulosTematicos(id_modulo)
);
 create table lecciones (
 primary key(id_leccion,id_modulo),
 id_leccion int auto_increment,
 id_modulo int,
 titulo_leccion varchar(150),
 orden int
 );
 create table actividades(
 id_actividad int auto_increment primary key,
 id_leccion int,
 nombre_actividad varchar(150),
 tipo_habilidad enum ("reading","listening","speaking","writing"),
 foreign key (id_leccion) references lecciones(id_leccion)
 );
 
create table progresoLecciones (
    id_progreso int auto_increment primary key,
    id_usuario int unsigned,
    id_leccion int,
    completado tinyint(1),
    fecha_cambio datetime,
    foreign key (id_usuario) references usuarios(idusuario),
    foreign key (id_leccion) references lecciones(id_leccion)
);
create table  retosAplicados(
id_reto int auto_increment primary key,
id_modulo int,
titulo_reto varchar(150),
foreign key (id_modulo) references modulosTematicos(id_modulo)
);
create table intentosReto (
id_intento int primary key,
id_usuario int,
id_reto int,
nota_intento decimal(5,2),
fecha_intento datetime,
foreign key(id_usuario) references usuarios(idusuario),
foreign key(id_reto) references retosAplicados(id_reto)
);
create table historialPuntos  (
id_historial int auto_increment primary key,
id_usuario int unsigned,
puntos_obtenidos int,
racha_actual int,
logro_desbloqueado varchar(500),
racha_registro datetime,
foreign key (id_usuario) references usuarios(idusuario)
);


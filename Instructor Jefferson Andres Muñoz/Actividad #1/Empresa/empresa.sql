CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

CREATE TABLE departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(100),
    presupuesto DECIMAL(12,2)
);

CREATE TABLE empleado (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    cargo VARCHAR(100),
    salario DECIMAL(10,2),
    fecha_ingreso DATE,
    id_departamento INT,
     CONSTRAINT fk_empleado_departamento
        FOREIGN KEY (id_departamento)
        REFERENCES departamento(id_departamento)
);
INSERT INTO departamento
(nombre, ubicacion, presupuesto)
VALUES
('Recursos Humanos', 'Piso 1', 150000.00),
('Sistemas', 'Piso 2', 350000.00),
('Contabilidad', 'Piso 2', 220000.00),
('Ventas', 'Piso 3', 300000.00),
('Marketing', 'Piso 3', 250000.00),
('Producción', 'Piso 4', 500000.00),
('Logística', 'Piso 4', 280000.00),
('Atención al Cliente', 'Piso 1', 180000.00),
('Investigación y Desarrollo', 'Piso 5', 450000.00),
('Administración', 'Piso 1', 200000.00);

INSERT INTO empleado
(nombre, apellido, cargo, salario, fecha_ingreso, id_departamento)
VALUES

('Carlos', 'Martínez', 'Analista de Recursos Humanos', 2800000, '2021-02-15', 1),
('Laura', 'Gómez', 'Coordinadora de Recursos Humanos', 4200000, '2019-06-10', 1),
('Andrés', 'Rodríguez', 'Auxiliar de Recursos Humanos', 2200000, '2022-08-01', 1),
('Mariana', 'López', 'Psicóloga Organizacional', 3500000, '2020-03-20', 1),
('Sofía', 'Ramírez', 'Asistente de Recursos Humanos', 2400000, '2023-01-16', 1),

('Juan', 'Pérez', 'Desarrollador Backend', 4800000, '2020-01-13', 2),
('Camila', 'Torres', 'Desarrolladora Frontend', 4500000, '2021-04-19', 2),
('David', 'Hernández', 'Administrador de Bases de Datos', 5200000, '2019-11-04', 2),
('Valentina', 'Castro', 'Ingeniera de Software', 5500000, '2018-07-23', 2),
('Sebastián', 'Morales', 'Soporte Técnico', 2800000, '2023-02-06', 2),
('Daniel', 'Vargas', 'Analista de Sistemas', 3900000, '2022-05-16', 2),
('Natalia', 'Rojas', 'Desarrolladora Full Stack', 5000000, '2021-09-27', 2),

('Miguel', 'Sánchez', 'Contador', 4300000, '2019-03-11', 3),
('Paula', 'Mendoza', 'Auxiliar Contable', 2500000, '2022-06-13', 3),
('Fernando', 'Ortega', 'Analista Financiero', 4000000, '2020-08-17', 3),
('Diana', 'Navarro', 'Contadora Senior', 5200000, '2018-10-22', 3),
('Ricardo', 'Silva', 'Auxiliar Contable', 2300000, '2023-03-06', 3),

('Jorge', 'Moreno', 'Ejecutivo de Ventas', 2800000, '2022-01-17', 4),
('Alejandra', 'Jiménez', 'Gerente de Ventas', 5500000, '2018-05-14', 4),
('Felipe', 'Cárdenas', 'Asesor Comercial', 2600000, '2021-07-19', 4),
('Gabriela', 'Reyes', 'Ejecutiva de Ventas', 2900000, '2020-11-09', 4),
('Óscar', 'Pineda', 'Supervisor de Ventas', 3900000, '2019-09-30', 4),

('Cristian', 'Molina', 'Diseñador Gráfico', 3200000, '2021-02-08', 5),
('Andrea', 'Suárez', 'Especialista en Marketing', 3800000, '2020-06-15', 5),
('Esteban', 'Vega', 'Community Manager', 2800000, '2022-09-12', 5),
('Tatiana', 'Fuentes', 'Analista de Marketing', 3500000, '2021-11-01', 5),
('Nicolás', 'Peña', 'Coordinador de Marketing', 4500000, '2019-04-22', 5),

('Héctor', 'Ramírez', 'Supervisor de Producción', 4200000, '2018-03-12', 6),
('Luisa', 'Bermúdez', 'Operaria de Producción', 2400000, '2022-02-21', 6),
('Manuel', 'Duarte', 'Técnico de Producción', 3000000, '2020-09-07', 6),
('Carolina', 'Espinosa', 'Ingeniera de Producción', 4800000, '2019-07-15', 6),
('Wilson', 'Acosta', 'Operario de Producción', 2300000, '2023-04-03', 6),

('José', 'Quintero', 'Coordinador Logístico', 4000000, '2019-02-18', 7),
('Mónica', 'Salazar', 'Analista de Logística', 3300000, '2021-05-10', 7),
('Diego', 'Correa', 'Auxiliar de Bodega', 2200000, '2022-10-03', 7),
('Sandra', 'Nieto', 'Supervisora de Transporte', 3700000, '2020-01-27', 7),
('Álvaro', 'Restrepo', 'Auxiliar Logístico', 2300000, '2023-05-08', 7),

('Patricia', 'Vélez', 'Asesora de Servicio', 2700000, '2021-03-15', 8),
('Kevin', 'Montoya', 'Asesor de Servicio', 2500000, '2022-07-11', 8),
('Isabela', 'Gutiérrez', 'Supervisora de Servicio', 3600000, '2019-08-26', 8),
('Mauricio', 'León', 'Analista de Servicio', 3000000, '2020-12-07', 8),

('Santiago', 'Cruz', 'Desarrollador de Investigación', 5000000, '2019-01-21', 9),
('Juliana', 'Parra', 'Investigadora', 4800000, '2020-04-13', 9),
('Mateo', 'Valencia', 'Ingeniero de Investigación', 5200000, '2018-09-17', 9),
('Sara', 'Bustos', 'Analista de Innovación', 4300000, '2021-10-25', 9),

('Roberto', 'Gómez', 'Administrador', 4000000, '2018-02-12', 10),
('Claudia', 'Rincón', 'Asistente Administrativa', 2600000, '2022-03-21', 10),
('Gustavo', 'Mora', 'Coordinador Administrativo', 4200000, '2019-06-24', 10),
('Verónica', 'Soto', 'Auxiliar Administrativa', 2300000, '2023-01-09', 10);

select  concat_ws(" ",empleado.nombre , empleado.apellido) as "nombre y apellido" , departamento.nombre as depto
from empleado 
inner join  departamento 
on empleado.id_departamento = departamento.id_departamento ;






create database Edulang;

/*Use*/
use Edulang;
use master;

/*Drops*/
drop database Edulang;

/*TABLAS*/
CREATE TABLE Rol (
    rol_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL
);

CREATE TABLE Usuario (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    apellido_usuario VARCHAR(50) NOT NULL,
    correo_usuario VARCHAR(100) UNIQUE NOT NULL,
    contraseña_usuario VARCHAR(255) NOT NULL,
    rol_id INT NOT NULL,
    FOREIGN KEY (rol_id) REFERENCES Rol(rol_id)
);

CREATE TABLE Alumno (
    alumno_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_alumno varchar (60) NOT NULL,
    apellidos_alumno varchar (60) NOT NULL,
    matricula_alumno VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Profesor (
    profesor_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_profesor varchar (60) NOT NULL,
    apellidos_profesor varchar (60) NOT NULL
);

CREATE TABLE Curso (
    curso_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_curso VARCHAR(100) NOT NULL,
    descripcion TEXT,
    nivel_curso VARCHAR(20) NOT NULL,
    idioma_curso VARCHAR(50) NOT NULL,
    profesor_id INT,
    FOREIGN KEY (profesor_id) REFERENCES Profesor(profesor_id)
);

CREATE TABLE Inscripcion (
    inscripcion_id INT AUTO_INCREMENT PRIMARY KEY,
    alumno_id INT NOT NULL,
    curso_id INT NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    FOREIGN KEY (alumno_id) REFERENCES Alumno(alumno_id),
    FOREIGN KEY (curso_id) REFERENCES Curso(curso_id)
);

CREATE TABLE Kardex (
    kardex_id INT AUTO_INCREMENT PRIMARY KEY,
    alumno_id INT NOT NULL,
    curso_id INT NOT NULL,
    calificacion DECIMAL(5,2),
    fecha_evaluacion DATE,
    FOREIGN KEY (alumno_id) REFERENCES Alumno(alumno_id),
    FOREIGN KEY (curso_id) REFERENCES Curso(curso_id)
);

CREATE TABLE Foro (
    foro_id INT AUTO_INCREMENT PRIMARY KEY,
    tema_foro VARCHAR(100) NOT NULL,
    fecha_craecion DATE NOT NULL,
    curso_id INT NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES Curso(curso_id)
);

CREATE TABLE Aporte (
    aporte_id INT AUTO_INCREMENT PRIMARY KEY,
    contenido TEXT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    usuario_id INT NOT NULL,
    foro_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id),
    FOREIGN KEY (foro_id) REFERENCES Foro(foro_id)
);

CREATE TABLE Horario (
    horario_id INT AUTO_INCREMENT PRIMARY KEY,
    dia_semana ENUM('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado') NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    curso_id INT NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES Curso(curso_id)
);

/*POBLACIÓN DE BASES DE DATOS*/
/*Roles*/
insert into Rol(nombre_rol) values('Estudiante');
insert into Rol(nombre_rol) values('Profesor');
insert into Rol(nombre_rol) values('Administrador');

/*Usuarios*/
insert into Usuario (nombre_usuario, apellido_usuario, correo_usuario, contraseña_usuario, rol_id) values ('Joseph Alexander', 'Martinez Cortes', '21240551@leon.tecnm.mx', '123456789', 1);/**/
insert into Usuario (nombre_usuario, apellido_usuario, correo_usuario, contraseña_usuario, rol_id) values ('Joseph Alexander', 'Martinez Cortes', '21240551@leon.tecnm.mx', '123456789', 1);
insert into Usuario (nombre_usuario, apellido_usuario, correo_usuario, contraseña_usuario, rol_id) values ('Joseph Alexander', 'Martinez Cortes', '21240551@leon.tecnm.mx', '123456789', 1);

select * from usuario;

/*Profesores y alumnos (SUPONGAMOS QUE NO TENEMOS LA BASE DE DATOS DEL TEC*/
insert into Profesor(nombre_profesor, apellidos_profesor) values ('Juan Rodolfo', 'Herrera Portero');
insert into Alumno (nombre_alumno, apellidos_alumno, matricula_alumno) values ('Joseph Alexander', 'Martinez Cortes', '21240551');

/*Cursos*/
insert into Curso (nombre_curso, descripcion, nivel_cursp, idioma_curso, profesor_id) values ('Curso intermedio', "Este es un curso intermedio", 'Nivel intermedio', 'Inglés', 1);

/*Inscripciones*/
insert into Inscripcion (alumno_id, curso_id, fecha_inscripcion) values (1, 1, "2026-01-09");

/*Kardex*/


create database studentHomework;
use studentHomework;
#SET SQL_SAFE_UPDATES = 0;
create table materia(
idmateria int not null AUTO_INCREMENT,
Nombre varchar (50),
primary key (idmateria)
);
ALTER TABLE `studenthomework`.`materia` 
ADD UNIQUE INDEX `Nombre_UNIQUE` (`Nombre` ASC) VISIBLE;
;
create table Grado(
id_gd int not null auto_increment,
Nombre varchar (50),
Estado_gr varchar(50),
primary key (id_gd)
);
ALTER TABLE `studenthomework`.`grado` 
ADD UNIQUE INDEX `Nombre_UNIQUE` (`Nombre` ASC) VISIBLE;
;

create table Seccion(
id_sc int not null AUTO_INCREMENT,
seccion varchar (50),
Estado_sec varchar(50),
primary key (id_sc)
);
ALTER TABLE `studenthomework`.`seccion` 
ADD UNIQUE INDEX `seccion_UNIQUE` (`seccion` ASC) VISIBLE;
;

create table director
(
id_director int not null AUTO_INCREMENT,
nombre varchar (50),
apellido varchar (50),
contrasena varchar(50),
nit varchar(50),
dui varchar (50),
telefono varchar(50),
Edad int,
turno varchar(50),
Estado varchar(50),
fecha date,
Tipol varchar (50),
primary key (id_director)
);
ALTER TABLE `studenthomework`.`director` 
ADD UNIQUE INDEX `contrasena_UNIQUE` (`contrasena` ASC) VISIBLE;
;

create table est_estudiante
(
id_est int not null AUTO_INCREMENT,
est_Nombre varchar (50),
est_Apellido varchar (50),
est_Encargado varchar (50) not null,
est_Telefono varchar (50) not null,
est_Direccion varchar (50) not null,
Cod_estGra int,
Cod_estSc int,
est_Edad varchar (50),
est_Fecha date,
est_tipo varchar (50),
est_RpGrado varchar(50),
est_pass varchar(50),
foreign key (Cod_estGra) references Grado(id_gd),
foreign key (Cod_estSc) references Seccion(id_sc),
primary key (id_est)
);
ALTER TABLE `studenthomework`.`est_estudiante` 
ADD UNIQUE INDEX `est_pass_UNIQUE` (`est_pass` ASC) VISIBLE;
;
create table Docente
(
id_docente int not null auto_increment,
Nombre_Dct varchar(50),
Apellido_Dct varchar (100),
Dui varchar(50),
Telefono varchar(50),
Edad  int,
Contrasena varchar(50),
Turno varchar(50),
Estado varchar(50),
Direccion varchar(50),
FechaNacimiento date,
Tipol varchar (50),
primary key (id_docente)
);
ALTER TABLE `studenthomework`.`docente` 
ADD UNIQUE INDEX `Contrasena_UNIQUE` (`Contrasena` ASC) VISIBLE;
;
create table cursos
(
id_Cur int not null auto_increment,
Nombre varchar (50), #periodos
cod_Docente int,
cod_Mate int,
Cod_Seccion int,
foreign key (cod_Mate) references materia(idmateria),
foreign key (cod_Docente) references Docente(id_docente),
foreign key (Cod_Seccion) references Seccion(id_sc),
Estado varchar(50),
primary key (id_Cur)
);

create table CursosAlumnos
(
iddetalle2 int not null auto_increment,
cod_est int,
cod_cursos int,
foreign key (cod_est) references est_estudiante(id_est),
foreign key (cod_cursos) references cursos(id_Cur),
primary key (iddetalle2)
);

create table Actividad
(
idcodAct int not null auto_increment,
Nombre varchar (50),
Ponderacion varchar(50),
Estado varchar(50),
cod_cursos int,
foreign key (cod_cursos) references cursos(id_Cur),
primary key (idcodAct)
);

create table Tareas
(
idT int not null auto_increment,
Poncentaje varchar(50),-- 70%/100%
codActi int,
codAlumno int,
Url varchar(50),
estado varchar(50),
foreign key (codActi) references Actividad(idcodAct),
foreign key (codAlumno) references est_estudiante(id_est),
primary key (idT)
);
#drop table Tareas;
insert into director (nombre,apellido,contrasena, nit, dui, telefono, Edad, turno, Estado, fecha,Tipol)
values ("director1", "monge", "1234", "111234567","123456789","123456","20","Mañana","Activo","2000/08/17", "Abminitrador");
insert into director (nombre,apellido,contrasena, nit, dui, telefono, Edad, turno, Estado, fecha,Tipol)
values ("director2", "monge", "12345", "111234567","123456789","123456","20","Mañana","Desactivado","2000/08/17", "Abminitrador");
insert into docente (Nombre_Dct,Apellido_Dct,Direccion,Dui,telefono, Edad, Contrasena, turno, Estado, FechaNacimiento, Tipol)
values ("docente1", "monge", "SU CASA", "111234567","8888-8888","20","12345","noche","Activo","2000/08/17","Maestro");
insert into docente (Nombre_Dct,Apellido_Dct,Direccion,Dui,telefono, Edad, Contrasena, turno, Estado, FechaNacimiento, Tipol)
values ("docente2", "monge", "SU CASA", "111234567","8888-8888","20","1234","noche","Activo","2000/08/17","Maestro");
insert into materia(Nombre) values("Matematicas");
insert into materia(Nombre) values("Ciencias");
insert into materia(Nombre) values("Lenguaje");
insert into materia(Nombre) values("Sociales");
insert into materia(Nombre) values("Artistica");
insert into seccion(seccion,Estado_sec) values("A","activo");
insert into seccion(seccion,Estado_sec) values("B","activo");
insert into seccion(seccion,Estado_sec) values("c","activo");
insert into grado(Nombre,Estado_gr) values("Primero","activo");
insert into grado(Nombre,Estado_gr) values("Segundo","activo");
insert into grado(Nombre,Estado_gr) values("Tercero","activo");
insert into cursos(Nombre,cod_Docente,cod_Mate,Cod_Seccion,Estado) values("Matematicas",1,1,1,"Visible");
insert into cursos(Nombre,cod_Docente,cod_Mate,Cod_Seccion,Estado) values("ciencias",1,2,2,"Visible");
insert into cursos(Nombre,cod_Docente,cod_Mate,Cod_Seccion,Estado) values("ciencias",2,2,2,"Visible");
INSERT INTO `studenthomework`.`est_estudiante`(`est_Nombre`,`est_Apellido`,`est_Encargado`,`est_Telefono`,`est_Direccion`,`Cod_estGra`,
`Cod_estSc`,`est_Edad`,`est_Fecha`,`est_tipo`,`est_RpGrado`,`est_pass`)
VALUES("estudiante1","hernandez","mama","7777-7777","su casa",1,1,"12","2000/08/15","alumno","no","12345");
INSERT INTO `studenthomework`.`est_estudiante`(`est_Nombre`,`est_Apellido`,`est_Encargado`,`est_Telefono`,`est_Direccion`,`Cod_estGra`,
`Cod_estSc`,`est_Edad`,`est_Fecha`,`est_tipo`,`est_RpGrado`,`est_pass`)
VALUES("estudiante2","hernandez","mama","7777-7777","su casa",2,1,"12","2000/08/15","alumno","no","1234");
insert into CursosAlumnos(cod_est,cod_cursos) values(1,3);
select * from materia;
select * from seccion;
select * from director;
select * from docente;
select * from est_estudiante;
select * from cursos;
select * from grado;
Select * from CursosAlumnos;
select * from Actividad;
select * from tareas;

-- Vista tareas profesores
select a.Nombre, t.Poncentaje, e.est_Nombre, e.est_Apellido, t.Url, t.codActi, t.codAlumno from tareas t, est_estudiante e, Actividad a
where id_est = codAlumno and idcodAct= codActi and t.estado = "inactivo" and idcodAct=1;

-- Vista tareas estudiantes
select a.Nombre, t.Poncentaje, e.est_Nombre, e.est_Apellido, t.Url from tareas t, est_estudiante e, Actividad a
where id_est = codAlumno and idcodAct= codActi and t.estado = "inactivo" and idcodAct=2 and codAlumno = 1;

-- vista Alumno Cursos Alumnos
Select c.iddetalle2, c.cod_est, c.cod_cursos,t.Nombre_Dct, e.est_Nombre, cc.Nombre, s.seccion, g.Nombre
from CursosAlumnos c, est_estudiante e, cursos cc, materia m, seccion s, grado g, docente t
where cod_est = id_est and cod_cursos = id_Cur and cod_Mate = idmateria and Cod_Seccion = id_sc
and e.Cod_estGra = id_gd  and cc.cod_Docente = t.id_docente and cod_est = 1 and cc.Estado = "Visible" ;

-- vista cursos para profesores
select c.id_Cur, c.Nombre, d.id_docente,d.nombre_Dct, m.nombre,s.seccion, c.estado
FROM cursos as c,Docente as d,Materia as m,Seccion as s where 
d.id_docente = c.cod_Docente and m.idmateria = c.cod_Mate and s.id_sc = c.Cod_Seccion 
 and c.estado ="Visible" and d.id_docente = "1";
 
#use studentHomework;
#drop database studenthomework
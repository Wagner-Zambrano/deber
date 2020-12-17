create table usuario 
(codigo int primary key not null, email varchar(50), nombre varchar(50), direccion varchar (50), ciudad varchar(50), pais varchar(30),genero varchar(30));

insert into usuario (codigo, email, nombre, direccion, ciudad, pais, genero) values
(1, 'w@gmail.com', 'wagner', 'altamira', 'manta', 'ecuador', 'masculino'),
(2, 'n@gmail.com', 'nerexi', '5 de agosto', 'manta', 'ecuador', 'femenino'),
(3, 'c@gmail.com', 'carlos', 'manta 2000', 'manta', 'ecuador', 'masculino'),
(4, 'n@gmail.com', 'naomi', 'cordova', 'manta', 'ecuador', 'femenino'),
(5, 'm@gmail.com', 'manuel', 'astillero', 'manta', 'ecuador', 'masculino'),
(6, 'f@gmail.com', 'fernando', 'las cumbres', 'guayas', 'ecuador', 'masculino'),
(7, 'm@fmail.com', 'maria', 'jocay', 'guayas ', 'ecuador', 'femenino'),
(8, 'd@gmail.com', 'david', 'urbirrio', 'manta', 'ecuador', 'masculino');
select*from usuario;

create table gustos
(codigo int primary key not null, ultima_actividad varchar(30), tipo varchar(30), genero varchar(30), codigo_usuario int,
foreign key (codigo_usuario) references usuario (codigo));

insert into gustos (codigo, ultima_actividad, tipo, genero, codigo_usuario) values
(1, '2020-10-25', 'deporte', 'masculino',1),
(2, '2020-11-15', 'musica', 'femenino',2),
(3, '2020-12-10', 'evento social', 'masculino',3),
(4, '2020-11-30', 'deporte', 'femenino',4),
(5, '2020-12-01', 'musica', 'masculino',5),
(6, '2020-11-05', 'evento social', 'femenino',6),
(7, '2020-12-05', 'deporte', 'masculino',7);
select *from gustos;
drop table gustos;


create table citas 
(codigo int primary key not null, nombre varchar (30), lugar varchar(30), hora time, fecha date, codigo_usuario int);
insert into citas (codigo, nombre, lugar, hora, fecha) values
(1, 'maria', 'restaurante','22:00:00', '2021-06-15'),
(2, 'juan', 'mall', '16:00:00' , '2020-12-25' ),
(3, 'diana', 'shoping', '20:00:00' , '2020-12-30'),
(4, 'pedro', 'piscina', '12:00:00' , '2021-01-02'),
(5, 'diana', 'motel', '15:00:00' , '2020-12-25'),
(6, 'junior', 'restaurante','20:00:00' , '2020-12-31' ),
(7, 'carli', 'mall', '17:00:00' , '2021-01-01' ),
(8, 'jefferson', 'cine', '18:00:00' , '2020-12-25');
select*from citas
drop table citas;



create table estado 
(id int primary key not null, codigo_usuario int, codigo_citas int, descripcion varchar (30), motivo varchar(30),
foreign key (codigo_usuario) references usuario(codigo),
foreign key (codigo_citas) references citas(codigo));

insert into estado (id, codigo_usuario, codigo_citas, descripcion, motivo) values
(101, 1, 1, 'exitosa', '' ),
(102, 2, 2, 'fallida', 'mala presentacion'),
(103, 3, 3, 'exitosa', ''),
(104, 4, 4, 'fallida', 'origen'),
(105, 5, 5, 'exitosa','' ),
(106, 6, 6, 'fallida', 'malos habitos'),
(107, 7, 7, 'exitosa', ''),
(108, 8, 8, 'fallida', 'mala presentacion');
select *from estado;
drop table estado


create table preferencia
(codigo int primary key not null, hobby_nombre varchar (30),
codigo_usuario int,
foreign key (codigo_usuario) references usuario (codigo));

insert into preferencia(codigo, hobby_nombre, codigo_usuario) values
(20, 'futbol',1),
(30, 'cantar',2),
(40, 'fiesta',3),
(50, 'futbol',4),
(60, 'cantar',5),
(70, 'fiesta',6),
(80, 'futbol',7);


drop table usuario;



/*1*/
select ciudad , COUNT (ciudad) as citas_ciegas from usuario
group by ciudad having COUNT (ciudad) > 1;
/*2*/
SELECT        dbo.usuario.genero, dbo.usuario.ciudad , COUNT (genero) AS CITAS_CIUDAD
FROM            dbo.citas INNER JOIN
                         dbo.usuario ON dbo.citas.codigo = dbo.usuario.codigo
GROUP BY dbo.usuario.genero, dbo.usuario.ciudad
HAVING  COUNT (genero)>1


/*3*/
SELECT        TOP (100) PERCENT COUNT(descripcion) AS numero, descripcion, motivo
FROM            dbo.estado
WHERE        (descripcion = 'fallida')
GROUP BY motivo, descripcion
HAVING        (COUNT(descripcion) > '1')


/*4*/
select descripcion , COUNT (descripcion) as citas_ciegas from estado
group by descripcion having COUNT (descripcion) > 1;
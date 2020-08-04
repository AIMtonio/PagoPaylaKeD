


create table clientes(
correo varchar(100) primary key,
telefono bigint,
contrasena varchar(25)
);

create table carrito(
id_carrito int identity primary key,
id_curso int,
correo varchar(100),
foreign key (id_curso) references curso (id_curso) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key (correo) references clientes(correo) ON DELETE CASCADE ON UPDATE CASCADE
);

create table pago(
id_pago int identity primary key,
correo varchar(100),
id_curso int,
status varchar(25),
foreign key (correo) references clientes(correo) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key (id_curso) references curso(id_curso) ON DELETE CASCADE ON UPDATE CASCADE
);



create table videos(
id_video int identity primary key,
url varchar(100),
correo varchar(100),
id_curso int,
status int,
costo float,
foreign key (id_curso) references curso(id_curso) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key (correo) references clientes(correo) ON DELETE CASCADE ON UPDATE CASCADE
);	



imagen (curso)
url (videos)
costo (videos)
status (compra)
where correo, id_curso

create table curso(
id_curso int identity primary key,
nombre varchar(100),
imagen binary,	
descripcion varchar(150),
costo float
);

create table videos(
id_video int identity primary key,
url varchar(100),
id_curso int,
costo float,
foreign key (id_curso) references curso(id_curso) ON DELETE CASCADE ON UPDATE CASCADE
);	

create table compra(
id_compra int identity primary key,
correo varchar(100),
id_video int,
status int,
foreign key (id_video) references videos(id_video) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key (correo) references clientes(correo) ON DELETE CASCADE ON UPDATE CASCADE
);

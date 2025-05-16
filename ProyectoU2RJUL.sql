CREATE DATABASE CONTROBELRJUL;
use CONTROBELRJUL;

create table Empleados(
id_empleado int primary key,
nombre varchar(50),
correo varchar(50),
telefono varchar(50),
puesto ENUM('Administrativo', 'RRHH', 'Ingeniero Nivel 1', 'Ingeniero Nivel 2', 'Ingeniero Nivel 3'),
sueldo decimal(10,2)
);
insert into Empleados
values
('1','Rodrigo','rodo@gmail.com','2839-0389','Administrativo','5000.00'),
('2','Victor','pepeg@gmail.com','3333-3333','RRHH','8000.00'),
('3','Casiano','Celso123@gmail.com','0394-7474','Ingeniero Nivel 1','10000.00'),
('4','Lamine','ryan@gmail.com','0452-3243','Ingeniero Nivel 2','15000.00'),
('5','Ismael','Papin@gmail.com','1234-5678','Ingeniero Nivel 3','20000.00');

create table empresas(
id_empresa int primary key,
nombre varchar(100),
direccion varchar(100),
telefono varchar(20),
contacto_responsable varchar(20)
);
insert into empresas
values
('1','EmpresaA','Zona 4','1234-4321','Luis'),
('2','EmpresaB','Zona 6','8293-1024','Ariana'),
('3','EmpresaC','Zona 21','3849-2020','Camila'),
('4','EmpresaD','Zona 17','1234-5678','Gabriela'),
('5','EmpresaE','Zona 10','1732-0485','Pedro');


create table proveedores(
	id_proveedor int primary key,
    nombre varchar(100),
    contacto varchar(50),
    telefono varchar(20)
);

insert into proveedores
values
('1','ProveedorA','Carlos','1234-5678'),
('2','ProveedorB','Ana','2345-6789'),
('3','ProveedorC','Mario','3456-7890'),
('4','ProveedorD','Pepe','4567-8901'),
('5','ProveedorE','David','5678-9012');


create table pragos_proveedores(
	id_pago int primary key,
    monto decimal (10,2),
    fecha date,
    estado enum('Pendiente', 'Pagado'),
    id_proveedor_fk int,
    foreign key (id_proveedor_fk) references proveedores(id_proveedor)    
);

insert into pragos_proveedores
values
('1',1250.75,'2025-04-02','Pagado',1),
('2',1550.50,'2025-12-10','Pendiente',2),
('3',2500.00,'2025-02-01','Pagado',3),
('4',2750.00,'2025-08-15','Pendiente',4),
('5',3000.00,'2025-03-01','Pagado',5);


create table facturas(
	id_factura int primary key,
    monto decimal(10,2),
    fecha date,
    estado enum ('Pagada', 'Pendiente'),
    id_empresa_fk INT,
    FOREIGN KEY (id_empresa_fk) REFERENCES empresas(id_empresa)
);

insert into facturas
values
('1',5050.00,'2025-07-05','Pagada',1),
('2',7575.25,'2025-11-20','Pendiente',2),
('3',6250.00,'2025-10-10','Pagada',3),
('4',8200.00,'2025-05-28','Pendiente',4),
('5',9200.00,'2025-12-05','Pagada',5);


create table usuarios(
	id_usuario int primary key,
    nombre_usuario varchar(50),
    contraseña varchar(50),
	tipo_usuario ENUM('empleado', 'empresa'),
    id_empleado_fk int,
    id_empresa_fk int,
    foreign key (id_empleado_fk) references Empleados(id_empleado),
    foreign key (id_empresa_fk) references empresas(id_empresa)
);

insert into usuarios
values
('1','usuario1','pass1','empleado',1,'1'),
('2','usuario2','pass2','empleado',2,'2'),
('3','usuario3','pass3','empleado',3,'3'),
('4','usuario4','pass4','empleado',4,'4'),
('5','usuario5','pass5','empleado',5,'5');



create table amenazas(
	id_amenaza int primary key,
    tipo_amenaza varchar(50),
    descripcion TEXT,
    fecha_detect date,
    estado ENUM('Pendiente', 'Mitigada', 'En investigación'),
    id_empresa_fk int,
    foreign key (id_empresa_fk) references empresas(id_empresa)
);

insert into amenazas
values
('1','Malware','Ataque básico','2025-10-01','Pendiente',1),
('2','Phishing','Correo sospechoso','2025-09-15','Mitigada',2),
('3','DDoS','Tráfico elevado','2025-04-01','En investigación',3),
('4','Ransomware','Sistema bloqueado','2025-02-10','Pendiente',4),
('5','Spyware','Acceso remoto','2025-05-20','Mitigada',5);


create table proyectos(
	id_proyecto int primary key,
    nombre_proyecto varchar(50),
    descripcion text,
    fecha_inicio date,
    fecha_fin date,
    estado ENUM('Activo', 'Completado', 'Pendiente'),
    id_empresa_fk INT,
    FOREIGN KEY (id_empresa_fk) REFERENCES empresas(id_empresa)
);

insert into proyectos
values
('1','ProyectoA','Seguridad básica','2025-01-01','2024-03-01','Activo',1),
('2','ProyectoB','Monitoreo','2025-01-15','2025-04-15','Activo',2),
('3','ProyectoC','Auditoría','2025-02-01','2025-05-01','Completado',3),
('4','ProyectoD','Firewall','2025-02-10','2025-06-01','Activo',4),
('5','ProyectoE','Red segura','2025-03-01','2025-07-01','Pendiente',5);


create table empleados_proyectos(
	id_empleado_fk int,
    id_proyecto_fk int,
    foreign key (id_empleado_fk) references Empleados(id_empleado),
    foreign key (id_proyecto_fk) references proyectos(id_proyecto)

);

insert into empleados_proyectos
values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);



create table compras(
	id_compras int primary key,
    monto decimal(10,2),
    id_proveedores_fk int,
    id_facturas_fk int,
    foreign key (id_proveedores_fk) references proveedores(id_proveedor),
    foreign key (id_facturas_fk) references facturas(id_factura)
);

insert into compras
values
('1',1000.00,1,1),
('2',1500.00,2,2),
('3',2000.00,3,3),
('4',2500.00,4,4),
('5',3000.00,5,5);
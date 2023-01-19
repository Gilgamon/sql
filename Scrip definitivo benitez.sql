/* Eliminacion del Schema anterior */
DROP schema IF EXISTs almacen;
/* creacion de schema y tablas */
CREATE schema ALMACEN;
USE ALMACEN;
CREATE TABLE CLIENTES (
id_clientes int NOT NULL auto_increment,
nombre_cl varchar(200) NOT NULL,
direccion_cl varchar(200) NOT NULL,
DNI_cl int ,
CONSTRAINT PK_CLIENTES PRIMARY KEY (id_clientes)
);
CREATE TABLE EMPLEADOS (
id_empleados int NOT NULL auto_increment,
nombre_emp varchar(200) ,
direccion_emp varchar(200) ,
DNI_emp int,
CONSTRAINT PK_CLASS PRIMARY KEY (id_empleados)
);
CREATE TABLE PRECIOS (
id_precios int Not NULL auto_increment,
precio_venta float,
precio_compra float NOT NULL,
precio_act_may float ,
CONSTRAINT PK_CLASS PRIMARY KEY (id_precios)
);
CREATE TABLE MAYORISTAS (
id_mayoristas int NOT NULL auto_increment,
nombre_may varchar(200) ,
CONSTRAINT PK_PEDIDOS PRIMARY KEY (id_mayoristas)
);
CREATE TABLE MARCAS (
nombre_marcas  varchar(200) NOT NULL,
id_marcas int NOT NULL auto_increment,
CONSTRAINT PK_PEDIDOS PRIMARY KEY (id_marcas)
);
CREATE TABLE CATEGORIAS (
nombre_cate  varchar(200) NOT NULL,
id_categorias int NOT NULL auto_increment,
CONSTRAINT PK_PEDIDOS PRIMARY KEY (id_categorias)
);
CREATE TABLE ARTICULOS (
nombre_art varchar(200) NOT NULL,
id_articulos int NOT NULL auto_increment,
id_marcas int NOT NULL,
id_precios int Not NULL,
id_categorias int NOT NULL,
CONSTRAINT PK_CLASS PRIMARY KEY (id_articulos)
);
CREATE TABLE PEDIDOS (
id_clientes int ,
id_pedidos int NOT NULL auto_increment,
CONSTRAINT PK_PEDIDOS PRIMARY KEY (id_pedidos)
);
CREATE TABLE ENTREGAS (
id_entregas int NOT NULL auto_increment,
id_empleados int ,
id_pedidos int NOT NULL,
CONSTRAINT PK_CLASS PRIMARY KEY (id_entregas)
);
CREATE TABLE ALMACEN (
id_almacen int NOT NULL auto_increment,
existencia int ,
id_articulos int ,
CONSTRAINT PK_CLASS PRIMARY KEY (id_almacen)
);
 CREATE TABLE AUDITORIAS_PRECIOS (
  id_audi INT NOT NULL AUTO_INCREMENT,
  id_precios int null,
  precio_venta float null,
  precio_compra float null,
  precio_act_may float null,
  fecha DATETIME NULL DEFAULT current_timestamp,
  PRIMARY KEY (id_audi)
  );
    CREATE TABLE PRECIOS_VIEJOS (
  id_viejo INT NOT NULL AUTO_INCREMENT,
  id_precios int null,
  precio_venta float null,
  precio_compra float null,
  precio_act_may float null,
  fecha DATETIME NULL DEFAULT current_timestamp,
  PRIMARY KEY (id_viejo)
  );
  
/* FK */

ALTER TABLE PEDIDOS ADD CONSTRAINT FK_PEDIDOS_CLIENTES FOREIGN KEY FK_PEDIDOS_CLIENTES (id_clientes)
    REFERENCES CLIENTES (id_clientes);
ALTER TABLE ENTREGAS ADD CONSTRAINT FK_ENTREGAS_EMPLEADOS FOREIGN KEY FK_ENTREGAS_EMPLEADOS (id_empleados)
    REFERENCES EMPLEADOS (id_empleados);
ALTER TABLE ENTREGAS ADD CONSTRAINT FK_ENTREGAS_PEDIDOS FOREIGN KEY FK_ENTREGAS_PEDIDOS (id_pedidos)
    REFERENCES PEDIDOS (id_pedidos);
ALTER TABLE ALMACEN ADD CONSTRAINT FK_ALMACEN_ARTICULOS FOREIGN KEY FK_ALMACEN_ARTICULOS (id_articulos)
    REFERENCES ARTICULOS (id_articulos);
ALTER TABLE ARTICULOS ADD CONSTRAINT FK_ARTICULOS_PRECIOS FOREIGN KEY FK_ARTICULOS_PRECIOS (id_precios)
    REFERENCES PRECIOS (id_precios);
ALTER TABLE ARTICULOS ADD CONSTRAINT FK_ARTICULOS_MARCAS FOREIGN KEY FK_ARTICULOS_MARCAS (id_marcas)
    REFERENCES MARCAS (id_marcas);
ALTER TABLE ARTICULOS ADD CONSTRAINT FK_ARTICULOS_CATEGORIAS FOREIGN KEY FK_ARTICULOS_CATEGORIAS (id_categorias)
    REFERENCES CATEGORIAS (id_categorias);
    
    /* insercion de datos */
    
insert into CLIENTES (id_clientes, nombre_cl, direccion_cl, DNI_cl) values (1, 'Rodrigo Castillo', 'Las Norias 2352', 35224567);
insert into CLIENTES (id_clientes, nombre_cl, direccion_cl, DNI_cl) values (2, 'Roberto Torres', 'Las Magnolias 252', 35004567);
insert into CLIENTES (id_clientes, nombre_cl, direccion_cl, DNI_cl) values (3, 'Maria Azteka', 'Falsa 123', 39454567);
insert into EMPLEADOS (id_empleados, nombre_emp, direccion_emp, DNI_emp) values (1, 'Raul Fisto', 'Las Canarias 245', 41000632);
insert into EMPLEADOS (id_empleados, nombre_emp, direccion_emp, DNI_emp) values (2, 'Marianela Aguirre', 'Barcelona 998', 42907665);
insert into EMPLEADOS (id_empleados, nombre_emp, direccion_emp, DNI_emp) values (3, 'Jose Cobo', 'Operativo Condor 1006', 40789065);
insert into PRECIOS (id_precios, precio_venta, precio_compra, precio_act_may) values (1, 107, 90, 91.5);
insert into PRECIOS (id_precios, precio_venta, precio_compra, precio_act_may) values (2, 105, 88, 90);
insert into PRECIOS (id_precios, precio_venta, precio_compra, precio_act_may) values (3, 100, 75, 75);
insert into MAYORISTAS (id_mayoristas, nombre_may) values (1, 'malva');
insert into MAYORISTAS (id_mayoristas, nombre_may) values (2, 'diarcor');
insert into MAYORISTAS (id_mayoristas, nombre_may) values (3, 'maxiconsumo');
insert into MARCAS (id_marcas ,nombre_marcas) values (1, 'marolio');
insert into MARCAS (id_marcas ,nombre_marcas) values (2, 'serenisima');
insert into MARCAS (id_marcas ,nombre_marcas) values (3, '9 de oro');
insert into CATEGORIAS (id_categorias, nombre_cate) values (1, 'pastas');
insert into CATEGORIAS (id_categorias, nombre_cate) values (2, 'lacteos');
insert into CATEGORIAS (id_categorias, nombre_cate) values (3, 'galletas');
insert into ARTICULOS (id_articulos, nombre_art, id_marcas, id_precios, id_categorias) values (1,'fideo tirabuzon', 1, 1, 1);
insert into ARTICULOS (id_articulos, nombre_art, id_marcas, id_precios, id_categorias) values (2,'manteca',2 ,2 ,2 );
insert into ARTICULOS (id_articulos, nombre_art, id_marcas, id_precios, id_categorias) values (3,'bizcochos',3 ,3 ,3);
insert into PEDIDOS (id_pedidos, id_clientes) values (1, 2);
insert into PEDIDOS (id_pedidos, id_clientes) values (2, 1);
insert into PEDIDOS (id_pedidos, id_clientes) values (3, 3);
insert into ENTREGAS (id_entregas,id_empleados, id_pedidos) values (1, 1, 1);
insert into ENTREGAS (id_entregas,id_empleados, id_pedidos) values (2, 2, 2);
insert into ENTREGAS (id_entregas,id_empleados, id_pedidos) values (3, 3, 3);
insert into ALMACEN (id_almacen, existencia, id_articulos) values (1 ,2 ,1);
insert into ALMACEN (id_almacen, existencia, id_articulos) values (2 ,2 ,2);
insert into ALMACEN (id_almacen, existencia, id_articulos) values (3 ,2 ,3);

/* vistas */

Create view vista_articulos_con_precios as
select distinct nombre_art, precio_venta
From articulos as a
join precios as p on a.id_precios=p.id_precios
group by a.id_precios;
Create view vista_articulos_a_reponer as
select *
From almacen as a
where existencia <= 1;

/* funciones */

DELIMITER $$
create function cal_pre_ven ( precio_compra float) Returns float
NO sql
begin 
declare pre_ven float;
set pre_ven = ( precio_compra * 1.3);
RETURN pre_ven ;
end$$
$$create function direccion_ped ( id int) Returns varchar (255)
reads sql data
begin
declare direc varchar(255);
select direccion_cl into direc from clientes where id_clientes like (id);
SELECT direccion_cl  into direc
  FROM clientes
  WHERE id_clientes = (SELECT id_clientes
              FROM pedidos
              WHERE id_pedidos = id);
RETURN direc;
end$$

/* Triggers */

$$create trigger insercion_de_precios_fecha
after insert on precios
for each row begin
	insert into auditorias_precios (id_precios, precio_venta, precio_compra, precio_act_may)  
    value (New.id_precios, New.precio_venta, New.precio_compra, New.precio_act_may);
    end $$
    $$create trigger fecha_de_modificacion_de_precio
after update on precios
for each row begin
	insert into auditorias_precios (id_precios, precio_venta, precio_compra, precio_act_may)  
    value (New.id_precios, New.precio_venta, New.precio_compra, New.precio_act_may);
    end $$
$$create trigger campos_antiguos
before update on precios
for each row begin
	insert into precios_viejos (id_precios, precio_venta, precio_compra, precio_act_may)  
    value (old.id_precios, Old.precio_venta, Old.precio_compra, Old.precio_act_may);
    end $$
       $$create trigger campos_eliminados
before delete on precios
for each row begin
	insert into precios_viejos (id_precios, precio_venta, precio_compra, precio_act_may)  
    value (old.id_precios, Old.precio_venta, Old.precio_compra, Old.precio_act_may);
    end $$
    
    /* SP */
    
$$ create procedure viejos_sp ()
begin
select * from precios_viejos
order by id_viejo desc;
end$$
$$ create procedure eliminar_hasta_sp (in id int)
begin
delete from precios_viejos where id_viejo <= id;
end$$

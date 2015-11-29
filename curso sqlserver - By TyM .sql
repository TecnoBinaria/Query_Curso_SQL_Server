-- Curso SQL Server  --
-- Tutoriales y mas; --
-- By Eduardo Alfaro Ch --
-- Suscríbete! https://www.youtube.com/channel/UCJeVpLbYfAHivHHrwG2TqFw

--create database Ventas1
--ON
--primary 
--      (name = ventas1primary,
--	  filename = 'c:\Ventas_Data\ventas1primary.mdf',
--	  size = 50MB,
--	  Maxsize = 200,
--	  filegrowth = 20),
--filegroup ventas1FG
--      (name = ventas1Data1,
--	  filename = 'c:\Ventas_Data\ventas1Data.ndf',
--	  size = 200MB,
--	  Maxsize = 800,
--	  filegrowth = 100)
--Log on
--     (name = ventas1log,
--	  filename = 'c:\Ventas_Data\ventas1log.ldf',
--	  size = 300MB,
--	  Maxsize = 800,
--	  filegrowth = 100)

--	  drop database Ventas1 -- esto es para borrar

--	  use Ventas1
--	  -- crear tabla --

--	  create table producto(
--	  id int not null,
--	  nombreproducto nvarchar(40),
--	  descripcion nvarchar(200))

--	  drop table producto

--	  -- alterar una tabla --

--	  alter table producto
--	  add
--	  precio int not null

--	  alter table producto
--	  drop column precio

--	  alter table producto
--	  alter column descripcion nvarchar(150)


--	  -- Primary key --

--	  create table producto(
--	  id int primary key not null,
--	  nombreproducto nvarchar(40),
--	  descripcion nvarchar(200))

--	  drop table producto
	  


--	  --  SELECT y vistas---

--	SELECT telefono, nombre, id FROM  dbo.Clientes

--	SELECT * FROM  dbo.Clientes

--	SELECT nombre AS [nombre de cliente], telefono AS [Telefono de cliente], id AS [ID del cliente]
--	FROM  Clientes
--	ORDER BY [ID del cliente] desc

--	SELECT  id, nombreproducto, descripcion
--	FROM  producto
--	ORDER BY descripcion DESC, id DESC
	

--	SELECT  id, nombreproducto, Precio
--	FROM   dbo.producto
--	WHERE   (Precio >= N'200') AND (Precio <= N'500')
--	ORDER BY Precio DESC, id DESC


--	-- INSERT --

--	insert into producto (id,nombreproducto,Precio) values (11,'producto 11', '600')
--	insert into producto  values (12,'producto 12', '700')

--	select * from producto



--	-- Actualizacion de datos - Update --

--	Update producto SET descripcion = 'producto nuevo'
	
--	update producto set nombreproducto ='automovil',Precio='900',
--	descripcion='auto nuevo' where id=1
	



--	-- Eliminacion de datos - Delete --

--	Delete from producto


--	Bulk
--	Insert producto
--	from 'c:\csv\productos.csv'
--	with (firstrow=2,fieldterminator =';',rowterminator = '\n' )


--	delete from producto where id=12


--	-- TOP --


--	select * from producto
--	select top(5) * from producto
--	select top(50)Percent * from producto

--	-- BETWEEN --

--	select * from producto

--	select * from producto where (id between 6 and 8)


--	-- LIKE --

--	select * from producto

--	select * from producto where nombreproducto like 'auto%'

--	select * from producto where nombreproducto like '%to%'



--	-- IN --

--	Select * from producto where nombreproducto = 'automovil'OR nombreproducto = 'producto 2'OR nombreproducto = 'producto 3'

--	Select * from producto where (nombreproducto IN ('automovil','producto 4','producto 3'))


--	-- Consulta Multiple --

--	Select * from Clientes where (nombre like '%ed%')or(apellido like '%alfaro%')

	

--	-- Foreign Key  --

--	create table infocliente (
--	id_cliente int foreign key (id_cliente)
--	references Clientes (id),
--	direccion nvarchar(50),
--	cedula int not null)

--	create table infocliente (
--	id_cliente int,
--	direccion nvarchar(50),
--	cedula int not null)

--	select * from infocliente

--	insert into infocliente values (26,'dhdyhhd,Costa Rica',3544554)



--	-- Inner Join --


--	Select * from Clientes T3 
--	inner join infocliente T4
--	on T3.id = T4.id_cliente


--	-- Left, Rigth y full join --


--	Select * from Clientes T3 
--	Left join infocliente T4
--	on T3.id = T4.id_cliente

--	Select * from Clientes T3 
--	Right join infocliente T4
--	on T3.id = T4.id_cliente

--	Select * from Clientes T3 
--	full join infocliente T4
--	on T3.id = T4.id_cliente




--	-- union --

--	create table clientes2(
--		id int , 
--		nombre nvarchar(20),
--		telefono int,
--		apellido nchar(20))

--	select * from Clientes
--	Union
--	select * from clientes2


	
--	-- AVG-Promedio --

--	SELECT    AVG(total) AS Promedio
--	FROM      dbo.ventas
	


--	-- SUMA --

--SELECT  SUM(total) AS [Total de ventas]
--FROM   dbo.ventas
--WHERE (anio = '2014') AND (mes = '01' OR mes = '3')




---- MAX - MIN --

--SELECT        MAX(total) AS [Total maximo]
--FROM            dbo.ventas


--SELECT        MIN(total) AS [Total maximo]
--FROM            dbo.ventas


---- Primero y ultimo --

--select top(1) * from ventas

--select top(1) * from ventas 
--order by id, anio, mes , dia desc




---- count -- 

--select COUNT(id) as [Cantidad de ventas] from ventas
--where mes=3




---- Stored Procedures -- procedimientos almacenados

--create procedure sp_consulta @nombre nvarchar(20), @telefono int
--as
--begin


--Select * from clientes2 where nombre = @nombre and telefono = @telefono;
--print 'hecho correctamente';

--end

--exec sp_consulta 'eduardo',1234




---- Identity -- 

--create table pruebaidentity(
--id int primary key identity(20,5) not null,
--nombre nvarchar(50)
--)

--insert into pruebaidentity values ('jose')

--select * from pruebaidentity





---- Drop y Truncate --

--delete from prueba2

--insert into prueba2 values ('david')

--truncate table prueba2

--drop table prueba2

--drop database teoria



---- Mayusculas y minusculas (Upper y Lower) --

--create table palabras(
--palabra1 nvarchar(20) not null,
--palabra2 nvarchar(20) not null
--)

--insert into palabras values ('hola','MUNDO')

--select * from palabras

--select upper(palabra1)as palabra_may , lower(palabra2)as palabra_min from palabras 



---- Wikipedia:
---- Transact-SQL (T-SQL) es una extensión al SQL Server
---- SQL, que frecuentemente se dice ser un Lenguaje de Búsquedas Estructurado 
----(por sus siglas en inglés), es un lenguaje de cómputo estandarizado, 
----desarrollado originalmente por IBM para realizar búsquedas, alterar y definir
---- bases de datos relacionales utilizando sentencias declarativas. T-SQL expande
----  el estándar de SQL para incluir programación procedural, variables locales, 
----  varias funciones de soporte para procesamiento de strings, procesamiento de 
----  fechas, matemáticas, etc, y cambios a las sentencias DELETE y UPDATE.

---- Sql = lenguaje de peticiones DML
---- T-SQL  = sql -> lenguaje programacion 

---- T-SQL - Variables -- 

--declare @texto nvarchar(20)
--set @texto = 'hola mundo'
--declare @numero int
--set @numero = 35

--print 'T-SQL dice = '+ @texto + ' y el numero: ' + convert(nvarchar(20),@numero)


---- T-SQL - El Lenguage sql normal combinado con el t-sql --

--declare @textos nvarchar(20)
----set @textos = 'dd' 
--declare @edad int
----create table tsql(
----nombre nvarchar(20),
----edad int 
----)
--select @textos = nombre, @edad = edad from tsql where edad = 22

--print @textos + ' ' + convert(nvarchar(15),@edad)


---- Operadores -- 

-- -- + - * / %(mod)

-- declare @num1 int 
-- declare @num2 int

-- set @num1 = 10
-- set @num2 = 3

-- print @num1 / @num2
-- print @num1 % @num2




-- -- IF -- 

-- declare @num1 int
-- declare @num2 int

-- set @num1 = 10
-- set @num2 = 5

-- if @num1 >= @num2 
-- print 'es verdad'
-- else 
-- print 'no es cierto'


-- -- while --

-- declare @cont int
-- set @cont = 0

--	while (@cont <= 100)
--	 begin 
--		print 'hola , soy el numero: ' + convert(nvarchar(20),@cont) 
--		set @cont = @cont + 1
--	 end



--	 -- Case (switch) | T-Sql --

--	 declare @avion nvarchar(50)
--	 declare @estado nvarchar (50)
--	 declare @aviso nvarchar (50)

--	 set @avion = 'condor'
--	 set @estado = 'cargando'
	 
--	 set @aviso = (case @estado
--					when 'volando' then 'el avion: '+@avion+' esta volando'
--					when 'detenido' then 'el avion: '+ @avion+' esta detenido'
--					when 'cargando' then ' el avion: '+@avion+ ' se esta cargando en este momento'
--	end
--	  ) 
--	  print @aviso

	
	 
--	 -- Try catch | T-Sql --

--	 begin try

--		 declare @edad int
--		 set @edad = 'veinte'
--		 print @edad

--	 end try
--	 begin catch 

--	 print 'error al leer el numero'
--	 print error_message()

--	 end catch

	 -- Cursor --
	 
	 --declare  Cursorejemplo Cursor scroll
	 --for select * from persona

	 --open Cursorejemplo 
	 --fetch next from Cursorejemplo

	 --close Cursorejemplo
	 --deallocate  Cursorejemplo

	 -- Ejemplo de Cursor --

	 --declare @nombre nvarchar(50)
	 --declare @apellido nvarchar(50)
	 --declare @telefono nvarchar(50)

	 --declare  Cursorejemplo Cursor scroll
	 --for select * from persona

	 --open Cursorejemplo 
	 --fetch next from Cursorejemplo into @nombre,@apellido,@telefono

	 --while(@@FETCH_STATUS = 0)
		--Begin
			
		--	insert into persona2 values (@nombre,@apellido,'123456789')
		--	fetch next from Cursorejemplo into @nombre,@apellido,@telefono

		--end

	 --close Cursorejemplo
	 --deallocate  Cursorejemplo



	 -- ---  Triggers  --- -- (disparadores)

	 --create trigger TR_persona_insert3
	 --on persona
	 --instead of insert 
	 --as 
	 --print 'hubo un cambio en la tabla persona3';

	 --insert into persona values ('edark3','alf3',12343);



 --ejemplo insertar en log (historial)
 --go
	--create trigger TR_persona_insert
	-- on persona
	-- for insert 
	-- as 
	-- begin
	-- set nocount on; -- evita que se muestre que se hayan hecho cambios en alguna tabla
	-- insert into log_historial(
	-- nombre,fecha,descripcion) select nombre,getdate(),'se insertaron datos en la tabla'
	-- from inserted
	-- end

	-- insert into persona values ('christopher','cha',16546);


  -- ejemplo eliminar - Trigger

 -- create trigger TR_persona_delete
 -- on persona instead of DELETE
 --as 
 -- begin
 -- -- set nocount on; -- evita que se muestre que se hayan hecho cambios en alguna tabla
	-- insert into log_historial(
	-- nombre,fecha,descripcion) select nombre,getdate(),'se eliminaron datos en la tabla'
	-- from deleted
 -- end
 -- go

 -- select * from persona
 -- select * from log_historial

 -- delete from persona where Nombre = 'edark'

 --Exportar a XML

 --Select * from persona
 --for XML raw('Registro'), elements , Root('XML')
 
 --Auto 
 --raw, elements , Root




 ------------  DATENAME --------------

 -- month , quarter, year, dayofyear, day ,week ,weekday, hour, minute, second ,millisecond


-- Print  Datename (second,getdate())



----------  Insertar en una table el contenido de otra  -------------

--Insert into Persona (ID, Nombre , Apellido ,Pais)
--Select * from [dbo].[ejemploTYM$]




---- Informacíon de las vistas - Video 53

--create view View_Ejemplo as
--select top 100 nombre,apellido,Correo,Telefono from ejemploData


--select * from View_Ejemplo


--sp_help

--sp_helptext View_Ejemplo

--sp_depends View_Ejemplo



-- Encryptacion de una Vista - 54

--create view View_seguridad 
--with encryption as
--select top 100 nombre,apellido,Correo,Telefono from ejemploData


--select * from View_seguridad

--sp_helptext View_seguridad




















	--By Eduardo Alfaro Ch;--

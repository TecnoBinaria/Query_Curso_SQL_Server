-- Curso SQL Server  --
-- Tecnología Binaria; --
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







-- Clausula Group By



--Select Nombre, [Fecha de nacimiento] ,Sum(Salario) as SumaSalarios
--from Personas 
--group by Nombre, [Fecha de nacimiento]


---- Clausula Having



--Select Nombre, [Fecha de nacimiento] ,Salario
--from Personas 
--group by Nombre, [Fecha de nacimiento] ,Salario
--having Salario > 1400
--order by Salario


----- 2019

CREATE TABLE [Personas] (
    [PersonasID] INTEGER NOT NULL IDENTITY(1, 1),
    [Nombre] VARCHAR(255) NULL,
    [Edad] INTEGER NULL,
    [Pais] VARCHAR(100) NULL,
    [NID] VARCHAR(13) NULL,
    PRIMARY KEY ([PersonasID])
);
GO

INSERT INTO Personas([Nombre],[Edad],[Pais],[NID]) VALUES('Wang Simon',45,'Albania','1630071350399'),('Clark Talley',37,'Singapore','1600052434799'),('Xavier Espinoza',74,'Oman','1670022836299'),('Matthew Little',28,'South Africa','1635072170599'),('Fuller Olson',35,'Colombia','1693122819699'),('Nathan Hodges',49,'Venezuela','1619061085099'),('Hiram Marshall',13,'French Southern Territories','1616090237899'),('Tobias Ramos',66,'Paraguay','1609080449299'),('Tanner Knight',37,'Armenia','1643022984599'),('Mohammad Collier',23,'Peru','1611060327699'),('Garrett Perez',63,'Portugal','1699011319399'),('Steven Herrera',68,'Guadeloupe','1643111524699'),('Elijah Sims',38,'India','1626080609899'),('Hamilton Tyson',49,'San Marino','1657101696099'),('Reuben Nixon',43,'Bolivia','1697021363299'),('Paul Joyner',17,'Fiji','1614031557199'),('Akeem Fields',63,'Tokelau','1696042593199'),('Josiah Avery',60,'Bonaire, Sint Eustatius and Saba','1684020214399'),('Nolan Strong',79,'Hungary','1627090934799'),('Marsden Dotson',55,'Tajikistan','1697110547599'),('Julian Burgess',75,'Poland','1620110309899'),('Hashim Munoz',31,'Macao','1680021103199'),('Jerry Frank',66,'Congo, the Democratic Republic of the','1647052264499'),('Arden Griffin',51,'Bahamas','1664060259599'),('Wesley Morton',62,'Croatia','1610111559499'),('Dale Kelly',32,'Guadeloupe','1600121293499'),('Theodore Oliver',27,'Namibia','1635052608299'),('Joel Stanley',31,'New Caledonia','1664012611899'),('Rajah Briggs',33,'Viet Nam','1687071778599'),('Hashim Banks',56,'Pakistan','1648060501699'),('Seth Rosario',22,'American Samoa','1615070653699'),('Dominic Combs',31,'Israel','1616102007599'),('Palmer Guzman',53,'Sudan','1605051222899'),('Cain Massey',28,'Namibia','1626070429499'),('Caldwell Snow',47,'Gabon','1634050866899'),('Alexander Burke',76,'Northern Mariana Islands','1604111847399'),('Myles Brennan',11,'Guinea','1632081428399'),('Lance Vargas',29,'South Sudan','1634012894399'),('Eaton Chaney',22,'Anguilla','1621051960699'),('Uriel Reyes',27,'Nepal','1680061508399'),('Cade Irwin',67,'Solomon Islands','1668021376199'),('Chadwick Mccullough',40,'Swaziland','1655040282799'),('Connor Warner',80,'Mexico','1697123038399'),('Lyle French',16,'Bosnia and Herzegovina','1601080545299'),('Wesley Cummings',66,'Lesotho','1612070608199'),('Walker Woodard',39,'Marshall Islands','1613030379899'),('Orson Mendoza',14,'Bangladesh','1605011483599'),('Jordan Mckinney',26,'Norfolk Island','1620110555299'),('Evan Cohen',53,'Bahamas','1678012334399'),('Quinlan Soto',61,'Nauru','1633042840299'),('Colorado Lawson',61,'Denmark','1665060715299'),('Kamal Harding',13,'Saudi Arabia','1650091495399'),('Dominic Williamson',52,'Saint Helena, Ascension and Tristan da Cunha','1676021160699'),('Myles Rutledge',20,'Sierra Leone','1606122542399'),('Keaton Dickson',38,'Mozambique','1694112355799'),('Moses Madden',16,'Chad','1606080460199'),('Mason Mercer',36,'Palestine, State of','1626072965799'),('Amal Bolton',16,'Faroe Islands','1681012682999'),('Ethan Lawrence',29,'Jamaica','1623100391499'),('Armand Duke',47,'Mexico','1661022798399'),('Wing Kline',27,'Afghanistan','1649040657499'),('Duncan Best',72,'Jamaica','1613011806099'),('Lyle Collins',23,'Norway','1647040753099'),('Malik Gray',70,'Solomon Islands','1601100264299'),('Dolan Fuentes',80,'Ecuador','1601031636199'),('Kaseem Hood',50,'Holy See (Vatican City State)','1657100687599'),('Brent Mullins',18,'Saint Pierre and Miquelon','1629091323099'),('Michael Hatfield',75,'Saint Kitts and Nevis','1657042124899'),('Judah Perkins',59,'Germany','1676080542699'),('Steven Madden',62,'Tuvalu','1612052099799'),('Carter Trujillo',25,'Germany','1611042223999'),('Edward Cunningham',26,'Guadeloupe','1646032761499'),('Chandler Sampson',17,'Solomon Islands','1616082167799'),('Kamal Baird',28,'Armenia','1690090452399'),('Sebastian Richmond',67,'Singapore','1683040101199'),('Vance Frost',35,'Qatar','1686032319299'),('Damon Alexander',42,'Virgin Islands, British','1618051184199'),('Donovan Mitchell',20,'Timor-Leste','1629110967599'),('Edward Stephens',17,'Uruguay','1699122137799'),('Darius Morales',37,'Singapore','1675062429099'),('Blaze Barker',13,'Bangladesh','1623081403399'),('Tiger Hendricks',77,'Nigeria','1657023018899'),('Raphael Harris',68,'Austria','1665122928099'),('Jacob Dejesus',22,'Tanzania','1659070367199'),('Philip Day',13,'Bosnia and Herzegovina','1609120918699'),('Dolan Wong',72,'Greece','1656061649299'),('Yoshio Craft',30,'Peru','1676072323499'),('Moses Norman',49,'Austria','1600030396099'),('Martin Mack',57,'Poland','1638062798399'),('Ashton Kirk',37,'Mauritius','1633060718199'),('Barry Hart',33,'Sint Maarten','1638102343499'),('Richard Rose',53,'Nicaragua','1600022830299'),('Gil Powell',49,'Thailand','1634050656999'),('Hunter Santiago',64,'Uganda','1649082093199'),('Armand Good',31,'United States Minor Outlying Islands','1622121007799'),('Garth Dixon',29,'Seychelles','1606010981099'),('Leonard Matthews',37,'Montserrat','1630071583499'),('Nissim Cross',56,'Botswana','1651082454199'),('Fuller Cross',20,'Zambia','1605102273099'),('Philip Ward',28,'Central African Republic','1674110802099');
INSERT INTO Personas([Nombre],[Edad],[Pais],[NID]) VALUES('Coby Graves',22,'Belgium','1692051098399'),('Hyatt Huffman',52,'Ethiopia','1659021886199'),('Chase Price',73,'Libya','1673090870099'),('Perry Aguilar',71,'Algeria','1633081340999'),('Valentine Boone',50,'Djibouti','1604121379099'),('Sawyer Johnston',13,'Cook Islands','1657042292399'),('Axel Mcfadden',52,'Swaziland','1642011042299'),('Wesley Mejia',29,'French Guiana','1660061781399'),('Matthew Le',17,'Tajikistan','1643030853399'),('Tanek Terrell',52,'Italy','1698042414799'),('Barry Hartman',80,'Mexico','1610012411799'),('Jin Greene',30,'Nepal','1604112941699'),('Linus Jackson',14,'Hong Kong','1604042547899'),('Linus Roberson',65,'Slovenia','1688051322899'),('Jarrod Kent',17,'Moldova','1697052094699'),('Quamar Valenzuela',19,'Nicaragua','1617091125299'),('Amal Hopkins',55,'Lebanon','1632121794999'),('Isaac Hudson',21,'Greenland','1645031570699'),('Jonas Burton',43,'Benin','1684010462699'),('Cruz Richards',44,'Austria','1667031888799'),('Rafael Fowler',45,'Uruguay','1676030293199'),('Abraham Bowers',67,'Madagascar','1641042380899'),('James Horn',47,'Central African Republic','1670040767399'),('John Young',67,'Papua New Guinea','1684121903199'),('Mohammad Lynn',12,'Viet Nam','1635041241499'),('Oscar Herman',59,'Benin','1625111887599'),('Beck Holcomb',49,'Anguilla','1655080108999'),('Vernon Webster',63,'Cyprus','1664090264199'),('Len Barton',74,'Northern Mariana Islands','1688070767899'),('Ivan Navarro',62,'Congo, the Democratic Republic of the','1645111235499'),('Graham Mcneil',56,'India','1695050133199'),('Linus Jacobs',23,'Lebanon','1628072249899'),('Tanner Payne',17,'Liechtenstein','1641111673899'),('Linus Bentley',79,'Vanuatu','1630111076499'),('Lucius Richardson',34,'Antarctica','1631031780099'),('Wyatt Bruce',14,'Macedonia','1615020157099'),('Aquila Thomas',44,'Saint Barthélemy','1666121479599'),('Murphy Mccall',23,'Tonga','1691091248199'),('Armand Shepherd',22,'Norway','1680121703599'),('Kennan Rutledge',45,'Morocco','1602032598699'),('Troy Vaughn',57,'Bahamas','1646062002099'),('Upton Boyer',19,'Belarus','1672011314199'),('Christian Puckett',49,'United Arab Emirates','1603070626699'),('Phelan Melton',43,'Senegal','1699040567599'),('Ulric Eaton',47,'French Guiana','1615032551799'),('Travis Bush',15,'Venezuela','1699110941299'),('Ahmed Conley',34,'Slovenia','1613102272799'),('Arthur Barrett',21,'Åland Islands','1690080644699'),('Gavin Park',62,'Comoros','1675071556999'),('Reese Schmidt',24,'American Samoa','1638110477899'),('Thor Vargas',60,'Portugal','1635102814599'),('Baxter Jennings',54,'Anguilla','1619071435799'),('Coby Craig',68,'Laos','1669122813599'),('Jin Simon',32,'Gibraltar','1680011751499'),('Plato Henson',44,'Zambia','1613121021299'),('Garth Chen',16,'Montserrat','1663011582599'),('Blaze Pruitt',28,'Chad','1664012714599'),('Howard Cantrell',79,'Greece','1667071998799'),('Eaton Smith',67,'Cuba','1649021008099'),('Elliott Ferguson',44,'South Sudan','1604101048499'),('Kieran Vargas',73,'Turkey','1636121372999'),('Michael Mcdonald',55,'Niue','1635052317199'),('Declan Mclaughlin',74,'Reunion','1683031865199'),('Wallace Chen',71,'Hungary','1627102805899'),('Damon Ellison',27,'Bhutan','1608101384999'),('Vladimir Dale',49,'Mali','1647042672599'),('Coby Diaz',41,'Saint Martin','1658100647999'),('Callum Malone',56,'Uganda','1640062640299'),('Nathaniel Harrell',63,'Yemen','1699042599999'),('Tate Washington',80,'Cocos (Keeling) Islands','1604071076799'),('Malik Vasquez',11,'Kiribati','1696060361799'),('Seth Foster',68,'Liberia','1643030523299'),('Baker Vinson',39,'Malaysia','1609062015099'),('Tate Turner',68,'Congo, the Democratic Republic of the','1614102929299'),('Buckminster Richardson',57,'Turkey','1615020558699'),('Ross Golden',19,'Côte D''Ivoire (Ivory Coast)','1694040789299'),('Martin Fulton',32,'Pakistan','1636080581699'),('Dante Cox',32,'Belize','1642121192099'),('Lyle Delacruz',70,'Japan','1666021084599'),('Benjamin Pace',12,'Slovenia','1606040352799'),('Sawyer Morgan',12,'Cayman Islands','1649092358299'),('Reed Cervantes',18,'Montenegro','1636081822699'),('Andrew Melendez',46,'Netherlands','1609083000499'),('Jerry Lewis',53,'Central African Republic','1627041622099'),('Noble Stevenson',28,'New Zealand','1628021046199'),('Armand Rush',27,'Viet Nam','1647101294899'),('Devin Malone',28,'Montserrat','1613101214699'),('Abdul Contreras',51,'Angola','1645092685999'),('Tanner Eaton',64,'Jamaica','1610042168299'),('Herrod Wooten',29,'Kazakhstan','1625030254599'),('Boris Hobbs',62,'Guinea','1613121534299'),('Castor Gaines',60,'Nigeria','1639082457199'),('Kevin Pope',64,'Slovakia','1618062752699'),('Ahmed Warner',47,'Azerbaijan','1672091110899'),('Fritz Day',12,'Bosnia and Herzegovina','1623021739299'),('Tate Best',79,'Sao Tome and Principe','1660072784399'),('Joel Talley',27,'South Georgia and The South Sandwich Islands','1609021216199'),('Giacomo Mathis',65,'Argentina','1658021654999'),('Jeremy Wheeler',10,'Taiwan','1606051510399'),('Wayne Chambers',72,'Comoros','1637020198999');
INSERT INTO Personas([Nombre],[Edad],[Pais],[NID]) VALUES('Mark Hall',31,'Saint Martin','1622091672499'),('Lamar Roth',64,'Nicaragua','1653110245299'),('Jack Kaufman',77,'Taiwan','1627071093599'),('Malachi Wagner',76,'United States','1638061287799'),('Marsden Cooper',21,'Kenya','1677050354299'),('Mark Potter',43,'Solomon Islands','1644111670999'),('Jasper Howe',14,'Vanuatu','1659121071399'),('Blaze Slater',15,'Saint Martin','1628112693199'),('Orson Carr',55,'Costa Rica','1634052944299'),('Eric Banks',35,'Kenya','1622112893399'),('Carl Whitaker',39,'Serbia','1684010246599'),('Avram Farrell',26,'Christmas Island','1647041089899'),('Evan Moreno',36,'Greece','1647100219299'),('Uriel Ford',10,'Libya','1680121117799'),('Philip Cooley',46,'Lebanon','1661120357399'),('Shad Wooten',17,'Solomon Islands','1609022330599'),('Xander Goff',57,'Guernsey','1617051444599'),('Yardley Macias',65,'Sudan','1630112569699'),('Daniel Melendez',71,'Serbia','1672121335899'),('Coby Cobb',55,'Korea, South','1664070669699'),('Raja Burke',19,'Tuvalu','1642100540399'),('Ivan Thomas',30,'Turkmenistan','1680110412699'),('Craig Newman',69,'Timor-Leste','1682031129899'),('Channing Mercado',61,'Micronesia','1627080600899'),('Carson Chen',77,'Japan','1609101361499'),('Mohammad Luna',37,'Tunisia','1658031995399'),('Channing Gonzales',46,'Moldova','1695093019199'),('Joseph Wilkins',26,'Comoros','1641102162499'),('Xenos Torres',45,'Israel','1634063030499'),('Mark Mathews',21,'Mongolia','1672082945799'),('Dolan Ingram',33,'Malaysia','1656061708099'),('Nigel Tanner',67,'Zimbabwe','1697112814799'),('Kenneth Carver',56,'Myanmar','1683033022799'),('Branden Russo',11,'Mongolia','1694070623599'),('Sawyer Wallace',68,'Tajikistan','1601011269999'),('Kennan Hays',63,'Maldives','1602062520599'),('Jonah Carney',10,'Argentina','1630061445199'),('Gary Oliver',50,'Côte D''Ivoire (Ivory Coast)','1604050287899'),('Julian Oneil',65,'Qatar','1695112108099'),('Colorado Mayer',64,'Virgin Islands, United States','1687040852799'),('Gavin Nelson',36,'Tonga','1627061089699'),('Raymond Montgomery',34,'Bonaire, Sint Eustatius and Saba','1699102128299'),('Caleb Reid',62,'Panama','1637030486499'),('Sawyer Garner',62,'Antarctica','1679101908399'),('Leo Maxwell',55,'Puerto Rico','1685110128599'),('Garth Ball',65,'Cambodia','1686052024499'),('Plato Campbell',21,'Armenia','1626022409499'),('Alfonso Mills',19,'Tokelau','1637012730199'),('Amos Mckenzie',57,'South Sudan','1617030385399'),('Geoffrey Short',44,'Taiwan','1613122575799'),('Gannon Miranda',56,'Guyana','1620080670199'),('Nicholas Strong',64,'Thailand','1656012815899'),('Yasir Langley',45,'Ireland','1632022804199'),('Reese William',11,'Moldova','1624110748299'),('Cullen Payne',22,'Slovakia','1696040378799'),('Daquan Fitzpatrick',20,'Thailand','1608120964499'),('Kennedy Hutchinson',30,'Ethiopia','1646012640799'),('Hashim Harrell',36,'Serbia','1632012855699'),('Gareth Cunningham',19,'Namibia','1602040235899'),('Nissim George',45,'Ghana','1601021017399'),('Ezekiel Mays',47,'Australia','1625031080699'),('Malcolm Bernard',20,'New Zealand','1608020295799'),('Stewart Copeland',45,'Saint Martin','1645051484999'),('Dylan Norris',39,'Colombia','1668052135999'),('Fritz Miles',16,'Turkmenistan','1612011197099'),('Jameson Hale',23,'Cyprus','1686041692799'),('Thomas Gamble',46,'Tokelau','1654070750199'),('Xanthus Pittman',45,'Falkland Islands','1656032907099'),('Josiah Pittman',36,'Jersey','1674090822199'),('Brent Hatfield',23,'Bermuda','1623122216199'),('Akeem Webb',46,'Hungary','1649092107199'),('Kevin Rosales',56,'Israel','1653011869099'),('Murphy Terry',36,'Czech Republic','1659061111799'),('Kyle Mason',70,'Estonia','1626050341199'),('Leroy Ford',53,'Tonga','1689040170999'),('Scott Rhodes',78,'Virgin Islands, United States','1618091839999'),('Matthew Craft',65,'Madagascar','1699082319899'),('Chaney Mcintyre',77,'Nauru','1640070941399'),('Arthur Petersen',33,'Virgin Islands, British','1664061319199'),('Quinn Miles',40,'Congo, the Democratic Republic of the','1627032489599'),('Lester Lara',25,'Suriname','1676112151799'),('Michael Dickson',39,'Chad','1684041433499'),('Byron Knox',14,'Cayman Islands','1688031321999'),('Julian Guthrie',31,'New Caledonia','1611041042199'),('Geoffrey Whitfield',25,'Armenia','1632070112499'),('Bradley Gonzalez',36,'Bahrain','1640090178899'),('Quamar Kane',61,'Iraq','1605032511899'),('Dennis Logan',15,'Tajikistan','1604031902799'),('Scott Daugherty',25,'United States','1649011890599'),('Calvin Emerson',56,'Oman','1642090438699'),('Gary Rosario',75,'Kyrgyzstan','1631030489099'),('Wayne Hendricks',28,'Mauritania','1682011774199'),('Yasir Adams',15,'Ireland','1606030321199'),('Hiram Leonard',77,'Australia','1603030772699'),('Edward Herrera',45,'Burundi','1651062479999'),('Colt Franco',17,'Swaziland','1656091757299'),('Jared Gilmore',13,'Marshall Islands','1685111120799'),('Yardley Rodriguez',46,'Gambia','1672062660299'),('Dolan Rose',30,'San Marino','1692011890299'),('Palmer Scott',57,'Azerbaijan','1669090369799');





----- Columna calculable con condicional CASE

Select * from Personas

alter table Personas
ADD MayoriadeEdad AS
Case 
  When Edad > 30 Then 'Es Mayor de Edad'
  Else 'Aun Es joven'
End


























	--By Eduardo Alfaro Ch;--

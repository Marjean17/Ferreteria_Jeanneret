<center>
<img src="https://objetivo.news/download/multimedia.normal.bcba10cea1861629.Y29kZXJob3VzZS1xdWUtZXMtcXVlLWhhY2VuX25vcm1hbC53ZWJw.webp" style="width: 100% ; aspect-ratio:16/9">
</center>


# <center>Entrega de proyecto final</center>

* Alumno: Jeanneret Mariano Martin

* Comision; 53180

* Tutor: Santiago Angel Gonzalez Martin

* Docente: Anderson Michel TORRES


Inserción de datos
Se calculan los datos y se cargan en el archivo excel "SQL tablas.xlsx" a continuación de cada tabla cuidando de cargar cada registro separando los datos con coma a fin de luego pegar en un excel nuevo los registros para cada tabla y guardarlos como .csv 

Diagrama de entidad relación

    ![Modelo DER](/media/images/DER.png)

    - Listado de tablas con descripción de estructura (columna,descripción, tipo de datos, tipo de clave)
    - Scripts de creación de cada objeto de la base de datos
    - Scripts de inserción de datos
    - Informes generados en base a la información de la base
    - Herramientas y tecnologías usadas

## Tematica del proyecto

Contactados por el comercio “Los tres hermanos” dedicado al rubro ferretero se pactan y realizan 2 entrevistas iniciales con el analista funcional luego de una primer entrevista con el sector de ventas.

## Modelo de negocio

El modelo de negocios es el de una ferreteria de barrio que estando en expansión quiere generar una base de datos sobre el stock para manejar las existencias a partir de las compras y las ventas al tiempo que busca registrar las facturas de ambas operaciones. En un futuro estaría vinculando la base a una plataforma de ventas online al tiempo que piensa abrir mas sucursales de seguir creciendo en ventas.

## Diagrama entidad relacion (DER)

![DER](./media/images/DER.png)

## Listado de tablas y descripcion

Las tablas generadas fueron 10 de las cuales 9 fueron creadas e ingestadas mediante la utilización de tablas CSV y una décima tábla fue generada a fin de servir de LOG y ser posteriormente ingestada mediante triggers a medida que se produjeran cambiós en las táblas clientes o proveedores

A continueación se adjunta el detalle de las tablas involucradas

## Estructura e ingesta de datos

Se calculan los datos y se cargan en el archivo excel "SQL tablas.xlsx" a continuación de cada tabla cuidando de cargar cada registro separando los datos con coma a fin de luego pegar en un excel nuevo los registros para cada tabla y guardarlos como .csv 

## Objetos de la base de datos
### Vistas
>1.- Creamos una vista que nos devuelva los 3 clientes que mas dinero gastaron ordenando los mismos del que mas al que menos gastó
2.- Creamos una vista que nos diga cuales fueron los 2 proveedores a los que mas le compramos.
3.- Creamos una vista que nos muestre a los proveedores que están radicados en CABA
4.- Creamos una vista que nos muestre a los proveedores que se encuentran en el interior 
>5.- Creamos una vista que nos muestre Apellido y Nombre de cada cliente y que luego los concatene

### Funciones
>1.- Creamos una función que nos retorna la descripción de un producto cuando ingresamos el nombre del mismo
>2.- Creamos una función que ante el apellido de un cliente nos retorna su número de teléfono

### Store Procedures
>1.- Creamos un procedimiento que nos devuelva quienes fueron los 3 clientes que mas veces compraron un producto considerando todas las facturas si un cliente compró mas de una vez. Buscamos por código de producto
2.- Creamos un procedimiento que nos devuelva cual fue el producto mas comprado por un cliente >considerando todas las facturas si este compró mas de una vez.Buscamos por apellido

### Triggers

>1.- Creamos un trigger que cargue un registro identificando al usuario que haya insertado un registro en la tabla de proveedores
2.- Creamos un trigger que cargue un registro identificando al usuario que haya modificado un registro en la tabla de proveedores
3.- Creamos un trigger que cargue un registro identificando al usuario que haya eliminado un registro en la tabla de proveedores
4.- Creamos un trigger que cargue un registro identificando al usuario que haya insertado un registro en la tabla de clientes
5.- Creamos un trigger que cargue un registro identificando al usuario que haya modificado un registro en la tabla de clientes
6.- Creamos un trigger que cargue un registro identificando al usuario que haya eliminado un registro en >la tabla de clientes.

## Roles y permisos


## Back up de la base de datos

## Herramientas y tecnologias usadas

## Como levantar el proyecto en CodeSpaces GitHub
* env: Archivo con contraseñas y data secretas
* Makefile: Abstracción de creacción del proyecto
* docker-compose.yml: Permite generar las bases de datos en forma de contenedores

#### Pasos para arrancar el proyecto

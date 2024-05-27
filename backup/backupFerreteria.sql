CREATE DATABASE  IF NOT EXISTS `ferreteria3hermanos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ferreteria3hermanos`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ferreteria3hermanos
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cambios_log`
--

DROP TABLE IF EXISTS `cambios_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cambios_log` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TABLA_afectada` varchar(50) NOT NULL,
  `OPERACION` varchar(10) NOT NULL,
  `DETALLES` varchar(255) DEFAULT NULL,
  `USUARIO` varchar(50) DEFAULT NULL,
  `FECHA_hora` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cambios_log`
--

LOCK TABLES `cambios_log` WRITE;
/*!40000 ALTER TABLE `cambios_log` DISABLE KEYS */;
INSERT INTO `cambios_log` VALUES (1,'proveedores','INSERT','Se insertó un nuevo proveedor con ID 11','root@localhost','2024-04-19 11:29:09'),(2,'proveedores','UPDATE','Se realizó un cambio en un proveedor con ID 11','root@localhost','2024-04-19 11:31:44'),(3,'proveedores','DELETE','Se eliminó el proveedor con ID 11','root@localhost','2024-04-19 11:32:18'),(4,'clientes','INSERT','Se insertó un nuevo Cliente con CUIT 11','root@localhost','2024-04-19 12:00:29'),(5,'clientes','UPDATE','Se realizó un cambio en un cliente con CUIT 11','root@localhost','2024-04-19 12:08:41'),(6,'clientes','DELETE','Se eliminó el cliente con CUIT 11','root@localhost','2024-04-19 12:11:05');
/*!40000 ALTER TABLE `cambios_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `ID_CLI` int NOT NULL AUTO_INCREMENT,
  `APE_CLI` varchar(25) NOT NULL,
  `NOM_CLI` varchar(25) NOT NULL,
  `DIR_CLI` varchar(50) NOT NULL,
  `TEL_CLI` varchar(20) NOT NULL,
  `CON_TRI` varchar(25) DEFAULT NULL,
  `NAC` date DEFAULT NULL,
  `TIEMPO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_CLI`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'González','Juan','Calle Flores 123','555-123456','Consumidor Final','1985-03-15','2024-04-16 20:43:54'),(2,'Rodríguez','María','Avenida Principal 456','555-654321','Consumidor Final','1990-07-20','2024-04-16 20:43:54'),(3,'López','Carlos','Calle Central 789','555-987654','Consumidor Final','1978-12-10','2024-04-16 20:43:54'),(4,'Martínez','Ana','Avenida Norte 101','555-321654','Consumidor Final','1982-05-28','2024-04-16 20:43:54'),(5,'Perez','Laura','Calle Sur 202','555-789456','Responsable Inscripto','1995-09-03','2024-04-16 20:43:54'),(6,'Diaz','Pedro','Avenida Oeste 303','555-456123','Consumidor Final','1989-11-12','2024-04-16 20:43:54'),(7,'Sanchez','Luisa','Calle Este 404','555-147258','Responsable Inscripto','1983-08-17','2024-04-16 20:43:54'),(8,'Romero','Miguel','Avenida Poniente 505','555-369852','Consumidor Final','1993-02-25','2024-04-16 20:43:54'),(9,'Torres','Lucas','Calle Nueva 606','555-258369','Consumidor Final','1980-06-30','2024-04-16 20:43:54'),(10,'Gomez','Daniel','Avenida Vieja 707','555-741852','Responsable Inscripto','1997-04-07','2024-04-16 20:43:54');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_crearCli` AFTER INSERT ON `clientes` FOR EACH ROW BEGIN
  INSERT INTO cambios_log (TABLA_afectada, OPERACION, DETALLES, USUARIO, FECHA_hora)
  VALUES ('clientes', 'INSERT', CONCAT('Se insertó un nuevo Cliente con CUIT ', NEW.ID_CLI),current_user(), NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_modificarCli` BEFORE UPDATE ON `clientes` FOR EACH ROW BEGIN
  INSERT INTO cambios_log (TABLA_afectada, OPERACION, DETALLES, USUARIO, FECHA_hora)
  VALUES ('clientes', 'UPDATE', CONCAT('Se realizó un cambio en un cliente con CUIT ', OLD.ID_CLI), current_user(), NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_borrarCli` BEFORE DELETE ON `clientes` FOR EACH ROW BEGIN
  INSERT INTO cambios_log (TABLA_afectada, OPERACION, DETALLES, USUARIO, FECHA_hora)
  VALUES ('clientes', 'DELETE', CONCAT('Se eliminó el cliente con CUIT ', OLD.ID_CLI), current_user(), NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `descripcion_productos`
--

DROP TABLE IF EXISTS `descripcion_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descripcion_productos` (
  `COD_PRO` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_PRO` varchar(25) NOT NULL,
  `DESCR_PRO` varchar(100) DEFAULT 'Sin información',
  `TIEMPO` datetime DEFAULT NULL,
  PRIMARY KEY (`COD_PRO`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descripcion_productos`
--

LOCK TABLES `descripcion_productos` WRITE;
/*!40000 ALTER TABLE `descripcion_productos` DISABLE KEYS */;
INSERT INTO `descripcion_productos` VALUES (1,'Martillo','Martillo de acero con mango de madera.','2024-04-16 20:43:54'),(2,'Destornillador','Destornillador Phillips de punta magnética.','2024-04-16 20:43:54'),(3,'Sierra Circular','Sierra circular de 7.25 pulgadas.','2024-04-16 20:43:54'),(4,'Clavos','Clavos de acero galvanizadode 2 pulgadas 100 unidades.','2024-04-16 20:43:54'),(5,'Llave Inglesa','Llave inglesa ajustable de 10 pulgadas.','2024-04-16 20:43:54'),(6,'Pintura Blanca','Pintura látex blanca de 20lts.','2024-04-16 20:43:54'),(7,'Cinta Métrica','Cinta métrica de 25 pies.','2024-04-16 20:43:54'),(8,'Tornillos','Tornillos de acero inoxidable paquete de 50 unidades.','2024-04-16 20:43:54'),(9,'Cepillo Metálico','Cepillo de alambre de acero.','2024-04-16 20:43:54'),(10,'Nivel de Burbuja','Nivel de burbuja magnético de 9 pulgadas.','2024-04-16 20:43:54');
/*!40000 ALTER TABLE `descripcion_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `FAC_CPA` int NOT NULL,
  `COD_PRO` int NOT NULL,
  `CAN_PRO` int NOT NULL,
  `VAL_CPA` decimal(10,2) NOT NULL DEFAULT '0.00',
  `TIEMPO` datetime DEFAULT NULL,
  PRIMARY KEY (`FAC_CPA`,`COD_PRO`),
  KEY `COD_PRO` (`COD_PRO`),
  CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`FAC_CPA`) REFERENCES `factura_compra` (`FAC_CPA`),
  CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`COD_PRO`) REFERENCES `descripcion_productos` (`COD_PRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` VALUES (1,1,5,100.00,'2024-04-16 20:43:54'),(1,2,8,200.00,'2024-04-16 20:43:54'),(2,3,12,300.00,'2024-04-16 20:43:54'),(2,4,15,400.00,'2024-04-16 20:43:54'),(3,5,20,500.00,'2024-04-16 20:43:54'),(3,6,25,600.00,'2024-04-16 20:43:54'),(4,7,30,700.00,'2024-04-16 20:43:54'),(4,8,35,800.00,'2024-04-16 20:43:54'),(5,9,40,900.00,'2024-04-16 20:43:54'),(5,10,45,1000.00,'2024-04-16 20:43:54');
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `FAC_VTA` int NOT NULL,
  `COD_PRO` int NOT NULL,
  `CAN_PRO` int NOT NULL,
  `VAL_VTA` decimal(10,2) NOT NULL DEFAULT '0.00',
  `TIEMPO` datetime DEFAULT NULL,
  PRIMARY KEY (`FAC_VTA`,`COD_PRO`),
  KEY `COD_PRO` (`COD_PRO`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`FAC_VTA`) REFERENCES `factura_venta` (`FAC_VTA`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`COD_PRO`) REFERENCES `descripcion_productos` (`COD_PRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,1,5,150.00,'2024-04-16 20:43:54'),(2,2,8,250.00,'2024-04-16 20:43:54'),(3,3,12,350.00,'2024-04-16 20:43:54'),(4,4,15,450.00,'2024-04-16 20:43:54'),(5,5,20,550.00,'2024-04-16 20:43:54'),(6,6,25,650.00,'2024-04-16 20:43:54'),(7,7,30,750.00,'2024-04-16 20:43:54'),(8,8,35,850.00,'2024-04-16 20:43:54'),(9,9,40,950.00,'2024-04-16 20:43:54'),(10,10,1050,45.00,'2024-04-16 20:43:54');
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_compra`
--

DROP TABLE IF EXISTS `factura_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_compra` (
  `FAC_CPA` int NOT NULL AUTO_INCREMENT,
  `ID_PROV` int NOT NULL,
  `TIEMPO` datetime DEFAULT NULL,
  PRIMARY KEY (`FAC_CPA`),
  KEY `ID_PROV` (`ID_PROV`),
  CONSTRAINT `factura_compra_ibfk_1` FOREIGN KEY (`ID_PROV`) REFERENCES `proveedores` (`ID_PROV`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_compra`
--

LOCK TABLES `factura_compra` WRITE;
/*!40000 ALTER TABLE `factura_compra` DISABLE KEYS */;
INSERT INTO `factura_compra` VALUES (1,1,'2024-04-16 20:43:54'),(2,2,'2024-04-16 20:43:54'),(3,3,'2024-04-16 20:43:54'),(4,4,'2024-04-16 20:43:54'),(5,5,'2024-04-16 20:43:54'),(6,6,'2024-04-16 20:43:54'),(7,7,'2024-04-16 20:43:54'),(8,8,'2024-04-16 20:43:54'),(9,9,'2024-04-16 20:43:54'),(10,10,'2024-04-16 20:43:54');
/*!40000 ALTER TABLE `factura_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_venta`
--

DROP TABLE IF EXISTS `factura_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_venta` (
  `FAC_VTA` int NOT NULL AUTO_INCREMENT,
  `ID_CLI` int NOT NULL,
  `TIEMPO` datetime DEFAULT NULL,
  PRIMARY KEY (`FAC_VTA`),
  KEY `ID_CLI` (`ID_CLI`),
  CONSTRAINT `factura_venta_ibfk_1` FOREIGN KEY (`ID_CLI`) REFERENCES `clientes` (`ID_CLI`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_venta`
--

LOCK TABLES `factura_venta` WRITE;
/*!40000 ALTER TABLE `factura_venta` DISABLE KEYS */;
INSERT INTO `factura_venta` VALUES (1,1,'2024-04-16 20:43:54'),(2,2,'2024-04-16 20:43:54'),(3,3,'2024-04-16 20:43:54'),(4,4,'2024-04-16 20:43:54'),(5,5,'2024-04-16 20:43:54'),(6,6,'2024-04-16 20:43:54'),(7,7,'2024-04-16 20:43:54'),(8,8,'2024-04-16 20:43:54'),(9,9,'2024-04-16 20:43:54'),(10,10,'2024-04-16 20:43:54');
/*!40000 ALTER TABLE `factura_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mayoresproveedores`
--

DROP TABLE IF EXISTS `mayoresproveedores`;
/*!50001 DROP VIEW IF EXISTS `mayoresproveedores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mayoresproveedores` AS SELECT 
 1 AS `NOMBRE_PROV`,
 1 AS `TEL_PROV`,
 1 AS `VAL_CPA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mejoresclientes`
--

DROP TABLE IF EXISTS `mejoresclientes`;
/*!50001 DROP VIEW IF EXISTS `mejoresclientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mejoresclientes` AS SELECT 
 1 AS `APE_CLI`,
 1 AS `NOM_CLI`,
 1 AS `TEL_CLI`,
 1 AS `VAL_VTA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `nombrecompleto`
--

DROP TABLE IF EXISTS `nombrecompleto`;
/*!50001 DROP VIEW IF EXISTS `nombrecompleto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `nombrecompleto` AS SELECT 
 1 AS `nc`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `producto_por_proveedor`
--

DROP TABLE IF EXISTS `producto_por_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_por_proveedor` (
  `ID_PROV` int NOT NULL,
  `COD_PRO` int NOT NULL,
  `VAL_COS` decimal(10,2) NOT NULL DEFAULT '0.00',
  `VAL_VTA` decimal(10,2) NOT NULL DEFAULT '0.00',
  `TIEMPO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PROV`,`COD_PRO`),
  KEY `COD_PRO` (`COD_PRO`),
  CONSTRAINT `producto_por_proveedor_ibfk_1` FOREIGN KEY (`ID_PROV`) REFERENCES `proveedores` (`ID_PROV`),
  CONSTRAINT `producto_por_proveedor_ibfk_2` FOREIGN KEY (`COD_PRO`) REFERENCES `descripcion_productos` (`COD_PRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_por_proveedor`
--

LOCK TABLES `producto_por_proveedor` WRITE;
/*!40000 ALTER TABLE `producto_por_proveedor` DISABLE KEYS */;
INSERT INTO `producto_por_proveedor` VALUES (1,1,5.99,8.99,'2024-04-16 20:43:54'),(2,2,7.99,11.99,'2024-04-16 20:43:54'),(3,3,99.99,149.99,'2024-04-16 20:43:54'),(4,4,3.99,6.99,'2024-04-16 20:43:54'),(5,5,9.99,14.99,'2024-04-16 20:43:54'),(6,6,19.99,29.99,'2024-04-16 20:43:54'),(7,7,6.49,9.49,'2024-04-16 20:43:54'),(8,8,2.49,3.99,'2024-04-16 20:43:54'),(9,9,4.99,7.99,'2024-04-16 20:43:54'),(10,10,5.99,8.99,'2024-04-16 20:43:54');
/*!40000 ALTER TABLE `producto_por_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `ID_PROV` int NOT NULL AUTO_INCREMENT,
  `CUIT_PROV` varchar(20) DEFAULT NULL,
  `NOMBRE_PROV` varchar(25) NOT NULL,
  `DIREC_PROV` varchar(50) NOT NULL,
  `TEL_PROV` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_PROV`),
  UNIQUE KEY `TEL_PROV` (`TEL_PROV`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'50-12345678-1','Bahco','Calle 123 - CABA','123-456789'),(2,'50-87654321-2','Skill','Avenida XYZ - CABA','987-654321'),(3,'50-13579246-3','Gherardi','Calle Principal - La Plata','321-654987'),(4,'50-24681357-4','Herrametal','Avenida Central - CABA','555-123456'),(5,'50-31472586-5','El Abuelo','Calle Secundaria - CABA','777-987654'),(6,'50-36925814-6','Black and Decker','Avenida Norte - Cordoba','888-456123'),(7,'50-75316982-7','Cortamax','Calle Sur - CABA','999-789456'),(8,'50-85274163-8','Stanley','Calle Este - CABA','111-321654'),(9,'50-96135724-9','Poxipol','Calle Oeste - La Plata','222-654987'),(10,'50-54823697-0','Aliafor','Avenida Poniente - Rosario','333-987654');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_crearProv` AFTER INSERT ON `proveedores` FOR EACH ROW BEGIN
  INSERT INTO cambios_log (TABLA_afectada, OPERACION, DETALLES, USUARIO, FECHA_hora)
  VALUES ('proveedores', 'INSERT', CONCAT('Se insertó un nuevo proveedor con ID ', NEW.ID_PROV),current_user(), NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_modificarProv` BEFORE UPDATE ON `proveedores` FOR EACH ROW BEGIN
  INSERT INTO cambios_log (TABLA_afectada, OPERACION, DETALLES, USUARIO, FECHA_hora)
  VALUES ('proveedores', 'UPDATE', CONCAT('Se realizó un cambio en un proveedor con ID ', OLD.ID_PROV), current_user(), NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_borrarProv` BEFORE DELETE ON `proveedores` FOR EACH ROW BEGIN
  INSERT INTO cambios_log (TABLA_afectada, OPERACION, DETALLES, USUARIO, FECHA_hora)
  VALUES ('proveedores', 'DELETE', CONCAT('Se eliminó el proveedor con ID ', OLD.ID_PROV), current_user(), NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `proveedorescaba`
--

DROP TABLE IF EXISTS `proveedorescaba`;
/*!50001 DROP VIEW IF EXISTS `proveedorescaba`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `proveedorescaba` AS SELECT 
 1 AS `ID_PROV`,
 1 AS `CUIT_PROV`,
 1 AS `NOMBRE_PROV`,
 1 AS `DIREC_PROV`,
 1 AS `TEL_PROV`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `proveedoresinterior`
--

DROP TABLE IF EXISTS `proveedoresinterior`;
/*!50001 DROP VIEW IF EXISTS `proveedoresinterior`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `proveedoresinterior` AS SELECT 
 1 AS `ID_PROV`,
 1 AS `CUIT_PROV`,
 1 AS `NOMBRE_PROV`,
 1 AS `DIREC_PROV`,
 1 AS `TEL_PROV`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `COD_PRO` int NOT NULL,
  `CAN_PRO` int NOT NULL,
  `TIEMPO` datetime DEFAULT NULL,
  PRIMARY KEY (`COD_PRO`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`COD_PRO`) REFERENCES `descripcion_productos` (`COD_PRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,100,'2024-04-16 20:43:54'),(2,200,'2024-04-16 20:43:54'),(3,150,'2024-04-16 20:43:54'),(4,250,'2024-04-16 20:43:54'),(5,180,'2024-04-16 20:43:54'),(6,300,'2024-04-16 20:43:54'),(7,220,'2024-04-16 20:43:54'),(8,400,'2024-04-16 20:43:54'),(9,175,'2024-04-16 20:43:54'),(10,350,'2024-04-16 20:43:54');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ferreteria3hermanos'
--

--
-- Dumping routines for database 'ferreteria3hermanos'
--
/*!50003 DROP FUNCTION IF EXISTS `fMostrarDescr` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fMostrarDescr`(p_nombre varchar(200)) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
begin
		declare descrBuscada varchar(200);
			select descr_pro into descrBuscada 
			from descripcion_productos 
			where nombre_pro = p_nombre;
            
	return descrBuscada;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fMostrarTelCli` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fMostrarTelCli`(c_apellido varchar(200)) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
begin
		declare telCliente varchar(200);
			select tel_cli into telCliente 
			from clientes 
			where ape_cli = c_apellido;
            
	return telCliente;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cliente_x_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cliente_x_producto`(IN p_cod_pro INT)
BEGIN
    DECLARE v_Nom_cli VARCHAR(50);
    DECLARE v_ape_cli VARCHAR(50);
    DECLARE v_tel_cli VARCHAR(20);
    DECLARE v_nombre_pro VARCHAR(20);
    DECLARE v_veces_comprado INT;
    
    SELECT c.Nom_cli, c.ape_cli, c.tel_cli, dp.nombre_pro, COUNT(*) AS veces_comprado
    INTO v_Nom_cli, v_ape_cli, v_tel_cli, v_nombre_pro, v_veces_comprado
    FROM clientes AS c
    JOIN factura_venta AS fv ON fv.id_cli = c.id_cli
    JOIN detalle_venta AS dv ON dv.fac_vta = fv.fac_vta
    JOIN descripcion_productos AS dp ON dp.cod_pro = dv.cod_pro
    WHERE dp.cod_pro = p_cod_pro
    GROUP BY c.Nom_cli, c.ape_cli, c.tel_cli, dp.nombre_pro
    ORDER BY veces_comprado DESC
    LIMIT 3;
    
    -- Devolver el resultado
    SELECT v_Nom_cli, v_ape_cli, v_tel_cli, p_cod_pro, v_nombre_pro, v_veces_comprado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cliente_x_producto_por_apellido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cliente_x_producto_por_apellido`(IN p_ape_cli VARCHAR(50))
BEGIN
    DECLARE v_Nom_cli VARCHAR(50);
    DECLARE v_ape_cli VARCHAR(50);
    DECLARE v_tel_cli VARCHAR(20);
    DECLARE v_nom_pro_mas_comprado VARCHAR(100);
    DECLARE v_veces_comprado INT;
    
    SELECT c.Nom_cli, c.ape_cli, c.tel_cli
    INTO v_Nom_cli, v_ape_cli, v_tel_cli
    FROM clientes AS c
    WHERE c.ape_cli = p_ape_cli
    LIMIT 1;
    
    SELECT dp.nombre_pro, COUNT(*) AS veces_comprado
    INTO v_nom_pro_mas_comprado, v_veces_comprado
    FROM clientes AS c
    JOIN factura_venta AS fv ON fv.id_cli = c.id_cli
    JOIN detalle_venta AS dv ON dv.fac_vta = fv.fac_vta
    JOIN descripcion_productos AS dp ON dp.cod_pro = dv.cod_pro
    WHERE c.ape_cli = p_ape_cli
    GROUP BY dp.nombre_pro
    ORDER BY veces_comprado DESC
    LIMIT 1;
    
    -- Devolver el resultado
    SELECT v_Nom_cli, v_ape_cli, v_tel_cli, v_nom_pro_mas_comprado, v_veces_comprado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `mayoresproveedores`
--

/*!50001 DROP VIEW IF EXISTS `mayoresproveedores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mayoresproveedores` AS select `p`.`NOMBRE_PROV` AS `NOMBRE_PROV`,`p`.`TEL_PROV` AS `TEL_PROV`,`dc`.`VAL_CPA` AS `VAL_CPA` from ((`proveedores` `p` join `factura_compra` `fc` on((`fc`.`ID_PROV` = `p`.`ID_PROV`))) join `detalle_compra` `dc` on((`dc`.`FAC_CPA` = `fc`.`FAC_CPA`))) order by `dc`.`VAL_CPA` desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mejoresclientes`
--

/*!50001 DROP VIEW IF EXISTS `mejoresclientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mejoresclientes` AS select `c`.`APE_CLI` AS `APE_CLI`,`c`.`NOM_CLI` AS `NOM_CLI`,`c`.`TEL_CLI` AS `TEL_CLI`,`dv`.`VAL_VTA` AS `VAL_VTA` from ((`clientes` `c` join `factura_venta` `fv` on((`fv`.`ID_CLI` = `c`.`ID_CLI`))) join `detalle_venta` `dv` on((`dv`.`FAC_VTA` = `fv`.`FAC_VTA`))) order by `dv`.`VAL_VTA` desc limit 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nombrecompleto`
--

/*!50001 DROP VIEW IF EXISTS `nombrecompleto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nombrecompleto` AS select concat(`clientes`.`NOM_CLI`,' ',`clientes`.`APE_CLI`) AS `nc` from `clientes` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `proveedorescaba`
--

/*!50001 DROP VIEW IF EXISTS `proveedorescaba`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `proveedorescaba` AS select `proveedores`.`ID_PROV` AS `ID_PROV`,`proveedores`.`CUIT_PROV` AS `CUIT_PROV`,`proveedores`.`NOMBRE_PROV` AS `NOMBRE_PROV`,`proveedores`.`DIREC_PROV` AS `DIREC_PROV`,`proveedores`.`TEL_PROV` AS `TEL_PROV` from `proveedores` where (`proveedores`.`DIREC_PROV` like '%CABA') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `proveedoresinterior`
--

/*!50001 DROP VIEW IF EXISTS `proveedoresinterior`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `proveedoresinterior` AS select `proveedores`.`ID_PROV` AS `ID_PROV`,`proveedores`.`CUIT_PROV` AS `CUIT_PROV`,`proveedores`.`NOMBRE_PROV` AS `NOMBRE_PROV`,`proveedores`.`DIREC_PROV` AS `DIREC_PROV`,`proveedores`.`TEL_PROV` AS `TEL_PROV` from `proveedores` where (not((`proveedores`.`DIREC_PROV` like '%CABA%'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-26 22:31:26

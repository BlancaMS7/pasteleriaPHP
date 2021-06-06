CREATE DATABASE  IF NOT EXISTS `pasteleria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pasteleria`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: pasteleria
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `IdCliente` int NOT NULL AUTO_INCREMENT,
  `NombreCliente` varchar(100) DEFAULT NULL,
  `DireccionCliente` varchar(100) DEFAULT NULL,
  `NombreConsumicion` varchar(45) DEFAULT NULL,
  `CantidadConsumicion` int DEFAULT NULL,
  `PrecioConsumicion` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`IdCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Alvaro Garcia','Calle del pescado 21 4A','Donuts chocolate blanco',12,20.00),(2,'Miguel Gonzalez','Avenida desengaño 21 10A','Tarta tres chocolates',1,30.00),(3,'Ana Blanco','Calle Andalucia 65','Galletas de chocolate',20,40.00);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumiciones`
--

DROP TABLE IF EXISTS `consumiciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumiciones` (
  `IdConsumicion` int NOT NULL AUTO_INCREMENT,
  `PrecioConsumicion` decimal(6,2) DEFAULT NULL,
  `CantidadConsumicion` int DEFAULT NULL,
  `IdClienteFK5` int DEFAULT NULL,
  `IdTrabajadorFK6` int DEFAULT NULL,
  PRIMARY KEY (`IdConsumicion`),
  KEY `IdClienteFK5` (`IdClienteFK5`),
  KEY `IdTrabajadorFK6` (`IdTrabajadorFK6`),
  CONSTRAINT `consumiciones_ibfk_1` FOREIGN KEY (`IdClienteFK5`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `consumiciones_ibfk_2` FOREIGN KEY (`IdTrabajadorFK6`) REFERENCES `trabajadores` (`IdTrabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumiciones`
--

LOCK TABLES `consumiciones` WRITE;
/*!40000 ALTER TABLE `consumiciones` DISABLE KEYS */;
INSERT INTO `consumiciones` VALUES (1,20.00,12,1,2),(2,40.00,20,2,3),(3,30.00,1,3,1);
/*!40000 ALTER TABLE `consumiciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encargo`
--

DROP TABLE IF EXISTS `encargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encargo` (
  `IdEncargo` int NOT NULL AUTO_INCREMENT,
  `CantidadEncargo` int DEFAULT NULL,
  `DireccionEncargo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdEncargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encargo`
--

LOCK TABLES `encargo` WRITE;
/*!40000 ALTER TABLE `encargo` DISABLE KEYS */;
INSERT INTO `encargo` VALUES (1,20,'Calle del pescado 21 4A'),(2,2,'Urbanizacion Alambique II 209'),(3,15,'Avenida de la paz 19 6C');
/*!40000 ALTER TABLE `encargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jefe`
--

DROP TABLE IF EXISTS `jefe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jefe` (
  `IdJefe` int NOT NULL AUTO_INCREMENT,
  `NombreJefe` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdJefe`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jefe`
--

LOCK TABLES `jefe` WRITE;
/*!40000 ALTER TABLE `jefe` DISABLE KEYS */;
INSERT INTO `jefe` VALUES (1,'Carlos Martinez');
/*!40000 ALTER TABLE `jefe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasteleros`
--

DROP TABLE IF EXISTS `pasteleros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasteleros` (
  `IdPastelero` int NOT NULL AUTO_INCREMENT,
  `NombrePastelero` varchar(100) DEFAULT NULL,
  `DireccionPastelero` varchar(100) DEFAULT NULL,
  `IdTrabajadorFK2` int DEFAULT NULL,
  PRIMARY KEY (`IdPastelero`),
  KEY `IdTrabajadorFK2` (`IdTrabajadorFK2`),
  CONSTRAINT `pasteleros_ibfk_1` FOREIGN KEY (`IdTrabajadorFK2`) REFERENCES `trabajadores` (`IdTrabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasteleros`
--

LOCK TABLES `pasteleros` WRITE;
/*!40000 ALTER TABLE `pasteleros` DISABLE KEYS */;
INSERT INTO `pasteleros` VALUES (1,'Maria Gomez','Urbanizacion Los girasoles 24',1),(2,'Alberto Ramirez','Avenida San Sebastian 29 12B',2),(3,'Laura Sanchez','Calle Salvador Dalí',3);
/*!40000 ALTER TABLE `pasteleros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repartidores`
--

DROP TABLE IF EXISTS `repartidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repartidores` (
  `IdRepartidor` int NOT NULL AUTO_INCREMENT,
  `NombreRepartidor` varchar(100) DEFAULT NULL,
  `DireccionRepartidor` varchar(100) DEFAULT NULL,
  `IdEncargoFK4` int DEFAULT NULL,
  `IdTrabajadorFK3` int DEFAULT NULL,
  PRIMARY KEY (`IdRepartidor`),
  KEY `IdTrabajadorFK3` (`IdTrabajadorFK3`),
  KEY `IdEncargoFK4` (`IdEncargoFK4`),
  CONSTRAINT `repartidores_ibfk_1` FOREIGN KEY (`IdTrabajadorFK3`) REFERENCES `trabajadores` (`IdTrabajador`),
  CONSTRAINT `repartidores_ibfk_2` FOREIGN KEY (`IdEncargoFK4`) REFERENCES `encargo` (`IdEncargo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repartidores`
--

LOCK TABLES `repartidores` WRITE;
/*!40000 ALTER TABLE `repartidores` DISABLE KEYS */;
INSERT INTO `repartidores` VALUES (4,'Macarena Alvarez','Calle Lavanda 87',NULL,NULL),(5,'Jaime rodriguez','Avenida San Francisco 5 12B',NULL,NULL),(6,'Sara Sanchez','Avenida Marruecos 18 10B',NULL,NULL);
/*!40000 ALTER TABLE `repartidores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajadores`
--

DROP TABLE IF EXISTS `trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajadores` (
  `IdTrabajador` int NOT NULL AUTO_INCREMENT,
  `NombreTrabajador` varchar(100) DEFAULT NULL,
  `DireccionTrabajador` varchar(100) DEFAULT NULL,
  `IdJefeFK1` int DEFAULT NULL,
  PRIMARY KEY (`IdTrabajador`),
  KEY `IdJefeFK1` (`IdJefeFK1`),
  CONSTRAINT `trabajadores_ibfk_1` FOREIGN KEY (`IdJefeFK1`) REFERENCES `jefe` (`IdJefe`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajadores`
--

LOCK TABLES `trabajadores` WRITE;
/*!40000 ALTER TABLE `trabajadores` DISABLE KEYS */;
INSERT INTO `trabajadores` VALUES (1,'Pepe Perez','Calle Pablo Picasso 34',1),(2,'Antonio Sanchez','Calle Diego Velazquez 43',1),(3,'Ana Martinez','Avenida Juan Gris 34 5B',1);
/*!40000 ALTER TABLE `trabajadores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-09  4:12:39

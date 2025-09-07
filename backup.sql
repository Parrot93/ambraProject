-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acquirente`
--

DROP TABLE IF EXISTS `acquirente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acquirente` (
  `username` varchar(20) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `cognome` varchar(20) DEFAULT NULL,
  `data_nascita` date DEFAULT NULL,
  `citta_nascita` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acquirente`
--

LOCK TABLES `acquirente` WRITE;
/*!40000 ALTER TABLE `acquirente` DISABLE KEYS */;
INSERT INTO `acquirente` VALUES ('alessandro','password789','Alessandro','Verdi','1982-11-02','Torino'),('ambra','psf','Ambra','Martelletti','1993-07-09','Frosinone'),('giovanni','password123','Giovanni','Rossi','1985-03-22','Roma'),('maria','password456','Maria','Bianchi','1990-07-15','Milano');
/*!40000 ALTER TABLE `acquirente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `pwd` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin1','pass1'),('admin2','pass2');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asta`
--

DROP TABLE IF EXISTS `asta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asta` (
  `id_asta` int NOT NULL,
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL,
  `oggetto_codice` varchar(10) NOT NULL,
  PRIMARY KEY (`id_asta`,`oggetto_codice`),
  KEY `fk_asta_oggetto1_idx` (`oggetto_codice`),
  CONSTRAINT `fk_asta_oggetto1` FOREIGN KEY (`oggetto_codice`) REFERENCES `oggetto` (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asta`
--

LOCK TABLES `asta` WRITE;
/*!40000 ALTER TABLE `asta` DISABLE KEYS */;
/*!40000 ALTER TABLE `asta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carta`
--

DROP TABLE IF EXISTS `carta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carta` (
  `numero` bigint NOT NULL,
  `intestatario` varchar(45) DEFAULT NULL,
  `CVV` int DEFAULT NULL,
  `data_scadenza` date DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carta`
--

LOCK TABLES `carta` WRITE;
/*!40000 ALTER TABLE `carta` DISABLE KEYS */;
INSERT INTO `carta` VALUES (1356742987653109,'Mario Rossi',764,'2027-12-06'),(1987654321098765,'Ambra Martelletti',123,'2026-09-08');
/*!40000 ALTER TABLE `carta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `nome_categoria` varchar(45) NOT NULL,
  `categoria_nome_categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`nome_categoria`,`categoria_nome_categoria`),
  KEY `fk_categoria_categoria1_idx` (`categoria_nome_categoria`),
  CONSTRAINT `fk_categoria_categoria1` FOREIGN KEY (`categoria_nome_categoria`) REFERENCES `categoria` (`nome_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indirizzo`
--

DROP TABLE IF EXISTS `indirizzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indirizzo` (
  `via` varchar(45) NOT NULL,
  `civico` int NOT NULL,
  `CAP` int DEFAULT NULL,
  `citta` varchar(45) NOT NULL,
  `acquirente_username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`via`,`civico`,`citta`),
  KEY `fk_indirizzo_acquirente_idx` (`acquirente_username`),
  CONSTRAINT `fk_indirizzo_acquirente` FOREIGN KEY (`acquirente_username`) REFERENCES `acquirente` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indirizzo`
--

LOCK TABLES `indirizzo` WRITE;
/*!40000 ALTER TABLE `indirizzo` DISABLE KEYS */;
INSERT INTO `indirizzo` VALUES ('Corso Venezia',10,20100,'Milano','maria'),('Piazza San Carlo',20,10100,'Torino','alessandro'),('Via Pozzi',15,3010,'Vico nel Lazio','ambra'),('Via Roma',15,100,'Roma','giovanni');
/*!40000 ALTER TABLE `indirizzo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offerta`
--

DROP TABLE IF EXISTS `offerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offerta` (
  `valore` float DEFAULT NULL,
  `orario` varchar(45) DEFAULT NULL,
  `acquirente_username` varchar(20) NOT NULL,
  `oggetto_codice` varchar(10) NOT NULL,
  PRIMARY KEY (`acquirente_username`,`oggetto_codice`),
  KEY `fk_offerta_acquirente1_idx` (`acquirente_username`),
  KEY `fk_offerta_oggetto1_idx` (`oggetto_codice`),
  CONSTRAINT `fk_offerta_acquirente1` FOREIGN KEY (`acquirente_username`) REFERENCES `acquirente` (`username`),
  CONSTRAINT `fk_offerta_oggetto1` FOREIGN KEY (`oggetto_codice`) REFERENCES `oggetto` (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offerta`
--

LOCK TABLES `offerta` WRITE;
/*!40000 ALTER TABLE `offerta` DISABLE KEYS */;
/*!40000 ALTER TABLE `offerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oggetto`
--

DROP TABLE IF EXISTS `oggetto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oggetto` (
  `codice` varchar(10) NOT NULL,
  `condizione` enum('NUOVO','USATO') DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `prezzo_base` float DEFAULT NULL,
  `admin_username` varchar(20) DEFAULT NULL,
  `categoria_nome_categoria` varchar(45) DEFAULT NULL,
  `id_asta` int DEFAULT NULL,
  `stato` enum('VENDUTO','IN_VENDITA') DEFAULT NULL,
  PRIMARY KEY (`codice`),
  KEY `fk_oggetto_admin1_idx` (`admin_username`),
  KEY `fk_oggetto_categoria1_idx` (`categoria_nome_categoria`),
  CONSTRAINT `fk_oggetto_admin1` FOREIGN KEY (`admin_username`) REFERENCES `admin` (`username`),
  CONSTRAINT `fk_oggetto_categoria1` FOREIGN KEY (`categoria_nome_categoria`) REFERENCES `categoria` (`nome_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oggetto`
--

LOCK TABLES `oggetto` WRITE;
/*!40000 ALTER TABLE `oggetto` DISABLE KEYS */;
/*!40000 ALTER TABLE `oggetto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilizzo`
--

DROP TABLE IF EXISTS `utilizzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilizzo` (
  `acquirente_username` varchar(20) NOT NULL,
  `carta_numero` bigint NOT NULL,
  PRIMARY KEY (`acquirente_username`,`carta_numero`),
  KEY `fk_utilizzo_acquirente1_idx` (`acquirente_username`),
  KEY `fk_utilizzo_carta1_idx` (`carta_numero`),
  CONSTRAINT `fk_utilizzo_acquirente1` FOREIGN KEY (`acquirente_username`) REFERENCES `acquirente` (`username`),
  CONSTRAINT `fk_utilizzo_numero1` FOREIGN KEY (`carta_numero`) REFERENCES `carta` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilizzo`
--

LOCK TABLES `utilizzo` WRITE;
/*!40000 ALTER TABLE `utilizzo` DISABLE KEYS */;
INSERT INTO `utilizzo` VALUES ('ambra',1356742987653109),('ambra',1987654321098765),('giovanni',1987654321098765);
/*!40000 ALTER TABLE `utilizzo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-07 11:35:58

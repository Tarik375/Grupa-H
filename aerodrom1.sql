CREATE DATABASE  IF NOT EXISTS `aerodrom` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aerodrom`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: aerodrom
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
-- Table structure for table `aerodrom`
--

DROP TABLE IF EXISTS `aerodrom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aerodrom` (
  `aerodrom_ID` int NOT NULL AUTO_INCREMENT,
  `ime_aerodroma` varchar(255) NOT NULL,
  `grad` varchar(255) DEFAULT NULL,
  `drzava` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aerodrom_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aerodrom`
--

LOCK TABLES `aerodrom` WRITE;
/*!40000 ALTER TABLE `aerodrom` DISABLE KEYS */;
INSERT INTO `aerodrom` VALUES (1,'Sarajevo International Airport','Sarajevo','Bosna i Hercegovina'),(2,'Los Angeles International Airport','Los Angeles','USA'),(3,' Dubai International Airport','Dubai','UAE'),(4,'London Heathrow Airport','London','United Kingdom'),(5,'Frankfurt Airport','Frankfurt','Germany'),(6,'Istanbul Airport','Istanbul','Turkey'),(7,' John F. Kennedy International Airport','New York','USA'),(8,'Amsterdam Airport Schiphol','Amsterdam','Netherlands'),(9,'Tokyo Haneda Airport','Tokyo','Japan'),(10,'Seoul Incheon International Airport','Seoul','South Korea'),(11,' Indira Gandhi International Airport','Delhi','India'),(12,' Madrid Barajas Airport','Madrid','Spain'),(13,'Charles de Gaulle Airport','Paris','France');
/*!40000 ALTER TABLE `aerodrom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aviokompanija`
--

DROP TABLE IF EXISTS `aviokompanija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aviokompanija` (
  `aviokompanija_ID` int NOT NULL AUTO_INCREMENT,
  `ime_aviokompanije` varchar(255) NOT NULL,
  PRIMARY KEY (`aviokompanija_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aviokompanija`
--

LOCK TABLES `aviokompanija` WRITE;
/*!40000 ALTER TABLE `aviokompanija` DISABLE KEYS */;
INSERT INTO `aviokompanija` VALUES (1,'Delta Air Lines'),(2,'America Airlines Group'),(3,'Lufthansa group'),(4,'Air France'),(5,'China Southern Airlines'),(6,'China Eastern Airlines'),(7,'Emirates'),(8,'British Airways');
/*!40000 ALTER TABLE `aviokompanija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avion`
--

DROP TABLE IF EXISTS `avion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avion` (
  `avion_ID` int NOT NULL AUTO_INCREMENT,
  `model` varchar(255) DEFAULT NULL,
  `kapacitet` int DEFAULT NULL,
  PRIMARY KEY (`avion_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avion`
--

LOCK TABLES `avion` WRITE;
/*!40000 ALTER TABLE `avion` DISABLE KEYS */;
INSERT INTO `avion` VALUES (1,'Airbus A220',120),(2,'Airbus A320',124),(3,'Airbus A350',300),(4,'Airbus A380',500),(5,'Boeing 747-8',400),(6,'Boeing 767-300F',300),(7,'Boeing 787',242);
/*!40000 ALTER TABLE `avion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `let`
--

DROP TABLE IF EXISTS `let`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `let` (
  `aviokompanija_ID` int DEFAULT NULL,
  `avion_ID` int DEFAULT NULL,
  `aerodrom_ID` int DEFAULT NULL,
  `let_ID` int NOT NULL AUTO_INCREMENT,
  `ime_leta` varchar(255) DEFAULT NULL,
  `datum_vrijeme_polijetanja` datetime DEFAULT NULL,
  `broj_putnika` int DEFAULT NULL,
  PRIMARY KEY (`let_ID`),
  KEY `aviokompanija_ID` (`aviokompanija_ID`),
  KEY `avion_ID` (`avion_ID`),
  KEY `aerodrom_ID` (`aerodrom_ID`),
  CONSTRAINT `let_ibfk_1` FOREIGN KEY (`aviokompanija_ID`) REFERENCES `aviokompanija` (`aviokompanija_ID`),
  CONSTRAINT `let_ibfk_2` FOREIGN KEY (`avion_ID`) REFERENCES `avion` (`avion_ID`),
  CONSTRAINT `let_ibfk_3` FOREIGN KEY (`aerodrom_ID`) REFERENCES `aerodrom` (`aerodrom_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `let`
--

LOCK TABLES `let` WRITE;
/*!40000 ALTER TABLE `let` DISABLE KEYS */;
INSERT INTO `let` VALUES (5,3,1,8,'Sarajevo-Frankfurt','2020-06-11 15:20:00',104),(7,2,1,9,'Sarajevo-Dubai','2020-03-12 00:20:00',112),(5,6,1,10,'Sarajevo-Paris','2020-08-13 12:30:00',98),(8,7,1,11,'Sarajevo-London','2020-09-20 20:00:00',115),(3,2,1,12,'Sarajevo-Delhi','2020-11-28 22:15:00',103),(4,5,1,13,'Sarajevo-Tokyo','2020-03-16 13:00:00',107),(3,7,1,14,'Sarajevo-Amsterdam','2020-02-10 15:25:00',110),(1,3,1,15,'Sarajevo-Istanbul','2020-04-12 05:00:00',92),(2,5,1,16,'Sarajevo-Los Angeles','2020-06-20 00:10:00',100),(4,2,1,17,'Sarajevo-Seoul','2020-10-15 04:40:00',90),(3,7,1,18,'Sarajevo-Madrid','2020-10-12 12:45:00',120),(5,5,1,19,'Sarajevo-Frankfurt','2020-10-03 11:00:00',100),(3,6,1,20,'Sarajevo-Tokyo','2020-03-06 23:10:00',114),(6,4,1,21,'Sarajevo-Delhi','2020-06-14 03:20:00',116),(2,3,1,22,'Sarajevo-London','2020-06-14 04:15:00',104),(3,5,1,23,'Sarajevo-Madrid','2020-06-10 12:15:00',94),(4,2,1,24,'Sarajevo-Los Angeles','2020-03-14 12:00:00',100),(6,3,1,25,'Sarajevo-Dubai','2020-11-10 13:00:00',105),(2,1,1,26,'Sarajevo-London','2020-02-10 11:25:00',107),(3,5,1,27,'Sarajevo-Frankfurt','2020-07-13 18:20:00',99),(1,4,1,28,'Sarajevo-Istanbul','2020-08-20 20:15:00',100),(7,7,1,29,'Sarajevo-New York','2020-05-10 20:30:00',114),(3,2,1,30,'Sarajevo-Amsterdam','2020-01-15 23:25:00',111),(5,3,1,31,'Sarajevo-Tokyo','2020-03-13 15:10:00',112),(6,2,1,32,'Sarajevo-Seoul','2020-03-13 13:20:00',110),(4,3,1,33,'Sarajevo-Delhi','2020-04-19 12:00:00',110),(2,5,1,34,'Sarajevo-Madrid','2020-05-21 16:00:00',110),(3,7,1,35,'Sarajevo-Paris','2020-03-15 08:45:00',110);
/*!40000 ALTER TABLE `let` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `let_info`
--

DROP TABLE IF EXISTS `let_info`;
/*!50001 DROP VIEW IF EXISTS `let_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `let_info` AS SELECT 
 1 AS `ime_leta`,
 1 AS `datum_vrijeme_polijetanja`,
 1 AS `datum_vrijeme_slijetanja`,
 1 AS `ime_aerodroma`,
 1 AS `grad`,
 1 AS `drzava`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `let_putnika`
--

DROP TABLE IF EXISTS `let_putnika`;
/*!50001 DROP VIEW IF EXISTS `let_putnika`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `let_putnika` AS SELECT 
 1 AS `ime`,
 1 AS `prezime`,
 1 AS `pasos`,
 1 AS `jmbg`,
 1 AS `ime_leta`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `odrediste`
--

DROP TABLE IF EXISTS `odrediste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odrediste` (
  `datum_vrijeme_slijetanja` datetime DEFAULT NULL,
  `mjesto_slijetanja` int DEFAULT NULL,
  `let_ID` int DEFAULT NULL,
  KEY `let_ID` (`let_ID`),
  KEY `mjesto_slijetanja` (`mjesto_slijetanja`),
  CONSTRAINT `odrediste_ibfk_1` FOREIGN KEY (`let_ID`) REFERENCES `let` (`let_ID`),
  CONSTRAINT `odrediste_ibfk_2` FOREIGN KEY (`mjesto_slijetanja`) REFERENCES `aerodrom` (`aerodrom_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odrediste`
--

LOCK TABLES `odrediste` WRITE;
/*!40000 ALTER TABLE `odrediste` DISABLE KEYS */;
INSERT INTO `odrediste` VALUES ('2020-06-11 20:20:00',5,8),('2020-03-12 05:20:00',3,9),('2020-08-13 17:20:00',13,10),('2020-11-29 03:00:00',11,12),('2020-03-16 18:00:00',9,13),('2020-02-10 18:20:00',8,14),('2020-04-12 10:20:00',6,15),('2020-06-20 05:10:00',2,16),('2020-10-15 08:10:00',10,17),('2020-10-12 15:10:00',12,18),('2020-10-03 15:10:00',5,19),('2020-03-07 04:10:00',9,20),('2020-06-14 05:20:00',11,21),('2020-06-14 04:15:00',4,22),('2020-06-10 15:15:00',12,23),('2020-03-14 20:15:00',2,24),('2020-11-10 18:00:00',3,25),('2020-02-10 13:25:00',4,26),('2020-07-13 22:21:00',5,27),('2020-08-20 23:21:00',6,28),('2020-06-10 03:23:00',7,29),('2020-02-15 05:16:00',8,30),('2020-03-13 20:14:00',9,31),('2020-03-13 17:21:00',10,32),('2020-04-19 22:14:00',11,33),('2020-05-21 20:00:00',12,34),('2020-03-15 12:34:00',13,35);
/*!40000 ALTER TABLE `odrediste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osoblje`
--

DROP TABLE IF EXISTS `osoblje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `osoblje` (
  `osoba_ID` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `JMBG` int NOT NULL,
  `opis_posla` varchar(255) DEFAULT NULL,
  `plata` int DEFAULT NULL,
  `aerodrom_ID` int DEFAULT NULL,
  PRIMARY KEY (`osoba_ID`),
  KEY `aerodrom_ID` (`aerodrom_ID`),
  CONSTRAINT `osoblje_ibfk_1` FOREIGN KEY (`aerodrom_ID`) REFERENCES `aerodrom` (`aerodrom_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osoblje`
--

LOCK TABLES `osoblje` WRITE;
/*!40000 ALTER TABLE `osoblje` DISABLE KEYS */;
INSERT INTO `osoblje` VALUES (1,'Mehmed','Cosic',26267,'Kontrolor letova',2000,1),(2,'Haris','Ovcina',26217,'Aviomehanicar',1500,1),(3,'Adnan','Bobic',27287,'Aviomehanicar',1500,1),(4,'Nermin','Alagic',37384,'Aviomehanicar',1500,1),(5,'Dino','Hasanovic',26211,'Direktor',3000,1),(6,'Berin','Catic',10120,'Vazduhoplovni inzenjer',2300,1),(7,'Samir','Radovac',25626,'Vazduhoplovni inzenjer',2300,1),(8,'Faruk','Bihorac',23588,'Vazduhoplovni inzenjer',2300,1),(9,'Kemal','Hafizovic',26271,'Aviomehanicar',1500,1),(10,'Husnija','Arapovic',25276,'Pilot',2700,1),(11,'Anel','Karabeg',26777,'Pilot',2700,1),(12,'Demir','Hotic',12121,'Pilot',2700,1),(13,'Enes','Spahic',97841,'Pilot',2700,1),(14,'Ibro','Rahimic',21569,'Kontrolor letova',2000,1),(15,'Adis','Obad',77521,'Kontrolor letova',2000,1),(16,'Irma','Osmanovic',32621,'Kopilot',2500,1),(17,'Adi','Ramovic',98459,'Kopilot',2500,1),(18,'Tarik','Mekic',26211,'Kabinsko osoblje',1300,1),(19,'Halid','Hodzic',45477,'Kabinsko osoblje',1300,1),(20,'Halid','Hodzic',26217,'Aviomehanicar',1500,1),(21,'Ahmed','Pekic',27481,'Aviomehanicar',1500,1),(22,'Adnan','Alic',73111,'Vazduhoplovni inzenjer',2300,1),(23,'Alen','Hadzic',47943,'Kontrolor letova',2000,1),(24,'Amina','Mekic',62211,'Kabinsko osoblje',1300,1),(25,'Ibrahim','Osmanovic',36366,'Pilot',2700,1),(26,'Alen','Hotic',21499,'Kopilot',2500,1),(29,'Irma','Hodzic',42421,'Pilot',2700,1);
/*!40000 ALTER TABLE `osoblje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `putnik`
--

DROP TABLE IF EXISTS `putnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `putnik` (
  `putnik_ID` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `JMBG` int NOT NULL,
  `Pasos` varchar(255) DEFAULT NULL,
  `let_ID` int DEFAULT NULL,
  PRIMARY KEY (`putnik_ID`),
  KEY `let_ID` (`let_ID`),
  CONSTRAINT `putnik_ibfk_1` FOREIGN KEY (`let_ID`) REFERENCES `let` (`let_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `putnik`
--

LOCK TABLES `putnik` WRITE;
/*!40000 ALTER TABLE `putnik` DISABLE KEYS */;
INSERT INTO `putnik` VALUES (1,'Haris','Hajdarevic',15231,'Bosna i Hercegovina',8),(2,'Filip','Eric',13561,'Srbija',9),(3,'Sinisa','Stevanovic',23452,'Srbija',10),(4,'Luka','Miletic',35211,'Bosna i Hercegovina',11),(5,'Sedad','Subasic',23522,'Bosna i Hercegovina',12),(6,'Mustafa','Mujezinovic',23521,'Bosna i Hercegovina',13),(7,'Luka','Juricic',58584,'Bosna i Hercegovina',14),(8,'Ermin','Zec',13414,'Bosna i Hercegovina',15),(9,'Asim','Zec',34643,'Bosna i Hercegovina',16),(10,'Irfan','Fejzic',23562,'Bosna i Hercegovina',17),(11,'Vedad','Muftic',23432,'Bosna i Hercegovina',18),(12,'Semir','Stilic',23411,'Bosna i Hercegovina',19),(13,'Vedran','Vrhovac',23456,'Bosna i Hercegovina',20),(14,'Mehmed','Alispahic',23436,'Bosna i Hercegovina',21),(15,'Ivan','Milicevic',23521,'Bosna i Hercegovina',22),(16,'Mladen','Veselinovic',89564,'Bosna i Hercegovina',23),(17,'Ante','Blazevic',13151,'Hrvatska',24),(18,'Petar','Bojo',11411,'Bosna i Hercegovina',25),(19,'Ivan','Lendric',25425,'Hrvatska',26),(20,'Frane','Ikic',26211,'Hrvatska',27),(21,'Eldar','Sehic',23628,'Bosna i Hercegovina',28),(22,'Muhamed','Sahinovic',62111,'Bosna i Hercegovina',29),(23,'Dusan','Hodzic',25715,'Bosna i Hercegovina',30),(24,'Selmir','Pidro',73423,'Bosna i Hercegovina',31),(25,'Halid','Sabanovic',63211,'Bosna i Hercegovina',32),(26,'Hamza','Besic',37361,'Bosna i Hercegovina',33),(27,'Mirko','Oremus',26241,'Hrvatska',34),(28,'Anel','Hebibovic',25211,'Bosna i Hercegovina',35),(29,'Amar','Rahmanovic',45165,'Bosna i Hercegovina',34),(30,'Tarik','Ramic',25671,'Bosna i Hercegovina',35),(31,'Dino','Islamovic',37621,'Bosna i Hercegovina',33),(32,'Faruk','Hodzic',76211,'Bosna i Hercegovina',32),(33,'Ivan','Jukic',15612,'Bosna i Hercegovina',31),(34,'Haris','Handzic',76212,'Bosna i Hercegovina',30),(35,'Amer','Dupovac',23765,'Bosna i Hercegovina',29),(36,'Benjamin','Tatar',26278,'Bosna i Hercegovina',28),(37,'Adnan','Salihovic',26521,'Bosna i Hercegovina',27),(38,'Edis','Smajic',78344,'Bosna i Hercegovina',26),(39,'Perica','Ivetic',62122,'Bosna i Hercegovina',25),(40,'Amar','Beganovic',26216,'Bosna i Hercegovina',24),(41,'Armin','Hodzic',37213,'Bosna i Hercegovina',23),(42,'Sabit','Alispahic',26362,'Bosna i Hercegovina',22),(43,'Nikola','Lakic',26219,'Bosna i Hercegovina',21),(44,'Irfan','Fejzic',83533,'Bosna i Hercegovina',20),(45,'Edin','Salkic',27222,'Bosna i Hercegovina',19),(46,'Adnan','Mujkic',39611,'Bosna i Hercegovina',18),(47,'Almir','Bekic',23623,'Bosna i Hercegovina',17),(48,'Josip','Santic',62888,'Bosna i Hercegovina',16),(49,'Dino','Hodzic',26271,'Bosna i Hercegovina',15),(50,'Samir','Bekric',23721,'Bosna i Hercegovina',14),(51,'Adnan','Osmanovic',23732,'Bosna i Hercegovina',13),(52,'Amer','Bekic',92956,'Bosna i Hercegovina',12),(53,'Abid','Mujagic',32723,'Bosna i Hercegovina',11),(54,'Faris','Alicic',76221,'Bosna i Hercegovina',10),(55,'Denis','Zvonic',27621,'Bosna i Hercegovina',9),(56,'Samir','Zeljkovic',26215,'Bosna i Hercegovina',8);
/*!40000 ALTER TABLE `putnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `let_info`
--

/*!50001 DROP VIEW IF EXISTS `let_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `let_info` AS select `l`.`ime_leta` AS `ime_leta`,`l`.`datum_vrijeme_polijetanja` AS `datum_vrijeme_polijetanja`,`o`.`datum_vrijeme_slijetanja` AS `datum_vrijeme_slijetanja`,`a`.`ime_aerodroma` AS `ime_aerodroma`,`a`.`grad` AS `grad`,`a`.`drzava` AS `drzava` from ((`aerodrom` `a` join `odrediste` `o` on((`a`.`aerodrom_ID` = `o`.`mjesto_slijetanja`))) join `let` `l` on((`o`.`let_ID` = `l`.`let_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `let_putnika`
--

/*!50001 DROP VIEW IF EXISTS `let_putnika`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `let_putnika` AS select `p`.`ime` AS `ime`,`p`.`prezime` AS `prezime`,`p`.`Pasos` AS `pasos`,`p`.`JMBG` AS `jmbg`,`l`.`ime_leta` AS `ime_leta` from (`putnik` `p` join `let` `l` on((`p`.`let_ID` = `l`.`let_ID`))) order by `p`.`Pasos` */;
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

-- Dump completed on 2020-12-22 22:57:50

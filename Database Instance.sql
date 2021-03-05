-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: final_dbproject
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bed` (
  `bed_id` int NOT NULL AUTO_INCREMENT,
  `bed_charge` varchar(45) DEFAULT NULL,
  `bed_isOccupied` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  PRIMARY KEY (`bed_id`),
  KEY `bed_room_id_idx` (`room_id`),
  KEY `bed_patinet_id_idx` (`patient_id`),
  CONSTRAINT `bed_patinet_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `bed_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed`
--

LOCK TABLES `bed` WRITE;
/*!40000 ALTER TABLE `bed` DISABLE KEYS */;
INSERT INTO `bed` VALUES (1,'20',1,1,1),(2,'20',1,1,2),(3,'20',1,2,3),(4,'20',0,2,NULL),(5,'20',1,3,4),(6,'20',1,3,5),(7,'20',0,4,NULL),(8,'20',1,4,6),(9,'20',1,5,7),(10,'20',1,5,8),(11,'20',0,6,NULL),(12,'20',1,6,9),(13,'20',1,7,10),(14,'20',1,7,11),(15,'20',1,8,12),(16,'20',1,8,13),(17,'20',1,9,14),(18,'20',1,9,15),(19,'20',1,10,16),(20,'20',1,10,17),(21,'20',0,11,NULL),(22,'20',1,11,18),(23,'20',1,12,19),(24,'20',1,12,20),(25,'20',1,13,21),(26,'20',1,13,22),(27,'20',1,14,23),(28,'20',1,14,24),(29,'20',1,15,25),(30,'20',1,15,26),(31,'40',0,16,NULL),(32,'40',1,17,27),(33,'40',1,18,28),(34,'40',1,19,29),(35,'40',1,20,30);
/*!40000 ALTER TABLE `bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `billing_id` int NOT NULL AUTO_INCREMENT,
  `bill_date` datetime DEFAULT NULL,
  `bill_amount` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  PRIMARY KEY (`billing_id`),
  KEY `bill_patient_id_idx` (`patient_id`),
  CONSTRAINT `bill_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (1,'2020-11-12 00:00:00',400,1),(2,'2020-11-12 00:00:00',512,2),(3,'2020-11-13 00:00:00',598,3),(4,'2020-11-12 00:00:00',452,4),(5,'2020-11-13 00:00:00',454,5),(6,'2020-11-14 00:00:00',10000,6),(7,'2020-11-14 00:00:00',845,7),(8,'2020-11-14 00:00:00',846,8),(9,'2020-11-14 00:00:00',989,9),(10,'2020-11-15 00:00:00',65,10),(11,'2020-11-15 00:00:00',6565,11),(12,'2020-11-13 00:00:00',1478,12),(13,'2020-11-15 00:00:00',152,13),(14,'2020-11-13 00:00:00',999,14),(15,'2020-11-15 00:00:00',5268,15),(16,'2020-11-15 00:00:00',5151,16),(17,'2020-11-15 00:00:00',515,17),(18,'2020-11-14 00:00:00',157,18),(19,'2020-11-12 00:00:00',848,19),(20,'2020-11-15 00:00:00',155,20),(21,'2020-11-14 00:00:00',1210,21),(22,'2020-11-13 00:00:00',1048,21),(23,'2020-11-12 00:00:00',5006,22),(24,'2020-11-15 00:00:00',5454,23),(25,'2020-11-14 00:00:00',212,24),(26,'2020-11-13 00:00:00',2887,25),(27,'2020-11-12 00:00:00',87841,26),(28,'2020-11-14 00:00:00',5654,27),(29,'2020-11-15 00:00:00',5458,28),(30,'2020-11-12 00:00:00',8489,29),(31,'2020-11-13 00:00:00',45848,30);
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctor_id` int NOT NULL AUTO_INCREMENT,
  `doctor_name` varchar(45) DEFAULT NULL,
  `doctor_specialty` varchar(45) DEFAULT NULL,
  `doctor_phone` varchar(45) DEFAULT NULL,
  `doctor_email` varchar(45) DEFAULT NULL,
  `doctor_address` varchar(45) DEFAULT NULL,
  `hospital_id` int DEFAULT NULL,
  PRIMARY KEY (`doctor_id`),
  KEY `hospital_id_idx` (`hospital_id`),
  CONSTRAINT `doctor_hospital_id` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Sha Ison','Pediatric','6785151892','Sha Ison@yahoo.com','3 Pennsylvania St.',1),(2,'Latoya Blomberg','Surgeon','6785145904','Latoya Blomberg@yahoo.com','24 Valley Farms St.',2),(3,'Wilmer Legette','Neuro','6785151893','Wilmer Legette@yahoo.com','Mocksville, NC 27028',3),(4,'Delicia Allgeier','Gyno','6785145905','Delicia Allgeier@yahoo.com','183 Roosevelt Street',4),(5,'Joi Fentress','Neuro','6785151894','Joi Fentress@yahoo.com','8360 El Dorado St.',5),(6,'Julius Rapp','Pediatric','6785145899','Julius Rapp@yahoo.com','44 Devonshire St.',5),(7,'Judson Specht','Gyno','6785151888','Judson Specht@yahoo.com','56 Wentworth Ave.',4),(8,'Bobbye Dantzler','general Practitioner','6785145907','Bobbye Dantzler@yahoo.com','27 Brook St.',3),(9,'Yung Hamby','Neuro','6785151896','Yung Hamby@yahoo.com','Manitowoc, WI 54220',2),(10,'Reid Earnhardt','general Practitioner','6785145908','Reid Earnhardt@yahoo.com','Dekalb, IL 60115',1),(11,'Oliva Bower','Pediatric','6785151897','Oliva Bower@yahoo.com','Muskegon, MI 49441',1),(12,'Eleonora Stiver','Gyno','6785145909','Eleonora Stiver@yahoo.com','Whitestone, NY 11357',3),(13,'Margurite Reidy','Surgeon','6785151898','Margurite Reidy@yahoo.com','5 South Elm Drive',4),(14,'Michiko Currie','Neuro','6785145910','Michiko Currie@yahoo.com','Saint Albans, NY 11412',2),(15,'Gail Defoor','Surgeon','6785151899','Gail Defoor@yahoo.com','Doylestown, PA 18901',5);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital` (
  `hospital_id` int NOT NULL AUTO_INCREMENT,
  `hospital_name` varchar(45) DEFAULT NULL,
  `hospital_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`hospital_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (1,'Children\'s Hospital','5500 RiverEdge One, Atlanta, GA, 30345'),(2,'Memorial Hospital','3425 Memorial Dr, Decatur, GA, 30345'),(3,'TrustFund Rockwell Hospital','123 Vue Ave NE, Fargo, North Dakota, 58956'),(4,'Mt. Zion Charitable Hospitable','3456 Southcliff Ave, Augusta, GA, 54865'),(5,'St. Alban\'s Trust Hospitable','St. Alban\'s Rd, Dacula, GA, 54545');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id` int NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_store`
--

DROP TABLE IF EXISTS `medical_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_store` (
  `medical_store_id` int NOT NULL AUTO_INCREMENT,
  `medical_store_name` varchar(45) DEFAULT NULL,
  `medical_store_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`medical_store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_store`
--

LOCK TABLES `medical_store` WRITE;
/*!40000 ALTER TABLE `medical_store` DISABLE KEYS */;
INSERT INTO `medical_store` VALUES (1,'Hanuman Medicos','5895 North Druid Hills, Atlanta, GA, 30345'),(2,'CVS Pharmacy','5849 Lavista Rd, Decatur, 39304'),(3,'General Mills Store','8787 Dacula Rd NW, Dacula, GA, 30345'),(4,'Apollo Pharmacy','45 Main St, Cairo, GA, 41548'),(5,'Super Saver Medicos','9887 Pond Edge Rd, Lilburn, GA, 303548');
/*!40000 ALTER TABLE `medical_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_store_has_medicine`
--

DROP TABLE IF EXISTS `medical_store_has_medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_store_has_medicine` (
  `medical_store_id` int NOT NULL,
  `medicine_id` int NOT NULL,
  PRIMARY KEY (`medical_store_id`,`medicine_id`),
  KEY `has_medicine_idx` (`medicine_id`),
  CONSTRAINT `has_medicine` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`medicine_id`),
  CONSTRAINT `has_store` FOREIGN KEY (`medical_store_id`) REFERENCES `medical_store` (`medical_store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_store_has_medicine`
--

LOCK TABLES `medical_store_has_medicine` WRITE;
/*!40000 ALTER TABLE `medical_store_has_medicine` DISABLE KEYS */;
INSERT INTO `medical_store_has_medicine` VALUES (1,1),(2,1),(4,1),(1,2),(3,2),(4,2),(2,3),(3,3),(4,3),(3,4),(4,4),(3,5),(5,5);
/*!40000 ALTER TABLE `medical_store_has_medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_test`
--

DROP TABLE IF EXISTS `medical_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_test` (
  `medical_test_id` int NOT NULL AUTO_INCREMENT,
  `medical_test_name` varchar(45) DEFAULT NULL,
  `medical_test_cost` int DEFAULT NULL,
  PRIMARY KEY (`medical_test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_test`
--

LOCK TABLES `medical_test` WRITE;
/*!40000 ALTER TABLE `medical_test` DISABLE KEYS */;
INSERT INTO `medical_test` VALUES (1,'X-RAY',1000),(2,'MRI',1000),(3,'Bloodwork',599),(4,'General Checkup',259),(5,'COVID-19 Test',300);
/*!40000 ALTER TABLE `medical_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_test_data`
--

DROP TABLE IF EXISTS `medical_test_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_test_data` (
  `medical_test_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  PRIMARY KEY (`medical_test_id`,`patient_id`,`doctor_id`),
  KEY `test_doctor_id_idx` (`doctor_id`),
  KEY `test_patient_id_idx` (`patient_id`),
  CONSTRAINT `test_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`),
  CONSTRAINT `test_id` FOREIGN KEY (`medical_test_id`) REFERENCES `medical_test` (`medical_test_id`),
  CONSTRAINT `test_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_test_data`
--

LOCK TABLES `medical_test_data` WRITE;
/*!40000 ALTER TABLE `medical_test_data` DISABLE KEYS */;
INSERT INTO `medical_test_data` VALUES (2,1,1),(2,29,1),(3,25,1),(4,5,1),(5,14,1),(1,2,2),(1,6,2),(2,15,2),(4,26,2),(1,19,3),(1,28,3),(2,7,3),(5,3,3),(2,28,4),(3,4,4),(3,8,4),(3,20,4),(5,30,4),(2,4,5),(4,11,5),(4,24,5),(5,25,5);
/*!40000 ALTER TABLE `medical_test_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `medicine_id` int NOT NULL AUTO_INCREMENT,
  `medicine_name` varchar(45) DEFAULT NULL,
  `medicine_price` int DEFAULT NULL,
  PRIMARY KEY (`medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'Tylenol',2),(2,'Polio Vaccine',200),(3,'Collagen 200mg',50),(4,'Insulin',599),(5,'Vitamin-K Capsule',100);
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine_data`
--

DROP TABLE IF EXISTS `medicine_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine_data` (
  `medicine_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `patient_id` int NOT NULL,
  PRIMARY KEY (`medicine_id`,`doctor_id`,`patient_id`),
  KEY `medicine_data_patient_id_idx` (`patient_id`),
  KEY `medicine_data_doctor_id_idx` (`doctor_id`),
  CONSTRAINT `medicine_data_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`),
  CONSTRAINT `medicine_data_id` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`medicine_id`),
  CONSTRAINT `medicine_data_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine_data`
--

LOCK TABLES `medicine_data` WRITE;
/*!40000 ALTER TABLE `medicine_data` DISABLE KEYS */;
INSERT INTO `medicine_data` VALUES (1,1,1),(2,1,1),(3,1,1),(5,2,2),(2,3,3),(3,3,3),(5,3,3),(4,3,4),(1,3,6),(2,4,7),(3,4,7),(5,4,7),(2,5,8),(4,5,8),(2,5,9),(3,5,9),(4,5,9),(2,3,10),(3,3,10),(1,1,11),(2,2,14),(3,3,14),(1,1,15),(5,2,17),(4,2,18),(4,1,19),(1,4,20),(2,3,20),(2,5,21),(3,1,21),(2,2,22),(1,3,23),(1,5,23),(2,4,23),(3,1,24),(4,5,25),(5,4,26),(4,2,28),(5,3,28),(1,1,29),(1,1,30),(3,4,30);
/*!40000 ALTER TABLE `medicine_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse` (
  `nurse_id` int NOT NULL AUTO_INCREMENT,
  `nurse_name` varchar(45) DEFAULT NULL,
  `nurse_phone` varchar(45) DEFAULT NULL,
  `hospital_id` int DEFAULT NULL,
  PRIMARY KEY (`nurse_id`),
  KEY `nurse_hospital_ID_idx` (`hospital_id`),
  CONSTRAINT `nurse_hospital_ID` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES (1,'Amit Wang','818-534-0633',1),(2,'Aleisha Churchill','773-812-8381',2),(3,'Nicky Wynn','530-478-2738',3),(4,'Roma Cresswell','712-436-7384',4),(5,'Ruby Costa','302-285-5135',5),(6,'Elliott Maguire','205-632-4737',1),(7,'Angelika Burks','214-662-2479',2),(8,'Daniel Sanford','832-549-5884',3),(9,'Jaiden Clark','214-657-8790',4),(10,'Amy-Louise Puckett','707-669-6493',5),(11,'Areeb Olson','505-730-5021',1),(12,'Leja Harrington','610-293-1219',2),(13,'Louis Boyle','415-364-2380',3),(14,'Aden Major','317-415-5225',4),(15,'Jett Mansell','954-357-5197',5);
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(45) DEFAULT NULL,
  `patient_phone` varchar(45) DEFAULT NULL,
  `patient_address` varchar(45) DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `patient_doctor_id_idx` (`doctor_id`),
  CONSTRAINT `patient_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Henry Sharp','567-369-0082','760 SANDTOWN RD SW',8),(2,'Campbell Howe','781-298-9734','4105 BUENA VISTA ROAD',8),(3,'Amisha Mejia','234-227-0508','2187 SALEM RD NE',9),(4,'Eva Nairn','218-583-9489','41 HWY. 243',15),(5,'Christina Velazquez','620-240-7733','4407 HABERSHAM ST',14),(6,'Cassidy Buchanan','760-205-5338','385 HARRIS TRAIL ROAD',13),(7,'Juniper Talley','470-809-5004','7726 JOHNNY MERCER BLVD',2),(8,'Alys Walls','408-256-4286','1223 E MONTGOMERY X ROAD',1),(9,'Callen Chen','337-441-4994','1153A BURNT HICKORY RD',4),(10,'Rory Henderson','907-734-2613','6317 OLD HWY 5',5),(11,'Keanu Hoover','760-889-2572','145 N DUGGER AVE',6),(12,'Caris Walton','501-914-2951','113 SCRUBBY BLUFF ROAD',4),(13,'Jaidon Hackett','618-932-1759','3125 LAWRENCEVILLE HWY',8),(14,'Iram Mcmillan','972-868-6233','3205 CANTON RD STE 105',5),(15,'Siddharth Wyatt','812-238-3398','1060 SOUTH MAIN STREET',14),(16,'Rosemarie Contreras','510-244-5696','143 CRAIGTOWN RD',10),(17,'Anabella Sharpe','484-226-6024','11711 LARGO DR',8),(18,'Alena Burn','501-558-3709','1101 EAST MONTGOMERY CROSS ROAD',7),(19,'Yvette Bishop','765-962-9430','3436 E PONCE DE LEON AVE',6),(20,'Chaya Conrad','337-353-4966','3001 ALTAMA AVENUE',4),(21,'Aiyla Manning','714-772-8684','3701 BULL STREET',9),(22,'Ines Crosby','201-862-7549','2008 MILLS B LANE BLVD',9),(23,'Katherine Wolfe','417-621-3664','789 SOUTH MAIN ST',9),(24,'Karam Blaese','860-840-0259','702 HWY 80',9),(25,'Derren Huang','803-652-1034','1380 WHITE CIRCLE NW',2),(26,'Shantelle Xiong','217-382-4969','5080 NORTH LAKE DR',3),(27,'Layla-Rose Scott','516-387-7309','2626 SKYVIEW DR',3),(28,'Zainab Lennon','904-673-9386','521 HARDEE ST',1),(29,'Elysia Huynh','773-328-4360','3155 PLEASANTDALE RD',1),(30,'Sienna Bell','757-599-0314','2801 MONTGOMERY ST',14);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL,
  `role_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'IT Admin','IT Admin Manager'),(2,'DataBase Manager','Manages everything database.'),(3,'Intern','Intern'),(4,'Night Audit Manager','Manages audit during night shift'),(5,'Regional Manager','Regional everthinbg manager ');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `room_name` varchar(45) DEFAULT NULL,
  `room_type` varchar(45) DEFAULT NULL,
  `ward_id` int DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `room_ward_id_idx` (`ward_id`),
  CONSTRAINT `room_ward_id` FOREIGN KEY (`ward_id`) REFERENCES `ward` (`ward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'room1','double',1),(2,'room2','double',2),(3,'room3','double',3),(4,'room4','double',4),(5,'room5','double',5),(6,'room6','double',6),(7,'room7','double',7),(8,'room8','double',8),(9,'room9','double',9),(10,'room10','double',10),(11,'room11','double',1),(12,'room12','double',2),(13,'room13','double',3),(14,'room14','double',4),(15,'room15','double',5),(16,'room16','single',6),(17,'room17','single',7),(18,'room18','single',8),(19,'room19','single',9),(20,'room20','single',10);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `user_phone` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `user_address` varchar(45) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_ID_idx` (`role_id`),
  CONSTRAINT `role_ID` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Georgia Mcferren','6785145896','Georgia Mcferren@gmail.com','866 S. Clay Street, East Brunswick, NJ 08816',1),(2,'Aileen Brouwer','6785151885','Aileen Brouwer@gmail.com','28 East Valley Farms Ave',2),(3,'Gary Mustafa','6785145897','Gary Mustafa@gmail.com','75 Alderwood St.',3),(4,'Jessika Pankratz','6785151886','Jessika Pankratz@gmail.com','Depew, NY 14043',4),(5,'Karlyn Hambly','6785151886','Karlyn Hambly@gmail.com','810 Mayflower Dr.',5),(6,'Warner Roper','6785145898','Warner Roper@gmail.com','Mountain View, CA 94043',1),(7,'Cleora Casados','6785151887','Cleora Casados@gmail.com','44 Devonshire St.',2),(8,'Marcelene Rufener','6785145897','Marcelene Rufener@gmail.com','503 Pilgrim Street',3),(9,'Laurette Torrens','6785145899','Laurette Torrens@gmail.com','777 S. Corona St.',4),(10,'Oralia Funderburke','6785151886','Oralia Funderburke@gmail.com','590 N. Fairfield Ave.',5),(11,'Cheri Reeder','6785145897','Cheri Reeder@gmail.com','Chelmsford, MA 01824',1),(12,'Tenisha Pagaduan','6785145898','Tenisha Pagaduan@gmail.com','8745 Valley Farms Road',2),(13,'Andre Agosto','6785151888','Andre Agosto@gmail.com','Elk River, MN 55330',3),(14,'Chi Griner','6785145898','Chi Griner@gmail.com','23 West Colonial St.',4),(15,'Cheri Reeder','6785151886','Carry Rizzuto@gmail.com','9019 Kirkland St.',5);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_hospital_relation`
--

DROP TABLE IF EXISTS `user_hospital_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_hospital_relation` (
  `hospital_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`hospital_id`,`user_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `hospital_id` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_hospital_relation`
--

LOCK TABLES `user_hospital_relation` WRITE;
/*!40000 ALTER TABLE `user_hospital_relation` DISABLE KEYS */;
INSERT INTO `user_hospital_relation` VALUES (5,1),(5,2),(5,3),(4,4),(4,5),(4,6),(3,7),(3,8),(3,9),(2,10),(2,11),(2,12),(1,13),(1,14),(1,15);
/*!40000 ALTER TABLE `user_hospital_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward`
--

DROP TABLE IF EXISTS `ward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ward` (
  `ward_id` int NOT NULL AUTO_INCREMENT,
  `ward_name` varchar(45) DEFAULT NULL,
  `hospital_id` int DEFAULT NULL,
  PRIMARY KEY (`ward_id`),
  KEY `ward_hospital_id_idx` (`hospital_id`),
  CONSTRAINT `ward_hospital_id` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward`
--

LOCK TABLES `ward` WRITE;
/*!40000 ALTER TABLE `ward` DISABLE KEYS */;
INSERT INTO `ward` VALUES (1,'red',1),(2,'yellow',3),(3,'blue',1),(4,'purple',4),(5,'green',2),(6,'cyan',4),(7,'orange',2),(8,'teal',5),(9,'white',3),(10,'black',5);
/*!40000 ALTER TABLE `ward` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-29 12:49:24

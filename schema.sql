-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: chill_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Action'),(2,'Drama'),(3,'Comedy'),(4,'Horror'),(5,'Sci-Fi');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `id_movie` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image_url` text,
  `rating` varchar(255) DEFAULT NULL,
  `movie_date` date NOT NULL,
  `detail` text,
  `author` varchar(255) DEFAULT NULL,
  `caster` varchar(255) DEFAULT NULL,
  `watch_total` int DEFAULT NULL,
  `id_genre` int DEFAULT NULL,
  PRIMARY KEY (`id_movie`),
  KEY `fk_movie_genre` (`id_genre`),
  CONSTRAINT `fk_movie_genre` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Avengers: Endgame','https://example.com/endgame.jpg','9.0','2019-04-26','Superhero team fights Thanos.','Muhammad Dery Setiawan','Robert Downey Jr., Chris Evans',1500000,1),(2,'The Godfather','https://example.com/godfather.jpg','9.2','1972-03-24','Mafia family drama.','Paramount Pictures','Marlon Brando, Al Pacino',800000,2),(8,'Avengers: Endgame','https://example.com/endgame.jpg','9.0','2019-04-25','Superhero team fights Thanos.','Marvel Studios','Robert Downey Jr., Chris Evans',1000000,NULL);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_favorite`
--

DROP TABLE IF EXISTS `my_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_favorite` (
  `id_favorite` int NOT NULL AUTO_INCREMENT,
  `id_movie` int DEFAULT NULL,
  `id_series` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`id_favorite`),
  KEY `fk_fav_movie` (`id_movie`),
  KEY `fk_fav_series` (`id_series`),
  KEY `fk_order_user` (`id_user`),
  CONSTRAINT `fk_fav_movie` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`),
  CONSTRAINT `fk_fav_series` FOREIGN KEY (`id_series`) REFERENCES `series` (`id_series`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_favorite`
--

LOCK TABLES `my_favorite` WRITE;
/*!40000 ALTER TABLE `my_favorite` DISABLE KEYS */;
INSERT INTO `my_favorite` VALUES (1,1,NULL,2),(2,NULL,1,3),(3,2,2,2);
/*!40000 ALTER TABLE `my_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `id_packet` int NOT NULL,
  `id_payment` int NOT NULL,
  `id_user` int NOT NULL,
  `fee` int NOT NULL,
  `total` int NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `fk_order_packet` (`id_packet`),
  KEY `fk_order_payment` (`id_payment`),
  KEY `fk_fav_user` (`id_user`),
  CONSTRAINT `fk_fav_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `fk_order_packet` FOREIGN KEY (`id_packet`) REFERENCES `packet` (`id_packet`),
  CONSTRAINT `fk_order_payment` FOREIGN KEY (`id_payment`) REFERENCES `payment` (`id_payment`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,2,50000,50000),(2,2,2,3,100000,90000),(3,3,3,2,150000,150000);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packet`
--

DROP TABLE IF EXISTS `packet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packet` (
  `id_packet` int NOT NULL AUTO_INCREMENT,
  `packet_type` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id_packet`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packet`
--

LOCK TABLES `packet` WRITE;
/*!40000 ALTER TABLE `packet` DISABLE KEYS */;
INSERT INTO `packet` VALUES (1,'Basic','Basic streaming package'),(2,'Premium','Premium access with 4K support'),(3,'Family','Family sharing package up to 4 users');
/*!40000 ALTER TABLE `packet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id_payment` int NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(50) NOT NULL,
  `voucher` varchar(255) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`id_payment`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'Credit Card',NULL,'2024-03-01'),(2,'PayPal','DISCOUNT10','2024-03-10'),(3,'Bank Transfer',NULL,'2024-03-15');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `id_series` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image_url` text,
  `rating` varchar(255) DEFAULT NULL,
  `movie_date` date NOT NULL,
  `detail` text,
  `author` varchar(255) DEFAULT NULL,
  `caster` varchar(255) DEFAULT NULL,
  `watch_total` int DEFAULT NULL,
  `id_genre` int DEFAULT NULL,
  PRIMARY KEY (`id_series`),
  KEY `fk_series_genre` (`id_genre`),
  CONSTRAINT `fk_series_genre` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,'Stranger Things','https://example.com/strangerthings.jpg','8.8','2016-07-15','Supernatural events in Hawkins.','Netflix','Millie Bobby Brown, Finn Wolfhard',900000,5),(2,'Breaking Bad','https://example.com/breakingbad.jpg','9.5','2008-01-20','Chemistry teacher turns meth kingpin.','AMC','Bryan Cranston, Aaron Paul',950000,2);
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `user_role` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `verification_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'admin','admin123','2024-01-01 00:00:00',NULL,NULL,NULL),(2,2,'john_doe','password123','2024-02-15 00:00:00',NULL,NULL,NULL),(3,2,'jane_smith','pass456','2024-03-20 00:00:00',NULL,NULL,NULL),(4,1,'testing01','$2b$10$UaIucuUVuQLjJlR3WBJzuulRD5uTtOyj.nOlXnsj004Ny2l1n8B7q','2025-04-23 21:40:14','testing','testing@gmail.com',NULL),(5,1,'testingaja01','$2b$10$N8QNXicr0fXxm00JtTc/seebao4Y/ihdtz1bzQTUGOOHY4D3xUcf6','2025-04-23 21:42:44','testingaja','testingaja@gmail.com',NULL),(6,1,'dery01','$2b$10$Q5p/ozC6dMekukySgpHTKO8S3DNYkXV8xDzYCJy3XOwegyfQC4SLW','2025-04-27 13:32:09','dery','dery@gmail.com',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'chill_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-29 21:12:51

-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: ey_backend
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.22.04.1

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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2019_12_14_000001_create_personal_access_tokens_table',1),(2,'2024_12_07_201006_create_vouchers_table',1),(3,'2024_12_07_203709_create_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unique` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (1,'token_675886a2a37374.69627228',1,'2024-12-10 17:21:22','2024-12-10 18:04:02'),(2,'token_6758907722ed38.08122623',1,'2024-12-10 18:03:19','2024-12-10 18:07:11'),(3,'token_67589078ab07f7.56119381',0,'2024-12-10 18:03:20','2024-12-10 18:03:20'),(4,'token_6758907a1db017.15982509',0,'2024-12-10 18:03:22','2024-12-10 18:03:22'),(5,'token_6758907ba6fb03.14272794',0,'2024-12-10 18:03:23','2024-12-10 18:03:23');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vouchers`
--

DROP TABLE IF EXISTS `vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vouchers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `voucher_number` int NOT NULL,
  `voucher_provider` enum('foo','bar') COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_amount` decimal(3,1) NOT NULL,
  `expires_at` timestamp NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vouchers_voucher_number_unique` (`voucher_number`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
INSERT INTO `vouchers` VALUES (1,811980391,'foo',10.0,'2025-11-26 16:31:57',0,'2024-12-10 17:14:01','2024-12-10 17:14:01'),(2,361355638,'bar',10.0,'2025-03-25 21:16:44',0,'2024-12-10 17:14:01','2024-12-10 17:14:01'),(3,852182828,'foo',10.0,'2025-03-09 16:52:07',0,'2024-12-10 17:14:01','2024-12-10 17:14:01'),(4,537683134,'foo',10.0,'2025-06-06 03:02:20',0,'2024-12-10 17:14:01','2024-12-10 17:14:01'),(5,498545548,'foo',10.0,'2025-06-02 02:02:15',0,'2024-12-10 17:14:01','2024-12-10 17:14:01'),(6,278512728,'bar',20.0,'2025-01-17 19:43:03',0,'2024-12-10 17:14:02','2024-12-10 17:14:02'),(7,325576524,'foo',20.0,'2025-01-03 01:05:07',1,'2024-12-10 17:14:02','2024-12-10 18:04:02'),(8,605589756,'bar',20.0,'2025-10-05 12:05:57',0,'2024-12-10 17:14:02','2024-12-10 17:14:02'),(9,684275522,'foo',20.0,'2025-01-10 09:17:41',1,'2024-12-10 17:14:02','2024-12-10 18:06:14'),(10,568018843,'bar',20.0,'2025-05-29 23:10:30',0,'2024-12-10 17:14:02','2024-12-10 17:14:02'),(11,354904555,'bar',10.0,'2025-10-28 01:32:50',0,'2024-12-10 17:14:02','2024-12-10 17:14:02'),(12,748419764,'bar',10.0,'2025-01-05 04:38:36',0,'2024-12-10 17:14:02','2024-12-10 17:14:02'),(13,64723075,'foo',20.0,'2025-11-06 19:20:17',1,'2024-12-10 17:14:02','2024-12-10 18:07:11'),(14,257050336,'bar',20.0,'2024-12-10 17:15:32',0,'2024-12-10 17:14:02','2024-12-10 17:14:02'),(15,275817891,'bar',20.0,'2024-12-31 21:36:25',0,'2024-12-10 17:14:03','2024-12-10 17:14:03'),(16,566150592,'bar',20.0,'2025-04-10 14:27:29',0,'2024-12-10 17:14:03','2024-12-10 17:14:03'),(17,879370833,'bar',10.0,'2025-01-18 04:09:29',0,'2024-12-10 17:14:03','2024-12-10 17:14:03'),(18,930888746,'bar',20.0,'2025-05-04 05:38:06',0,'2024-12-10 17:14:03','2024-12-10 17:14:03'),(19,359325459,'foo',20.0,'2025-03-18 09:31:25',0,'2024-12-10 17:14:03','2024-12-10 17:14:03'),(20,734024433,'foo',20.0,'2025-08-22 05:28:02',0,'2024-12-10 17:14:03','2024-12-10 17:14:03'),(21,540449405,'foo',20.0,'2025-06-20 16:59:04',0,'2024-12-10 17:14:03','2024-12-10 17:14:03'),(22,481489021,'bar',20.0,'2025-09-24 20:34:47',0,'2024-12-10 17:14:03','2024-12-10 17:14:03'),(23,628677703,'bar',20.0,'2025-11-29 06:04:07',0,'2024-12-10 17:14:04','2024-12-10 17:14:04'),(24,413089321,'foo',20.0,'2025-04-06 21:54:37',0,'2024-12-10 17:14:04','2024-12-10 17:14:04'),(25,781942717,'bar',20.0,'2024-12-28 02:11:40',0,'2024-12-10 17:14:04','2024-12-10 17:14:04'),(26,634296493,'bar',20.0,'2025-02-15 14:09:56',0,'2024-12-10 17:14:04','2024-12-10 17:14:04'),(27,10317783,'foo',10.0,'2025-04-10 17:11:45',0,'2024-12-10 17:14:04','2024-12-10 17:14:04'),(28,990119861,'bar',10.0,'2025-02-24 23:49:22',0,'2024-12-10 17:14:04','2024-12-10 17:14:04'),(29,919395132,'bar',10.0,'2025-11-10 17:01:51',0,'2024-12-10 17:14:04','2024-12-10 17:14:04'),(30,983950160,'foo',20.0,'2024-12-20 23:34:55',0,'2024-12-10 17:14:04','2024-12-10 17:14:04'),(31,629336198,'bar',20.0,'2025-03-27 12:52:29',0,'2024-12-10 17:14:04','2024-12-10 17:14:04'),(32,101705173,'foo',10.0,'2025-01-10 16:56:41',0,'2024-12-10 17:14:04','2024-12-10 17:14:04'),(33,282673706,'bar',20.0,'2025-08-14 04:24:08',0,'2024-12-10 17:14:05','2024-12-10 17:14:05'),(34,609228453,'bar',10.0,'2025-10-06 06:14:33',0,'2024-12-10 17:14:05','2024-12-10 17:14:05'),(35,440385908,'foo',20.0,'2025-01-09 01:04:04',0,'2024-12-10 17:14:05','2024-12-10 17:14:05'),(36,757685376,'foo',10.0,'2024-12-16 19:07:57',0,'2024-12-10 17:14:05','2024-12-10 17:14:05'),(37,308313031,'bar',20.0,'2024-12-25 18:44:17',0,'2024-12-10 17:14:05','2024-12-10 17:14:05'),(38,86764874,'bar',20.0,'2025-03-12 17:28:06',0,'2024-12-10 17:14:05','2024-12-10 17:14:05'),(39,884250641,'foo',20.0,'2025-03-10 13:30:47',0,'2024-12-10 17:14:05','2024-12-10 17:14:05'),(40,576967365,'foo',10.0,'2025-03-13 17:43:52',0,'2024-12-10 17:14:05','2024-12-10 17:14:05'),(41,170818813,'bar',10.0,'2025-05-30 09:35:17',0,'2024-12-10 17:14:05','2024-12-10 17:14:05'),(42,824692222,'bar',20.0,'2025-04-23 17:14:15',0,'2024-12-10 17:14:06','2024-12-10 17:14:06'),(43,635013797,'foo',10.0,'2025-10-04 11:16:24',0,'2024-12-10 17:14:06','2024-12-10 17:14:06'),(44,111773720,'foo',20.0,'2025-06-12 22:49:53',0,'2024-12-10 17:14:06','2024-12-10 17:14:06'),(45,338522290,'foo',20.0,'2025-02-18 17:12:08',0,'2024-12-10 17:14:06','2024-12-10 17:14:06'),(46,420796739,'bar',20.0,'2025-08-01 20:33:51',0,'2024-12-10 17:14:06','2024-12-10 17:14:06'),(47,400527809,'bar',20.0,'2025-05-18 19:49:45',0,'2024-12-10 17:14:07','2024-12-10 17:14:07'),(48,593996660,'foo',20.0,'2025-01-27 16:55:32',0,'2024-12-10 17:14:07','2024-12-10 17:14:07'),(49,192620061,'foo',20.0,'2025-10-26 01:35:35',0,'2024-12-10 17:14:07','2024-12-10 17:14:07'),(50,728673284,'foo',10.0,'2025-04-23 23:42:52',0,'2024-12-10 17:14:07','2024-12-10 17:14:07');
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-10 20:14:03

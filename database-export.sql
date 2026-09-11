-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_absensi_karyawan
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` char(26) NOT NULL,
  `barcode_id` bigint(20) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL,
  `shift_id` bigint(20) unsigned DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` enum('present','late','excused','sick','absent','incomplete') NOT NULL DEFAULT 'absent',
  `note` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendances_user_id_foreign` (`user_id`),
  KEY `attendances_barcode_id_foreign` (`barcode_id`),
  KEY `attendances_shift_id_foreign` (`shift_id`),
  CONSTRAINT `attendances_barcode_id_foreign` FOREIGN KEY (`barcode_id`) REFERENCES `barcodes` (`id`),
  CONSTRAINT `attendances_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`),
  CONSTRAINT `attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
INSERT INTO `attendances` VALUES (4,'01m23btx0n24qq1weh9dc2pfth',5,'2026-09-09','23:02:26',NULL,1,-7.7797360420227,110.34934234619,'late',NULL,NULL,'2026-09-09 21:02:26','2026-09-09 21:02:26');
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barcodes`
--

DROP TABLE IF EXISTS `barcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barcodes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` char(26) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `latitude` double NOT NULL DEFAULT 0,
  `longitude` double NOT NULL DEFAULT 0,
  `radius` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcodes_value_unique` (`value`),
  UNIQUE KEY `barcodes_user_id_unique` (`user_id`),
  CONSTRAINT `barcodes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barcodes`
--

LOCK TABLES `barcodes` WRITE;
/*!40000 ALTER TABLE `barcodes` DISABLE KEYS */;
INSERT INTO `barcodes` VALUES (1,NULL,'Barcode 1','2637724194876',-6.899209,107.592974,50,'2026-09-09 19:35:13','2026-09-09 19:35:13'),(2,NULL,'Barcode Febi','7283446188633',-7.720384764388,110.38002759218,100,'2026-09-09 20:00:18','2026-09-09 21:33:09'),(4,'01m23a3pj5zmmepz1n6wj39y0t','QR - Febi Febri','employee-w7qld4kexvvwvzmxnxgodty9yj6pweuodh52ed7y',-7.8225684582478,110.39337158203,100,'2026-09-09 20:12:19','2026-09-09 20:12:19'),(5,'01m23btx0n24qq1weh9dc2pfth','QR - cek1','employee-3tnktrfezg4sjb3tpda0q3knzy9rf8r40tcumzxa',-7.8225684582478,110.39337158203,100000,'2026-09-09 20:15:58','2026-09-09 21:01:56'),(6,'01m23d3086r5k54j0qzya626t2','QR - cek2','employee-i3rbevcsrzn5lwb9e3sckfzvystz3mqwo1bfejpu',-7.8225684582478,110.39337158203,100000,'2026-09-09 20:37:52','2026-09-09 20:37:52'),(7,'01m23da995ryp8n153g48v9m5d','QR - cek3','employee-jfatu8gmogi8uj6pdo6vwqsfrlr1vwx3zrhbyxlc',-7.8225684582478,110.39337158203,90000,'2026-09-09 20:41:50','2026-09-09 20:41:50'),(8,'01m23g5yr42hcam9b4gms7f9a2','QR - Miss Febi','employee-euds0z6h7tenmehxawd39mdn3gegg2ygzmbyosip',-7.7200724419467,110.38012482884,10000,'2026-09-09 21:31:54','2026-09-09 21:31:54');
/*!40000 ALTER TABLE `barcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('3898d6d64fa9a232bfbfc70deac3401e','i:1;',1788968411),('3898d6d64fa9a232bfbfc70deac3401e:timer','i:1788968411;',1788968411),('580071baad7b227a20e85017933acecb','i:1;',1788968250),('580071baad7b227a20e85017933acecb:timer','i:1788968250;',1788968250),('6db91fc84895f43a4a9a1a9d60309a3b','i:1;',1788965243),('6db91fc84895f43a4a9a1a9d60309a3b:timer','i:1788965243;',1788965243),('8c8ecdd3762f15b0d2636a5314199eeea18b2d6d','i:1;',1788971386),('8c8ecdd3762f15b0d2636a5314199eeea18b2d6d:timer','i:1788971386;',1788971386),('8fec48900062fe7c72590bb5487cb3d4','i:1;',1788969800),('8fec48900062fe7c72590bb5487cb3d4:timer','i:1788969800;',1788969800),('attendance-01m23a3pj5zmmepz1n6wj39y0t-2026-09-09','a:0:{}',1789051695),('attendance-01m23btx0n24qq1weh9dc2pfth-9-2026','a:1:{i:0;a:10:{s:2:\"id\";i:4;s:6:\"status\";s:4:\"late\";s:4:\"date\";s:10:\"2026-09-09\";s:8:\"latitude\";d:-7.7797360420227;s:9:\"longitude\";d:110.34934234619;s:10:\"attachment\";N;s:4:\"note\";N;s:11:\"coordinates\";a:2:{s:3:\"lat\";d:-7.7797360420227;s:3:\"lng\";d:110.34934234619;}s:3:\"lat\";d:-7.7797360420227;s:3:\"lng\";d:110.34934234619;}}',1789056316),('attendance-01m23d3086r5k54j0qzya626t2-2026-09-09','a:0:{}',1789055222),('attendance-01m23da995ryp8n153g48v9m5d-2026-09-09','a:0:{}',1789055222),('cek2@cek2.com|127.0.0.1','i:1;',1788968411),('cek2@cek2.com|127.0.0.1:timer','i:1788968411;',1788968411),('cek2@gmail.com|127.0.0.1','i:2;',1788968512),('cek2@gmail.com|127.0.0.1:timer','i:1788968512;',1788968512),('ebff7eb2d90bb4eac7345b90c578de0b','i:1;',1788968616),('ebff7eb2d90bb4eac7345b90c578de0b:timer','i:1788968616;',1788968616),('f34455dbccfd349039e249c0181ecc20','i:2;',1788968511),('f34455dbccfd349039e249c0181ecc20:timer','i:1788968511;',1788968511);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `divisions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `divisions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` VALUES (1,'Divisi Security','2026-09-09 19:35:10','2026-09-09 19:48:09'),(2,'Divisi 2','2026-09-09 19:35:10','2026-09-09 19:35:10'),(3,'Divisi 3','2026-09-09 19:35:10','2026-09-09 19:35:10'),(4,'Divisi 4','2026-09-09 19:35:10','2026-09-09 19:35:10');
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educations`
--

DROP TABLE IF EXISTS `educations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `educations_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educations`
--

LOCK TABLES `educations` WRITE;
/*!40000 ALTER TABLE `educations` DISABLE KEYS */;
INSERT INTO `educations` VALUES (1,'SD','2026-09-09 19:35:10','2026-09-09 19:35:10'),(2,'SMP','2026-09-09 19:35:10','2026-09-09 19:35:10'),(3,'SMA','2026-09-09 19:35:11','2026-09-09 19:35:11'),(4,'SMK','2026-09-09 19:35:11','2026-09-09 19:35:11'),(5,'D1','2026-09-09 19:35:11','2026-09-09 19:35:11'),(6,'D2','2026-09-09 19:35:11','2026-09-09 19:35:11'),(7,'D3','2026-09-09 19:35:11','2026-09-09 19:35:11'),(8,'D4','2026-09-09 19:35:11','2026-09-09 19:35:11'),(9,'S1','2026-09-09 19:35:11','2026-09-09 19:35:11'),(10,'S2','2026-09-09 19:35:11','2026-09-09 19:35:11'),(11,'S3','2026-09-09 19:35:11','2026-09-09 19:35:11');
/*!40000 ALTER TABLE `educations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_titles`
--

DROP TABLE IF EXISTS `job_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_titles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_titles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_titles`
--

LOCK TABLES `job_titles` WRITE;
/*!40000 ALTER TABLE `job_titles` DISABLE KEYS */;
INSERT INTO `job_titles` VALUES (1,'Ceo','2026-09-09 19:35:11','2026-09-09 19:47:23'),(2,'Admin Pusat','2026-09-09 19:35:11','2026-09-09 19:47:32'),(3,'Admin Cabang','2026-09-09 19:35:11','2026-09-09 19:47:38'),(4,'Owner','2026-09-09 19:35:11','2026-09-09 19:47:45'),(5,'Sopir','2026-09-09 19:35:11','2026-09-09 19:47:50'),(6,'Home Room 1st Grade','2026-09-09 21:26:32','2026-09-09 21:26:32');
/*!40000 ALTER TABLE `job_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_requests`
--

DROP TABLE IF EXISTS `leave_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` char(26) NOT NULL,
  `type` varchar(255) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` varchar(255) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `reviewed_by` char(26) DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `rejection_reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_requests_user_id_foreign` (`user_id`),
  KEY `leave_requests_reviewed_by_foreign` (`reviewed_by`),
  CONSTRAINT `leave_requests_reviewed_by_foreign` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`),
  CONSTRAINT `leave_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_requests`
--

LOCK TABLES `leave_requests` WRITE;
/*!40000 ALTER TABLE `leave_requests` DISABLE KEYS */;
INSERT INTO `leave_requests` VALUES (1,'01m23a3pj5zmmepz1n6wj39y0t','excused','2026-09-09','2026-09-10','Ada keperluan',NULL,40.402286529541,-3.6395668983459,'rejected','01m239g8v1m8z6myw9sq4cgfcz','2026-09-09 21:18:40','Mohon sertrakan dokumen pendukung lalu upload ulang ','2026-09-09 19:57:43','2026-09-09 21:18:40');
/*!40000 ALTER TABLE `leave_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_divisions_table',1),(2,'0001_01_01_000000_create_educations_table',1),(3,'0001_01_01_000000_create_job_titles_table',1),(4,'0001_01_01_000000_create_users_table',1),(5,'0001_01_01_000001_add_two_factor_columns_to_users_table',1),(6,'0001_01_01_000001_create_cache_table',1),(7,'0001_01_01_000002_create_jobs_table',1),(8,'2024_06_08_023152_create_personal_access_tokens_table',1),(9,'2024_06_09_113236_create_barcodes_table',1),(10,'2024_06_16_092112_create_shifts_table',1),(11,'2024_06_17_113814_create_attendances_table',1),(12,'2026_06_13_125717_create_leave_requests_table',1),(13,'2026_06_13_130207_add_device_token_to_users_table',1),(14,'2026_09_09_000000_add_user_id_to_barcodes_table',2),(15,'2026_09_09_000001_backfill_employee_barcodes',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
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
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` char(26) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('IxUh5J0Tf1bEt1NUxtpfrZW34BcJcTdo0WwFvWxF','01m23btx0n24qq1weh9dc2pfth','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.136.2 Chrome/148.0.7778.280 Electron/42.10.0 Safari/537.36','YTo3OntzOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjI2OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NjoiX3Rva2VuIjtzOjQwOiJhU1lKa1M4NFgzU0ZWMnc1MnNrSFdWOWxZZ1h5Um90ZTJwbGdYS2FCIjtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2hvbWUiO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtzOjI2OiIwMW0yM2J0eDBuMjRxcTF3ZWg5ZGMycGZ0aCI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjY0OiI1ODJkYTVhMTRjMWJlZDdjZmYxMGNlZTE0ZGE1YTIxNmZkNDIyNTdlMmYwOWE5MjAwMGIwNGJlNTJkYWVmMTdiIjtzOjU6ImZsYXNoIjthOjA6e319',1788971803),('N3cVjIqPFB3DPMh7CCLdeNe2m2eri2shxk89dJQD','01m239g8v1m8z6myw9sq4cgfcz','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.136.2 Chrome/148.0.7778.280 Electron/42.10.0 Safari/537.36','YTo4OntzOjY6Il90b2tlbiI7czo0MDoieGVBdHZLVlRIOXA1TWV5ZnNNUDlsVlNmd1h5RXk5ZUpRUVA0eGN4cCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9iYXJjb2RlcyI7czo1OiJyb3V0ZSI7czoxNDoiYWRtaW4uYmFyY29kZXMiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7czoyNjoiMDFtMjM5Zzh2MW04ejZteXc5c3E0Y2dmY3oiO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2NDoiNTcxYjMxYjNlZWQyZWYwMDc1ZmVlYzUyM2UzMDE2YzExMTBhOTc4MGViMWVjYTcxNWZlZDk4MmY5YzlmOTY4MyI7czoyOToiYXR0ZW5kYW5jZV9lbXBsb3llZXNfZmFsbGJhY2siO2E6Mjp7czo5OiJlbXBsb3llZXMiO086NDI6IklsbHVtaW5hdGVcUGFnaW5hdGlvblxMZW5ndGhBd2FyZVBhZ2luYXRvciI6MTI6e3M6ODoiACoAaXRlbXMiO086Mzk6IklsbHVtaW5hdGVcRGF0YWJhc2VcRWxvcXVlbnRcQ29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YTo0OntpOjA7TzoxNToiQXBwXE1vZGVsc1xVc2VyIjozNjp7czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo1OiJ1c2VycyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjI2OntzOjI6ImlkIjtzOjI2OiIwMW0yM2EzcGo1em1tZXB6MW42d2ozOXkwdCI7czozOiJuaXAiO3M6ODoiMTIzNDU2NzgiO3M6NDoibmFtZSI7czoxMDoiRmViaSBGZWJyaSI7czo1OiJlbWFpbCI7czoxOToiZXhhbXBsZUBleGFtcGxlLmNvbSI7czo1OiJwaG9uZSI7czoxMzoiNjI4MzE4Njg3ODY3NyI7czo2OiJnZW5kZXIiO3M6NDoibWFsZSI7czoxMDoiYmlydGhfZGF0ZSI7czoxMDoiMTk5OS0wMi0yOCI7czoxMToiYmlydGhfcGxhY2UiO3M6NzoiTGFtcHVuZyI7czo3OiJhZGRyZXNzIjtzOjE3OiJKbC4gRGVtYW5nYW4gQmFydSI7czo0OiJjaXR5IjtzOjE2OiJLYWJ1cGF0ZW4gU2xlbWFuIjtzOjEyOiJlZHVjYXRpb25faWQiO2k6MTA7czoxMToiZGl2aXNpb25faWQiO2k6MTtzOjEyOiJqb2JfdGl0bGVfaWQiO2k6MTtzOjg6InBhc3N3b3JkIjtzOjYwOiIkMnkkMTIkZGVpcS9jOUZsS0ZMMjJMQ1FJOFZHLkQxS25ldWNaazI5VWV3MVN5b3dOc2JPTnJMS1BaUjIiO3M6MTc6InR3b19mYWN0b3Jfc2VjcmV0IjtOO3M6MjU6InR3b19mYWN0b3JfcmVjb3ZlcnlfY29kZXMiO047czoyMzoidHdvX2ZhY3Rvcl9jb25maXJtZWRfYXQiO047czoxMjoicmF3X3Bhc3N3b3JkIjtzOjc6IkZlYmkxMjMiO3M6NToiZ3JvdXAiO3M6NDoidXNlciI7czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO047czoxODoicHJvZmlsZV9waG90b19wYXRoIjtzOjU5OiJwcm9maWxlLXBob3Rvcy93bkIwTUlNc244d1c0U2YzeVpFaFBYSU5welZldXoya1VSR0lpMXFHLmpwZyI7czoxNDoicmVtZW1iZXJfdG9rZW4iO3M6NjA6ImZiNU8wenduZG5hd2lvd1dsTDQzZzRLS0hGbVVJYWdkSmZJQzBMOUFxMDFuZ3Z4UXlmREJGbE9tOGdXRyI7czoxMjoiZGV2aWNlX3Rva2VuIjtzOjM2OiIzN2I0MDE1My1kYTY2LTQ1ZjctOTY5Zi01NzNiN2ExNjMxZTEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjYtMDktMDkgMjE6NDU6NDkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjYtMDktMDkgMjE6NDY6MjMiO3M6MTE6ImF0dGVuZGFuY2VzIjtPOjM5OiJJbGx1bWluYXRlXERhdGFiYXNlXEVsb3F1ZW50XENvbGxlY3Rpb24iOjI6e3M6ODoiACoAaXRlbXMiO2E6MDp7fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9fXM6MTE6IgAqAG9yaWdpbmFsIjthOjI1OntzOjI6ImlkIjtzOjI2OiIwMW0yM2EzcGo1em1tZXB6MW42d2ozOXkwdCI7czozOiJuaXAiO3M6ODoiMTIzNDU2NzgiO3M6NDoibmFtZSI7czoxMDoiRmViaSBGZWJyaSI7czo1OiJlbWFpbCI7czoxOToiZXhhbXBsZUBleGFtcGxlLmNvbSI7czo1OiJwaG9uZSI7czoxMzoiNjI4MzE4Njg3ODY3NyI7czo2OiJnZW5kZXIiO3M6NDoibWFsZSI7czoxMDoiYmlydGhfZGF0ZSI7czoxMDoiMTk5OS0wMi0yOCI7czoxMToiYmlydGhfcGxhY2UiO3M6NzoiTGFtcHVuZyI7czo3OiJhZGRyZXNzIjtzOjE3OiJKbC4gRGVtYW5nYW4gQmFydSI7czo0OiJjaXR5IjtzOjE2OiJLYWJ1cGF0ZW4gU2xlbWFuIjtzOjEyOiJlZHVjYXRpb25faWQiO2k6MTA7czoxMToiZGl2aXNpb25faWQiO2k6MTtzOjEyOiJqb2JfdGl0bGVfaWQiO2k6MTtzOjg6InBhc3N3b3JkIjtzOjYwOiIkMnkkMTIkZGVpcS9jOUZsS0ZMMjJMQ1FJOFZHLkQxS25ldWNaazI5VWV3MVN5b3dOc2JPTnJMS1BaUjIiO3M6MTc6InR3b19mYWN0b3Jfc2VjcmV0IjtOO3M6MjU6InR3b19mYWN0b3JfcmVjb3ZlcnlfY29kZXMiO047czoyMzoidHdvX2ZhY3Rvcl9jb25maXJtZWRfYXQiO047czoxMjoicmF3X3Bhc3N3b3JkIjtzOjc6IkZlYmkxMjMiO3M6NToiZ3JvdXAiO3M6NDoidXNlciI7czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO047czoxODoicHJvZmlsZV9waG90b19wYXRoIjtzOjU5OiJwcm9maWxlLXBob3Rvcy93bkIwTUlNc244d1c0U2YzeVpFaFBYSU5welZldXoya1VSR0lpMXFHLmpwZyI7czoxNDoicmVtZW1iZXJfdG9rZW4iO3M6NjA6ImZiNU8wenduZG5hd2lvd1dsTDQzZzRLS0hGbVVJYWdkSmZJQzBMOUFxMDFuZ3Z4UXlmREJGbE9tOGdXRyI7czoxMjoiZGV2aWNlX3Rva2VuIjtzOjM2OiIzN2I0MDE1My1kYTY2LTQ1ZjctOTY5Zi01NzNiN2ExNjMxZTEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjYtMDktMDkgMjE6NDU6NDkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjYtMDktMDkgMjE6NDY6MjMiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjExOiIAKgBwcmV2aW91cyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTozOntzOjE3OiJlbWFpbF92ZXJpZmllZF9hdCI7czo4OiJkYXRldGltZSI7czoxMDoiYmlydGhfZGF0ZSI7czoxNDoiZGF0ZXRpbWU6WS1tLWQiO3M6ODoicGFzc3dvcmQiO3M6NjoiaGFzaGVkIjt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjE6e2k6MDtzOjE3OiJwcm9maWxlX3Bob3RvX3VybCI7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9i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YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToyNjp7czoyOiJpZCI7czoyNjoiMDFtMjNidHgwbjI0cXExd2VoOWRjMnBmdGgiO3M6MzoibmlwIjtzOjg6IjI2LjQ2Ljc2IjtzOjQ6Im5hbWUiO3M6NDoiY2VrMSI7czo1OiJlbWFpbCI7czoxNDoiY2VrMUBnbWFpbC5jb20iO3M6NToicGhvbmUiO3M6MTQ6Ijg3ODUxMTY1MTc2Mjc2IjtzOjY6ImdlbmRlciI7czo0OiJtYWxlIjtzOjEwOiJiaXJ0aF9kYXRlIjtzOjEwOiIxOTk5LTAzLTEwIjtzOjExOiJiaXJ0aF9wbGFjZSI7czoxMDoiWW9neWFrYXJ0YSI7czo3OiJhZGRyZXNzIjtzOjE2OiJKbC4gQWhtYWQgRGFobGFuIjtzOjQ6ImNpdHkiO3M6MTA6IllvZ3lha2FydGEiO3M6MTI6ImVkdWNhdGlvbl9pZCI7aTo0O3M6MTE6ImRpdmlzaW9uX2lkIjtpOjE7czoxMjoiam9iX3RpdGxlX2lkIjtpOjQ7czo4OiJwYXNzd29yZCI7czo2MDoiJDJ5JDEyJC9uT3p6NS5CWEVJUFcvaXlVMGdxM2UwREQxa1o3VWJiRHZNQ1I5T1c0OHF1N1dwdDBBLnAuIjtzOjE3OiJ0d29fZmFjdG9yX3NlY3JldCI7TjtzOjI1OiJ0d29fZmFjdG9yX3JlY292ZXJ5X2NvZGVzIjtOO3M6MjM6InR3b19mYWN0b3JfY29uZmlybWVkX2F0IjtOO3M6MTI6InJhd19wYXNzd29yZCI7czo0OiJjZWsxIjtzOjU6Imdyb3VwIjtzOjQ6InVzZXIiO3M6MTc6ImVtYWlsX3ZlcmlmaWVkX2F0IjtOO3M6MTg6InByb2ZpbGVfcGhvdG9fcGF0aCI7czo1OToicHJvZmlsZS1waG90b3MvTlkyT0pDUnZ0NldYeFdYRVlVdDZxcVdaQTViR1hjRjJPa1hKOEhHMS5qcGciO3M6MTQ6InJlbWVtYmVyX3Rva2VuIjtzOjYwOiIwTGFxZnpHbDQyM3g0elpWeVlzZ0VKejFlcVBZMWxrcE8zamxNc1JvbU5tanNRUzZTNHI0YXozcGdrbDEiO3M6MTI6ImRldmljZV90b2tlbiI7czozNjoiNDgyNGY1ZDAtMGViZi00NzVhLWJmZDMtZmJmNGRjZmQwNmRlIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI2LTA5LTA5IDIyOjE1OjU4IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI2LTA5LTA5IDIyOjE3OjEwIjtzOjExOiJhdHRlbmRhbmNlcyI7TzozOToiSWxsdW1pbmF0ZVxEYXRhYmFzZVxFbG9xdWVudFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjA6e31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fX1zOjExOiIAKgBvcmlnaW5hbCI7YToyNTp7czoyOiJpZCI7czoyNjoiMDFtMjNidHgwbjI0cXExd2VoOWRjMnBmdGgiO3M6MzoibmlwIjtzOjg6IjI2LjQ2Ljc2IjtzOjQ6Im5hbWUiO3M6NDoiY2VrMSI7czo1OiJlbWFpbCI7czoxNDoiY2VrMUBnbWFpbC5jb20iO3M6NToicGhvbmUiO3M6MTQ6Ijg3ODUxMTY1MTc2Mjc2IjtzOjY6ImdlbmRlciI7czo0OiJtYWxlIjtzOjEwOiJiaXJ0aF9kYXRlIjtzOjEwOiIxOTk5LTAzLTEwIjtzOjExOiJiaXJ0aF9wbGFjZSI7czoxMDoiWW9neWFrYXJ0YSI7czo3OiJhZGRyZXNzIjtzOjE2OiJKbC4gQWhtYWQgRGFobGFuIjtzOjQ6ImNpdHkiO3M6MTA6IllvZ3lha2FydGEiO3M6MTI6ImVkdWNhdGlvbl9pZCI7aTo0O3M6MTE6ImRpdmlzaW9uX2lkIjtpOjE7czoxMjoiam9iX3RpdGxlX2lkIjtpOjQ7czo4OiJwYXNzd29yZCI7czo2MDoiJDJ5JDEyJC9uT3p6NS5CWEVJUFcvaXlVMGdxM2UwREQxa1o3VWJiRHZNQ1I5T1c0OHF1N1dwdDBBLnAuIjtzOjE3OiJ0d29fZmFjdG9yX3NlY3JldCI7TjtzOjI1OiJ0d29fZmFjdG9yX3JlY292ZXJ5X2NvZGVzIjtOO3M6MjM6InR3b19mYWN0b3JfY29uZmlybWVkX2F0IjtOO3M6MTI6InJhd19wYXNzd29yZCI7czo0OiJjZWsxIjtzOjU6Imdyb3VwIjtzOjQ6InVzZXIiO3M6MTc6ImVtYWlsX3ZlcmlmaWVkX2F0IjtOO3M6MTg6InByb2ZpbGVfcGhvdG9fcGF0aCI7czo1OToicHJvZmlsZS1waG90b3MvTlkyT0pDUnZ0NldYeFdYRVlVdDZxcVdaQTViR1hjRjJPa1hKOEhHMS5qcGciO3M6MTQ6InJlbWVtYmVyX3Rva2VuIjtzOjYwOiIwTGFxZnpHbDQyM3g0elpWeVlzZ0VKejFlcVBZMWxrcE8zamxNc1JvbU5tanNRUzZTNHI0YXozcGdrbDEiO3M6MTI6ImRldmljZV90b2tlbiI7czozNjoiNDgyNGY1ZDAtMGViZi00NzVhLWJmZDMtZmJmNGRjZmQwNmRlIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI2LTA5LTA5IDIyOjE1OjU4IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI2LTA5LTA5IDIyOjE3OjEwIjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czoxMToiACoAcHJldmlvdXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6Mzp7czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO3M6ODoiZGF0ZXRpbWUiO3M6MTA6ImJpcnRoX2RhdGUiO3M6MTQ6ImRhdGV0aW1lOlktbS1kIjtzOjg6InBhc3N3b3JkIjtzOjY6Imhhc2hlZCI7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0Q2FjaGUiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YToxOntpOjA7czoxNzoicHJvZmlsZV9waG90b191cmwiO31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjI6e3M6ODoiZGl2aXNpb24iO086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Y2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjI2OntzOjI6ImlkIjtzOjI2OiIwMW0yM2QzMDg2cjVrNTRqMHF6eWE2MjZ0MiI7czozOiJuaXAiO3M6MTA6IjI2LjEyLjIzMjMiO3M6NDoibmFtZSI7czo0OiJjZWsyIjtzOjU6ImVtYWlsIjtzOjE0OiJjZWsyQGdtYWlsLmNvbSI7czo1OiJwaG9uZSI7czoxMToiMDg3ODYxNTYxNDUiO3M6NjoiZ2VuZGVyIjtzOjQ6Im1hbGUiO3M6MTA6ImJpcnRoX2RhdGUiO3M6MTA6IjE5OTktMDMtMTAiO3M6MTE6ImJpcnRoX3BsYWNlIjtzOjg6Ik1hZ2VsYW5nIjtzOjc6ImFkZHJlc3MiO3M6MTY6IkpsLiBBaG1hZCBEYWhsYW4iO3M6NDoiY2l0eSI7czoxMDoiWW9neWFrYXJ0YSI7czoxMjoiZWR1Y2F0aW9uX2lkIjtpOjU7czoxMToiZGl2aXNpb25faWQiO2k6MTtzOjEyOiJqb2JfdGl0bGVfaWQiO2k6MztzOjg6InBhc3N3b3JkIjtzOjYwOiIkMnkkMTIka0lWRFdBUTFxcUJmT05IelQ0TVouT0NYL2dNMlRUdWhjLkdTejI2eXR2a3RpOEZyNzM1aG0iO3M6MTc6InR3b19mYWN0b3Jfc2VjcmV0IjtOO3M6MjU6InR3b19mYWN0b3JfcmVjb3ZlcnlfY29kZXMiO047czoyMzoidHdvX2ZhY3Rvcl9jb25maXJtZWRfYXQiO047czoxMjoicmF3X3Bhc3N3b3JkIjtzOjQ6ImNlazEiO3M6NToiZ3JvdXAiO3M6NDoidXNlciI7czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO047czoxODoicHJvZmlsZV9waG90b19wYXRoIjtOO3M6MTQ6InJlbWVtYmVyX3Rva2VuIjtOO3M6MTI6ImRldmljZV90b2tlbiI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI2LTA5LTA5IDIyOjM3OjUyIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI2LTA5LTA5IDIyOjM3OjUyIjtzOjExOiJhdHRlbmRhbmNlcyI7TzozOToiSWxsdW1pbmF0ZVxEYXRhYmFzZVxFbG9xdWVudFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjA6e31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fX1zOjExOiIAKgBvcmlnaW5hbCI7YToyNTp7czoyOiJpZCI7czoyNjoiMDFtMjNkMzA4NnI1azU0ajBxenlhNjI2dDIiO3M6MzoibmlwIjtzOjEwOiIyNi4xMi4yMzIzIjtzOjQ6Im5hbWUiO3M6NDoiY2VrMiI7czo1OiJlbWFpbCI7czoxNDoiY2VrMkBnbWFpbC5jb20iO3M6NToicGhvbmUiO3M6MTE6IjA4Nzg2MTU2MTQ1IjtzOjY6ImdlbmRlciI7czo0OiJtYWxlIjtzOjEwOiJiaXJ0aF9kYXRlIjtzOjEwOiIxOTk5LTAzLTEwIjtzOjExOiJiaXJ0aF9wbGFjZSI7czo4OiJNYWdlbGFuZyI7czo3OiJhZGRyZXNzIjtzOjE2OiJKbC4gQWhtYWQgRGFobGFuIjtzOjQ6ImNpdHkiO3M6MTA6IllvZ3lha2FydGEiO3M6MTI6ImVkdWNhdGlvbl9pZCI7aTo1O3M6MTE6ImRpdmlzaW9uX2lkIjtpOjE7czoxMjoiam9iX3RpdGxlX2lkIjtpOjM7czo4OiJwYXNzd29yZCI7czo2MDoiJDJ5JDEyJGtJVkRXQVExcXFCZk9OSHpUNE1aLk9DWC9nTTJUVHVoYy5HU3oyNnl0dmt0aThGcjczNWhtIjtzOjE3OiJ0d29fZmFjdG9yX3NlY3JldCI7TjtzOjI1OiJ0d29fZmFjdG9yX3JlY292ZXJ5X2NvZGVzIjtOO3M6MjM6InR3b19mYWN0b3JfY29uZmlybWVkX2F0IjtOO3M6MTI6InJhd19wYXNzd29yZCI7czo0OiJjZWsxIjtzOjU6Imdyb3VwIjtzOjQ6InVzZXIiO3M6MTc6ImVtYWlsX3ZlcmlmaWVkX2F0IjtOO3M6MTg6InByb2ZpbGVfcGhvdG9fcGF0aCI7TjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7TjtzOjEyOiJkZXZpY2VfdG9rZW4iO047czoxMDoiY3JlYXRlZF9hdCI7czox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cnRhIjtzOjEyOiJlZHVjYXRpb25faWQiO2k6MTtzOjExOiJkaXZpc2lvbl9pZCI7aToxO3M6MTI6ImpvYl90aXRsZV9pZCI7aTo1O3M6ODoicGFzc3dvcmQiO3M6NjA6IiQyeSQxMiR3Y0pYTUdDbG96a3MwOFRpTVNhM0YuMkxvYlVOZmNmMXQ1SGgxdEZkWE8xdXJsTHRVQUNKdSI7czoxNzoidHdvX2ZhY3Rvcl9zZWNyZXQiO047czoyNToidHdvX2ZhY3Rvcl9yZWNvdmVyeV9jb2RlcyI7TjtzOjIzOiJ0d29fZmFjdG9yX2NvbmZpcm1lZF9hdCI7TjtzOjEyOiJyYXdfcGFzc3dvcmQiO3M6NDoiY2VrMyI7czo1OiJncm91cCI7czo0OiJ1c2VyIjtzOjE3OiJlbWFpbF92ZXJpZmllZF9hdCI7TjtzOjE4OiJwcm9maWxlX3Bob3RvX3BhdGgiO047czoxNDoicmVtZW1iZXJfdG9rZW4iO3M6NjA6IlVuSFJkQ1UwUTBGVmU1MklKVEpMMW5EUUFFazJydG1UVEJKOEdidm93NEc4SFJuRUw2NHJCa3FEV2VnTSI7czoxMjoiZGV2aWNlX3Rva2VuIjtzOjM2OiIzN2I0MDE1My1kYTY2LTQ1ZjctOTY5Zi01NzNiN2ExNjMxZTEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjYtMDktMDkgMjI6NDE6NTAiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjYtMDktMDkgMjI6NDI6MzYiO3M6MTE6ImF0dGVuZGFuY2VzIjtPOjM5OiJJbGx1bWluYXRlXERhdGFiYXNlXEVsb3F1ZW50XENvbGxlY3Rpb24iOjI6e3M6ODoiACoAaXRlbXMiO2E6MDp7fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9fXM6MTE6IgAqAG9yaWdpbmFsIjthOjI1OntzOjI6ImlkIjtzOjI2OiIwMW0yM2RhOTk1cnlwOG4xNTNnNDh2OW01ZCI7czozOiJuaXAiO3M6NjoiMTIzMTIzIjtzOjQ6Im5hbWUiO3M6NDoiY2VrMyI7czo1OiJlbWFpbCI7czoxNDoiY2VrM0BnbWFpbC5jb20iO3M6NToicGhvbmUiO3M6MTA6IjA5ODY3ODY3NTIiO3M6NjoiZ2VuZGVyIjtzOjQ6Im1hbGUiO3M6MTA6ImJpcnRoX2RhdGUiO3M6MTA6IjE5OTktMDMtMTAiO3M6MTE6ImJpcnRoX3BsYWNlIjtzOjEwOiJZb2d5YWthcnRhIjtzOjc6ImFkZHJlc3MiO3M6MTA6Imhhc2hkYXNqaGQiO3M6NDoiY2l0eSI7czoxMDoiWW9neWFrYXJ0YSI7czoxMjoiZWR1Y2F0aW9uX2lkIjtpOjE7czoxMToiZGl2aXNpb25faWQiO2k6MTtzOjEyOiJqb2JfdGl0bGVfaWQiO2k6NTtzOjg6InBhc3N3b3JkIjtzOjYwOiIkMnkkMTIkd2NKWE1HQ2xvemtzMDhUaU1TYTNGLjJMb2JVTmZjZjF0NUhoMXRGZFhPMXVybEx0VUFDSnUiO3M6MTc6InR3b19mYWN0b3Jfc2VjcmV0IjtOO3M6MjU6InR3b19mYWN0b3JfcmVjb3ZlcnlfY29kZXMiO047czoyMzoidHdvX2ZhY3Rvcl9jb25maXJtZWRfYXQiO047czoxMjoicmF3X3Bhc3N3b3JkIjtzOjQ6ImNlazMiO3M6NToiZ3JvdXAiO3M6NDoidXNlciI7czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO047czoxODoicHJvZmlsZV9waG90b19wYXRoIjtOO3M6MTQ6InJlbWVtYmVyX3Rva2VuIjtzOjYwOiJVbkhSZENVMFEwRlZlNTJJSlRKTDFuRFFBRWsycnRtVFRCSjhHYnZvdzRHOEhSbkVMNjRyQmtxRFdlZ00iO3M6MTI6ImRldmljZV90b2tlbiI7czozNjoiMzdiNDAxNTMtZGE2Ni00NWY3LTk2OWYtNTczYjdhMTYzMWUxIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI2LTA5LTA5IDIyOjQxOjUwIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI2LTA5LTA5IDIyOjQyOjM2Ijt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czoxMToiACoAcHJldmlvdXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6Mzp7czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO3M6ODoiZGF0ZXRpbWUiO3M6MTA6ImJpcnRoX2Rh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',1788971589);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shifts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
INSERT INTO `shifts` VALUES (1,'Gistrav Islamia School','07:00:00','15:00:00','2026-09-09 19:35:13','2026-09-09 21:25:44');
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` char(26) NOT NULL,
  `nip` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `birth_date` date DEFAULT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `education_id` bigint(20) unsigned DEFAULT NULL,
  `division_id` bigint(20) unsigned DEFAULT NULL,
  `job_title_id` bigint(20) unsigned DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `raw_password` varchar(255) DEFAULT NULL,
  `group` enum('user','admin','superadmin') NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `device_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_education_id_foreign` (`education_id`),
  KEY `users_division_id_foreign` (`division_id`),
  KEY `users_job_title_id_foreign` (`job_title_id`),
  CONSTRAINT `users_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`),
  CONSTRAINT `users_education_id_foreign` FOREIGN KEY (`education_id`) REFERENCES `educations` (`id`),
  CONSTRAINT `users_job_title_id_foreign` FOREIGN KEY (`job_title_id`) REFERENCES `job_titles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('01m239g8v1m8z6myw9sq4cgfcz','0000000000000000','Super Admin','superadmin@example.com','00000000000','male',NULL,NULL,'','',8,4,2,'$2y$12$pFCgO17s7kZSZN50nUgrzOLwz.9JU4/muobvZlXpaCCcWeodWD4XS',NULL,NULL,NULL,'superadmin','superadmin','2026-09-09 19:35:12',NULL,'5OJKN1opNLdaJzariZVnqIqY5DN0m3PT3YAOQ4P5QdT0bNac9uO6dUgVjId3',NULL,'2026-09-09 19:35:12','2026-09-09 19:35:12'),('01m239g96qk44h6n00jb9hxd9v','0000000000000000','Admin','admin@example.com','00000000000','male',NULL,NULL,'','',4,2,2,'$2y$12$cvtPKB5ugGgk.JXa2rgo/ehnZ8R4/Pxh4/8wJHJtYSehvk6E.cPHS',NULL,NULL,NULL,'admin','admin','2026-09-09 19:35:12',NULL,'qoBj3nY0ZG',NULL,'2026-09-09 19:35:12','2026-09-09 19:35:12'),('01m23a3pj5zmmepz1n6wj39y0t','12345678','Febi Febri','example@example.com','6283186878677','male','1999-02-28','Lampung','Jl. Demangan Baru','Kabupaten Sleman',10,1,1,'$2y$12$deiq/c9FlKFL22LCQI8VG.D1KneucZk29Uew1SyowNsbONrLKPZR2',NULL,NULL,NULL,'Febi123','user',NULL,'profile-photos/wnB0MIMsn8wW4Sf3yZEhPXINpzVeuz2kURGIi1qG.jpg','fb5O0zwndnawiowWlL43g4KKHFmUIagdJfIC0L9Aq01ngvxQyfDBFlOm8gWG','37b40153-da66-45f7-969f-573b7a1631e1','2026-09-09 19:45:49','2026-09-09 19:46:23'),('01m23btx0n24qq1weh9dc2pfth','26.46.76','cek1','cek1@gmail.com','87851165176276','male','1999-03-10','Yogyakarta','Jl. Ahmad Dahlan','Yogyakarta',4,1,4,'$2y$12$Pl686il5SvwpX5yo1c1FPuq8HYGTxMU3wz5C0rSfXLCKpI6sivQCi',NULL,NULL,NULL,'cek1','user',NULL,'profile-photos/NY2OJCRvt6WXxWXEYUt6qqWZA5bGXcF2OkXJ8HG1.jpg','0LaqfzGl423x4zZVyYsgEJz1eqPY1lkpO3jlMsRomNmjsQS6S4r4az3pgkl1','4824f5d0-0ebf-475a-bfd3-fbf4dcfd06de','2026-09-09 20:15:58','2026-09-09 21:01:56'),('01m23d3086r5k54j0qzya626t2','26.12.2323','cek2','cek2@gmail.com','08786156145','male','1999-03-10','Magelang','Jl. Ahmad Dahlan','Yogyakarta',5,1,3,'$2y$12$kIVDWAQ1qqBfONHzT4MZ.OCX/gM2TTuhc.GSz26ytvkti8Fr735hm',NULL,NULL,NULL,'cek1','user',NULL,NULL,NULL,NULL,'2026-09-09 20:37:52','2026-09-09 20:37:52'),('01m23da995ryp8n153g48v9m5d','123123','cek3','cek3@gmail.com','0986786752','male','1999-03-10','Yogyakarta','hashdasjhd','Yogyakarta',1,1,5,'$2y$12$wcJXMGClozks08TiMSa3F.2LobUNfcf1t5Hh1tFdXO1urlLtUACJu',NULL,NULL,NULL,'cek3','user',NULL,NULL,'gPnXCxWajejM8xZHKxkbbaYPWe8HUoVtbDOYJY9zd67L7N00j0CmwlFk3xq3','37b40153-da66-45f7-969f-573b7a1631e1','2026-09-09 20:41:50','2026-09-09 20:42:36'),('01m23g5yr42hcam9b4gms7f9a2','26.01.2627','Miss Febi','febifebri20@gmail.com','6282298924812','female','1999-02-28','Lampung','Jl. Demangan Baru','Kabupaten Sleman',10,2,6,'$2y$12$9kRMyvJqrd0xV4NU43Lr4OcMcp3fWTGyRqiAu362iKSjcGZ2bDsjm',NULL,NULL,NULL,'FEBI123','user',NULL,'profile-photos/meHJpKc3w6j5g56vz0LZj8qLJ5WhoWWJvynxk4HE.png',NULL,NULL,'2026-09-09 21:31:54','2026-09-09 21:31:54');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-09 18:49:10

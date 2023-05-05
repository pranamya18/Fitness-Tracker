CREATE DATABASE  IF NOT EXISTS `fitness_tracker` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fitness_tracker`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fitness_tracker
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `bmi`
--

DROP TABLE IF EXISTS `bmi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bmi` (
  `height` float DEFAULT NULL,
  `weight` float NOT NULL,
  `date` date NOT NULL,
  `user_id` int DEFAULT NULL,
  KEY `userbmi` (`user_id`),
  CONSTRAINT `userbmi` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bmi`
--

LOCK TABLES `bmi` WRITE;
/*!40000 ALTER TABLE `bmi` DISABLE KEYS */;
INSERT INTO `bmi` VALUES (175,75,'2022-01-01',1),(180,80,'2022-01-02',2),(165,60,'2022-01-03',3),(170,70,'2022-01-04',4),(160,55,'2022-01-05',5),(175,75,'2022-01-06',6),(170,65,'2022-01-07',7),(185,85,'2022-01-08',8),(160,50,'2022-01-09',9),(175,70,'2022-01-10',10),(180,80,'2022-01-11',11),(165,60,'2022-01-12',12),(170,70,'2022-01-13',13),(160,55,'2022-01-14',14),(175,75,'2022-01-15',15);
/*!40000 ALTER TABLE `bmi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercise` (
  `exercise_id` int NOT NULL AUTO_INCREMENT,
  `exercise_type` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`exercise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES (1,'Running','Jogging for 30 minutes'),(2,'Cycling','Biking for 45 minutes'),(3,'Swimming','Swimming laps for 1 hour'),(4,'Weightlifting','Bench press, 3 sets of 10 reps'),(5,'Weightlifting','Shoulder press, 3 sets of 10 reps'),(6,'Weightlifting','Incline press, 3 sets of 10 reps'),(7,'Pushups',' 3 sets of 10 reps'),(8,'pullups','3 sets of 10 reps'),(9,'Surya Namaskar','50  reps'),(10,'Downward facing Dog','15 reps'),(11,'Worrior Pose','10 reps for 15 mins'),(12,'The Hundred','10 reps'),(13,'The Roll-up','10 reps'),(14,'Single Leg Circle','10 reps'),(15,'Hiking','Hiking for 2 hours on a mountain trail'),(16,'Boxing','Boxing for 1 hour with a trainer'),(17,'Salsa','10 mins'),(18,'Merengue','10 mins'),(19,'Rowing','Rowing machine for 30 minutes'),(20,'Burpees','3 X 10 sets'),(21,'Jumping Jack','3 X 10 sets'),(22,'Lungees','3 X 10 sets'),(23,'Plank','3 X 10 sets');
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_class`
--

DROP TABLE IF EXISTS `group_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_class` (
  `group_id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `meal_plan` varchar(100) DEFAULT NULL,
  `gym_id` int DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  KEY `gym_id_fk2` (`gym_id`),
  CONSTRAINT `gym_id_fk2` FOREIGN KEY (`gym_id`) REFERENCES `gym` (`gym_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_class`
--

LOCK TABLES `group_class` WRITE;
/*!40000 ALTER TABLE `group_class` DISABLE KEYS */;
INSERT INTO `group_class` VALUES (1,'Yoga','01:00:00','Vegetarian',1),(2,'Pilates','00:45:00','Low-fat',2),(3,'Zumba','01:15:00','Vegan',4),(4,'Kickboxing','01:00:00','Gluten-free',5),(5,'CrossFit','01:15:00','Paleo',1),(6,'Boxing','01:30:00','Keto',2),(7,'HIIT','01:30:00','Mediterranean',1),(8,'Cycling','01:00:00','Whole30',2),(9,'Aqua Aerobics','01:30:00','Low-carb',4),(10,'Strength Training','01:00:00','High-carb',5);
/*!40000 ALTER TABLE `group_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym`
--

DROP TABLE IF EXISTS `gym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym` (
  `gym_id` int NOT NULL AUTO_INCREMENT,
  `gym_name` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip` int NOT NULL,
  `total_revenue` int NOT NULL,
  `users_count` int DEFAULT NULL,
  `trainer_count` int DEFAULT NULL,
  PRIMARY KEY (`gym_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym`
--

LOCK TABLES `gym` WRITE;
/*!40000 ALTER TABLE `gym` DISABLE KEYS */;
INSERT INTO `gym` VALUES (1,'Fitness First','123 Main St','Anytown',12345,500,3,3),(2,'Gold\'s Gym','456 Oak Ave','Othertown',67890,500,3,2),(3,'24 Hour Fitness','789 Elm St','Somewhere',54321,500,3,2),(4,'LA Fitness','321 Maple Dr','Anytown',98765,500,3,2),(5,'Equinox','555 Fifth Ave','New York',10001,500,3,2);
/*!40000 ALTER TABLE `gym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutrition`
--

DROP TABLE IF EXISTS `nutrition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutrition` (
  `serving_size` int NOT NULL,
  `calories` float NOT NULL,
  `nutrition` varchar(100) NOT NULL,
  `allergens` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `user_id` int NOT NULL,
  KEY `usernutrition` (`user_id`),
  CONSTRAINT `usernutrition` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutrition`
--

LOCK TABLES `nutrition` WRITE;
/*!40000 ALTER TABLE `nutrition` DISABLE KEYS */;
INSERT INTO `nutrition` VALUES (150,200,'Grilled chicken breast','None','2022-01-01',1),(100,75,'Roasted broccoli','None','2022-01-01',2),(200,300,'Spaghetti and meatballs','Gluten','2022-01-02',3),(150,125,'Mixed berries','None','2022-01-02',4),(120,150,'Spinach salad','Nuts','2022-01-03',5),(200,250,'Grilled salmon','None','2022-01-03',6),(150,180,'Egg sandwich','Dairy','2022-01-04',7),(200,225,'Sushi roll','Soy','2022-01-04',8),(100,50,'Apple','None','2022-01-05',9),(150,125,'Caesar salad','Dairy','2022-01-05',10),(100,70,'Hummus and veggies','None','2022-01-06',11),(150,200,'Beef stir fry','Soy','2022-01-06',12),(120,90,'Peanut butter toast','Peanuts','2022-01-07',13),(150,200,'Grilled cheese sandwich','Gluten','2022-01-07',14),(100,80,'Mixed nuts','Nuts','2022-01-08',15);
/*!40000 ALTER TABLE `nutrition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `payment_type` enum('DEBIT CARD','CREDIT CARD','CASH') NOT NULL,
  `payment_date` date NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'DEBIT CARD','2023-03-15',25),(2,'CASH','2023-03-16',35),(3,'CREDIT CARD','2023-03-17',40),(4,'DEBIT CARD','2023-03-18',35),(5,'CASH','2023-03-19',25),(6,'CREDIT CARD','2023-03-20',35),(7,'DEBIT CARD','2023-03-21',25),(8,'CASH','2023-03-22',35),(9,'CREDIT CARD','2023-03-23',45),(10,'DEBIT CARD','2023-03-24',25),(11,'CASH','2023-03-25',30),(12,'CREDIT CARD','2023-03-26',45),(13,'DEBIT CARD','2023-03-27',25),(14,'CASH','2023-03-28',25),(15,'CREDIT CARD','2023-03-29',35),(16,'CREDIT CARD','2023-04-19',50),(17,'DEBIT CARD','2023-04-20',75);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_training_session`
--

DROP TABLE IF EXISTS `personal_training_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_training_session` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `duration` time DEFAULT NULL,
  `customized_meal_plan` varchar(100) DEFAULT NULL,
  `gym_id` int DEFAULT NULL,
  PRIMARY KEY (`session_id`),
  KEY `gym_id_fk1` (`gym_id`),
  CONSTRAINT `gym_id_fk1` FOREIGN KEY (`gym_id`) REFERENCES `gym` (`gym_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_training_session`
--

LOCK TABLES `personal_training_session` WRITE;
/*!40000 ALTER TABLE `personal_training_session` DISABLE KEYS */;
INSERT INTO `personal_training_session` VALUES (1,'01:00:00','High protein diet plan',1),(2,'00:45:00','Vegan meal plan',2),(3,'01:30:00','Low-carb diet plan',3),(4,'01:15:00','Gluten-free meal plan',4),(5,'01:00:00','Vegetarian meal plan',5),(6,'01:15:00','High fiber diet plan',1),(7,'01:30:00','Keto diet plan',2),(8,'01:00:00','Paleo meal plan',3),(9,'00:45:00','Low-fat diet plan',4),(10,'01:15:00','Balanced meal plan',5),(11,'01:30:00','Intermittent fasting plan',1),(12,'01:00:00','Mediterranean diet plan',2),(13,'01:15:00','Whole30 meal plan',3),(14,'01:30:00','Plant-based diet plan',4),(15,'01:00:00','High-carb diet plan',5);
/*!40000 ALTER TABLE `personal_training_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reward`
--

DROP TABLE IF EXISTS `reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reward` (
  `reward_id` int NOT NULL AUTO_INCREMENT,
  `points` int DEFAULT NULL,
  `expiry_date` date NOT NULL,
  PRIMARY KEY (`reward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reward`
--

LOCK TABLES `reward` WRITE;
/*!40000 ALTER TABLE `reward` DISABLE KEYS */;
INSERT INTO `reward` VALUES (1,100,'2023-05-31'),(2,50,'2023-06-30'),(3,200,'2023-07-31'),(4,75,'2023-08-31'),(5,150,'2023-09-30'),(6,25,'2023-10-31'),(7,300,'2023-11-30'),(8,50,'2023-12-31'),(9,100,'2024-01-31'),(10,75,'2024-02-28'),(11,150,'2024-03-31'),(12,200,'2024-04-30'),(13,50,'2024-05-31'),(14,100,'2024-06-30'),(15,25,'2024-07-31');
/*!40000 ALTER TABLE `reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reward_allotment`
--

DROP TABLE IF EXISTS `reward_allotment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reward_allotment` (
  `reward_id` int DEFAULT NULL,
  `trainer_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  KEY `reward_userfk` (`user_id`),
  KEY `reward_trainerfk` (`trainer_id`),
  KEY `reward_allotment` (`reward_id`),
  CONSTRAINT `reward_allotment` FOREIGN KEY (`reward_id`) REFERENCES `reward` (`reward_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reward_trainerfk` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`trainer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reward_userfk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reward_allotment`
--

LOCK TABLES `reward_allotment` WRITE;
/*!40000 ALTER TABLE `reward_allotment` DISABLE KEYS */;
INSERT INTO `reward_allotment` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,1,11),(12,2,12),(13,3,13),(14,4,14),(15,5,15);
/*!40000 ALTER TABLE `reward_allotment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sleep`
--

DROP TABLE IF EXISTS `sleep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sleep` (
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `duration` time NOT NULL,
  `date` date NOT NULL,
  `user_id` int DEFAULT NULL,
  KEY `usersleep` (`user_id`),
  CONSTRAINT `usersleep` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sleep`
--

LOCK TABLES `sleep` WRITE;
/*!40000 ALTER TABLE `sleep` DISABLE KEYS */;
INSERT INTO `sleep` VALUES ('23:00:00','07:00:00','08:00:00','2023-04-17',1),('22:30:00','06:30:00','08:00:00','2023-04-18',2),('00:30:00','08:30:00','08:00:00','2023-04-19',3),('01:00:00','09:00:00','08:00:00','2023-04-20',4),('22:00:00','06:00:00','08:00:00','2023-04-21',5),('23:30:00','07:30:00','08:00:00','2023-04-22',6),('00:00:00','08:00:00','08:00:00','2023-04-23',7),('22:00:00','05:00:00','07:00:00','2023-04-24',8),('23:30:00','06:30:00','07:00:00','2023-04-25',9),('00:30:00','08:30:00','08:00:00','2023-04-26',10),('01:00:00','09:00:00','08:00:00','2023-04-27',11),('22:00:00','06:00:00','08:00:00','2023-04-28',12),('23:30:00','07:30:00','08:00:00','2023-04-29',13),('00:00:00','08:00:00','08:00:00','2023-04-30',14),('22:00:00','05:00:00','07:00:00','2023-05-01',15);
/*!40000 ALTER TABLE `sleep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer` (
  `trainer_id` int NOT NULL AUTO_INCREMENT,
  `trainer_name` varchar(100) NOT NULL,
  `certification` varchar(100) NOT NULL,
  `speciality` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip` int NOT NULL,
  `phone_no` int NOT NULL,
  `working_hours` int DEFAULT NULL,
  `gym_id` int NOT NULL,
  PRIMARY KEY (`trainer_id`),
  KEY `gym_id_fkk` (`gym_id`),
  CONSTRAINT `gym_id_fkk` FOREIGN KEY (`gym_id`) REFERENCES `gym` (`gym_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES (1,'Saurav Krishna','ACE','Weight Loss','New York',10001,5551234,3,1),(2,'Emily Sanderson','NASM','Strength Training','Los Angeles',90001,5555678,4,2),(3,'Michael Roberts','ISSA','Bodybuilding','Chicago',60601,5551111,5,3),(4,'Joyce Kim','ACSM','Yoga','San Francisco',94102,5552222,6,4),(5,'David Henri','NSCA','Cardiovascular Fitness','Seattle',98101,5553333,2,5),(6,'Jennifer Mary','AFPA','Functional Training','Houston',77001,5554444,8,1),(7,'Daniel Yan','ACE','Flexibility','Boston',2108,5555555,9,2),(8,'Michelle Grant','NASM','Pilates','Miami',33101,5556666,10,3),(9,'Andrew Malone','ISSA','Sports Performance','Denver',80202,5557777,5,4),(10,'Jessica Kolbe','ACSM','Bootcamp','Washington D.C.',20001,5558888,2,5),(11,'Phil Dunphy','ACE','Weight Loss','New York',10001,5551235,3,1);
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_trainer_count` BEFORE INSERT ON `trainer` FOR EACH ROW begin
update gym set trainer_count = trainer_count + 1 where gym_id = NEW.gym_id;
end */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_trainer_count` AFTER DELETE ON `trainer` FOR EACH ROW begin
update gym set trainer_count = trainer_count - 1 where gym_id = old.gym_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip` int NOT NULL,
  `phone_no` int NOT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_id` (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'John Smith','123 Main St','New York',10001,5551234,'john.smith@example.com',35),(2,'Mary Johnson','456 Maple Ave','Los Angeles',90001,5554321,'mary.johnson@example.com',28),(3,'David Lee','789 Oak St','Chicago',60601,5555678,'david.lee@example.com',42),(4,'Sarah Brown','246 Pine St','San Francisco',94101,5558765,'sarah.brown@example.com',23),(5,'Mike Davis','369 Elm St','Houston',77001,5559876,'mike.davis@example.com',29),(6,'Amy Garcia','258 Cedar St','Dallas',75201,5557654,'amy.garcia@example.com',33),(7,'Tom Wilson','147 Birch St','Miami',33101,5552345,'tom.wilson@example.com',27),(8,'Jenny Kim','369 Pine St','Seattle',98101,5553412,'jenny.kim@example.com',31),(9,'Chris Johnson','258 Oak St','Austin',73301,5556789,'chris.johnson@example.com',38),(10,'Emily Lee','123 Maple Ave','Boston',2101,5559876,'emily.lee@example.com',24),(11,'Daniel Davis','456 Elm St','Phoenix',85001,5552345,'daniel.davis@example.com',30),(12,'Samantha Smith','789 Cedar St','Philadelphia',19101,5558765,'samantha.smith@example.com',26),(13,'Ethan Brown','369 Birch St','Atlanta',30301,5555678,'ethan.brown@example.com',34),(14,'Olivia Garcia','147 Pine St','Denver',80201,5551234,'olivia.garcia@example.com',29),(15,'William Kim','258 Cedar St','Detroit',48201,5554321,'william.kim@example.com',37),(16,'John Smith','123 Main St','Anytown',12345,5551234,'jsmith@email.com',30),(17,'Sarah Lee','456 Elm St','Anycity',54321,5555678,'sarahlee@email.com',25);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_user_count` BEFORE DELETE ON `user` FOR EACH ROW begin
update gym set users_count = users_count -1 where gym_id = (
select gym_id from user_enroll where user_id = old.user_id);

end */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_user_payment` BEFORE DELETE ON `user` FOR EACH ROW BEGIN
    -- Get the payment_id for the user being deleted
    SET @payment_id := (SELECT payment_id FROM user_enroll WHERE user_id = OLD.user_id);
    
    -- Delete the corresponding row from the payment table
    DELETE FROM payment WHERE payment_id = @payment_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_enroll`
--

DROP TABLE IF EXISTS `user_enroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_enroll` (
  `user_id` int NOT NULL,
  `gym_id` int NOT NULL,
  `payment_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`gym_id`,`payment_id`),
  KEY `gym_id_fk` (`gym_id`),
  KEY `payment_id_fk` (`payment_id`),
  CONSTRAINT `gym_id_fk` FOREIGN KEY (`gym_id`) REFERENCES `gym` (`gym_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payment_id_fk` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_enroll`
--

LOCK TABLES `user_enroll` WRITE;
/*!40000 ALTER TABLE `user_enroll` DISABLE KEYS */;
INSERT INTO `user_enroll` VALUES (5,1,7),(6,1,8),(11,1,13),(16,1,16),(1,2,3),(7,2,9),(12,2,14),(17,2,17),(2,3,4),(8,3,10),(13,3,15),(3,4,5),(9,4,11),(14,4,1),(4,5,6),(10,5,12),(15,5,2);
/*!40000 ALTER TABLE `user_enroll` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_user_count` AFTER INSERT ON `user_enroll` FOR EACH ROW begin
update gym set users_count = users_count + 1 where gym_id = new.gym_id;
set @enrollment_amount := (select amount from payment where payment_id = new.payment_id);
update gym set total_revenue = total_revenue + @enrollment_amount where gym_id = new.gym_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group` (
  `group_id` int NOT NULL,
  `trainer_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`group_id`,`trainer_id`,`user_id`),
  KEY `trainer_id_fk1` (`trainer_id`),
  KEY `user_id_fk2` (`user_id`),
  CONSTRAINT `group_id_fk` FOREIGN KEY (`group_id`) REFERENCES `group_class` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trainer_id_fk1` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`trainer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id_fk2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (1,1,1),(1,1,11),(2,2,2),(2,2,12),(3,3,3),(3,3,13),(4,4,4),(4,4,14),(5,5,5),(5,5,15),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_personal`
--

DROP TABLE IF EXISTS `user_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_personal` (
  `session_id` int NOT NULL,
  `trainer_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`session_id`,`trainer_id`,`user_id`),
  KEY `trainer_id_fk` (`trainer_id`),
  KEY `user_id_fk1` (`user_id`),
  CONSTRAINT `session_id_fk` FOREIGN KEY (`session_id`) REFERENCES `personal_training_session` (`session_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trainer_id_fk` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`trainer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id_fk1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_personal`
--

LOCK TABLES `user_personal` WRITE;
/*!40000 ALTER TABLE `user_personal` DISABLE KEYS */;
INSERT INTO `user_personal` VALUES (1,1,1),(11,1,11),(2,2,2),(12,2,12),(3,3,3),(13,3,13),(4,4,4),(14,4,14),(5,5,5),(15,5,15),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `user_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_workout`
--

DROP TABLE IF EXISTS `user_workout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_workout` (
  `user_id` int NOT NULL,
  `workout_id` int NOT NULL,
  `date` date NOT NULL,
  `duration` time NOT NULL,
  PRIMARY KEY (`user_id`,`workout_id`),
  KEY `workout_fk` (`workout_id`),
  CONSTRAINT `userworkout_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `workout_fk` FOREIGN KEY (`workout_id`) REFERENCES `workout` (`workout_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_workout`
--

LOCK TABLES `user_workout` WRITE;
/*!40000 ALTER TABLE `user_workout` DISABLE KEYS */;
INSERT INTO `user_workout` VALUES (1,1,'2023-04-17','01:00:00'),(1,2,'2023-04-18','00:45:00'),(2,1,'2023-04-16','01:30:00'),(2,3,'2023-04-17','00:30:00'),(3,2,'2023-04-18','01:00:00'),(3,4,'2023-04-15','00:45:00'),(4,1,'2023-04-16','01:15:00'),(4,3,'2023-04-18','01:00:00'),(5,2,'2023-04-17','01:30:00'),(5,4,'2023-04-18','00:45:00'),(6,1,'2023-04-15','01:00:00'),(6,3,'2023-04-16','01:15:00'),(7,2,'2023-04-18','00:30:00'),(7,4,'2023-04-18','01:30:00'),(8,1,'2023-04-17','01:00:00');
/*!40000 ALTER TABLE `user_workout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout`
--

DROP TABLE IF EXISTS `workout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout` (
  `workout_id` int NOT NULL AUTO_INCREMENT,
  `workout_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`workout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout`
--

LOCK TABLES `workout` WRITE;
/*!40000 ALTER TABLE `workout` DISABLE KEYS */;
INSERT INTO `workout` VALUES (1,'Cardio'),(2,'Strength Training'),(3,'Yoga'),(4,'Pilates'),(5,'Zumba'),(6,'HIIT'),(7,'Functional Training');
/*!40000 ALTER TABLE `workout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_exercise`
--

DROP TABLE IF EXISTS `workout_exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout_exercise` (
  `exercise_id` int NOT NULL,
  `workout_id` int NOT NULL,
  PRIMARY KEY (`exercise_id`,`workout_id`),
  KEY `workout_ex_fk` (`workout_id`),
  CONSTRAINT `execise_fk` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`exercise_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `workout_ex_fk` FOREIGN KEY (`workout_id`) REFERENCES `workout` (`workout_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_exercise`
--

LOCK TABLES `workout_exercise` WRITE;
/*!40000 ALTER TABLE `workout_exercise` DISABLE KEYS */;
INSERT INTO `workout_exercise` VALUES (1,1),(2,1),(3,1),(15,1),(16,1),(19,1),(4,2),(5,2),(6,2),(7,2),(8,2),(9,3),(10,3),(11,3),(12,4),(13,4),(14,4),(17,5),(18,5),(1,6),(20,6),(21,6),(22,7),(23,7);
/*!40000 ALTER TABLE `workout_exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'fitness_tracker'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_new_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_user`(
    IN new_user_name varchar(100),
    IN new_street varchar(100),
    IN new_city varchar(100),
    IN new_zip int,
    IN new_phone_no int,
    IN new_email_id varchar(100),
    IN new_age int,
    IN new_gym_id int,
    IN new_payment_type enum('DEBIT CARD','CREDIT CARD','CASH'),
    IN new_payment_date date,
    IN new_amount int
)
BEGIN
    -- Insert new user into user table
    INSERT INTO user(user_name, street, city, zip, phone_no, email_id, age)
    VALUES (new_user_name, new_street, new_city, new_zip, new_phone_no, new_email_id, new_age);
    
    -- Get the user_id of the newly inserted user
    SET @new_user_id := LAST_INSERT_ID();
    
    -- Insert new payment into payment table
    INSERT INTO payment(payment_type, payment_date, amount)
    VALUES (new_payment_type, new_payment_date, new_amount);
    
    -- Get the payment_id of the newly inserted payment
    SET @new_payment_id := LAST_INSERT_ID();
    
    -- Insert new user enrollment into user_enroll table
    INSERT INTO user_enroll(user_id, gym_id, payment_id)
    VALUES (@new_user_id, new_gym_id, @new_payment_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_trainer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_trainer`(
    IN p_trainer_name VARCHAR(100),
    IN p_certification VARCHAR(100),
    IN p_speciality VARCHAR(100),
    IN p_city VARCHAR(100),
    IN p_zip INT,
    IN p_phone_no INT,
    IN p_working_hours INT,
    IN p_gym_id INT
)
BEGIN
    INSERT INTO trainer (trainer_name, certification, speciality, city, zip, phone_no, working_hours, gym_id)
    VALUES (p_trainer_name, p_certification, p_speciality, p_city, p_zip, p_phone_no, p_working_hours, p_gym_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculate_bmi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculate_bmi`(user_id_p int)
begin
declare u_id int;
select user_id into u_id from user where user_id = user_id_p;
if u_id is null then
    SIGNAL SQLSTATE  '45000'  SET MESSAGE_TEXT = 'Please enter a valid user_id';
else
select height, weight, weight / (height/100 * height/100) as bmi , 
 CASE
    WHEN (weight / (height/100 * height/100)) < 18.5 THEN 'Underweight'
    WHEN (weight / (height/100 * height/100)) >= 18.5 AND (weight / (height/100 * height/100)) <= 24.9 THEN 'Normal'
    WHEN (weight / (height/100 * height/100)) > 24.9 THEN 'Overweight'
end as bmi_category
from bmi 
where user_id = user_id_p;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_reward` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_reward`(user_id_p int)
begin
declare u_id int;
select user_id into u_id from user where user_id = user_id_p;
if u_id is null then
    SIGNAL SQLSTATE  '45000'  SET MESSAGE_TEXT = 'Please enter a valid user_id';
else
select u.user_name, r.*
from user u join reward_allotment ra
on u.user_id = ra.user_id
join reward r 
on r.reward_id = ra.reward_id
where u.user_id = user_id_p;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_sleep_duration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_sleep_duration`(IN user_id_p INT)
BEGIN
declare u_id int;
select user_id into u_id from user where user_id = user_id_p;
if u_id is null then
    SIGNAL SQLSTATE  '45000'  SET MESSAGE_TEXT = 'Please enter a valid user_id';
else
    SELECT   duration,
        CASE 
            WHEN duration>= '07:00:00' THEN 'sufficient'
            WHEN duration < '07:00:00' THEN 'not sufficient'
        END AS sleep_duration
    FROM sleep
    WHERE user_id = user_id_p;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_trainer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_trainer`(trainer_id_p int)
begin
declare t_id int;
select trainer_id into t_id from trainer where trainer_id = trainer_id_p;
if t_id is null then
SIGNAL SQLSTATE  '45000'  SET MESSAGE_TEXT = 'The given trainer does not exist';
else
delete from trainer where trainer_id = trainer_id_p;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_user_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user_details`(user_id_p int)
begin
declare u_id int;
select user_id into u_id from user where user_id = user_id_p;
if u_id is null then
    SIGNAL SQLSTATE  '45000'  SET MESSAGE_TEXT = 'Please enter a valid user_id';
else
delete from user where user_id = user_id_p;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `exercise_workout_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `exercise_workout_type`(IN workout_type_p varchar(100))
BEGIN 
declare w_name varchar(100);
select workout_type into w_name from workout where workout_type = workout_type_p;
if w_name is null then
SIGNAL SQLSTATE  '45000'  SET MESSAGE_TEXT = 'Please enter a valid workout type';
else
SELECT e.exercise_id, e.exercise_type, e.description 
FROM workout_exercise we 
JOIN exercise e ON we.exercise_id = e.exercise_id 
JOIN workout w ON we.workout_id = w.workout_id 
WHERE w.workout_type = workout_type_p;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `group_session_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `group_session_details`(group_id_p int)
begin 
declare g_id varchar(100);
select group_id into g_id from group_class where group_id = group_id_p;
if g_id is null then
SIGNAL SQLSTATE  '45000'  SET MESSAGE_TEXT = 'Please enter a valid group id';
else
select  t.trainer_name,u.user_id, u.user_name 
from trainer t join user_group ug
on t.trainer_id = ug.trainer_id
join user u on
u.user_id = ug.user_id 
where ug.group_id = group_id_p;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `gym_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `gym_details`()
begin
select * from gym;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `gym_trainer_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `gym_trainer_count`(gym_id_p int)
begin
declare gy_id int;
select gym_id into gy_id from gym where gym_id = gym_id_p;
if gy_id is null then
SIGNAL SQLSTATE  '45000'  SET MESSAGE_TEXT = 'Please enter a valid gym id';
else
select g.gym_name,count(t.trainer_id) as number_of_trainers
from gym g join trainer t 
on g.gym_id = t.gym_id
where g.gym_id = gym_id_p
group by g.gym_name;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `gym_trainer_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `gym_trainer_details`(gym_id_p int)
begin
declare gy_id int;
select gym_id into gy_id from gym where gym_id = gym_id_p;
if gy_id is null then
SIGNAL SQLSTATE  '45000'  SET MESSAGE_TEXT = 'Please enter a valid gym id';
else
select g.gym_name,t.trainer_name
from gym g join trainer t
on g.gym_id = t.gym_id
where g.gym_id = gym_id_p;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `gym_user_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `gym_user_count`(gym_id_p int)
begin
declare gy_id int;
select gym_id into gy_id from gym where gym_id = gym_id_p;
if gy_id is null then
SIGNAL SQLSTATE  '45000'  SET MESSAGE_TEXT = 'Please enter a valid gym id';
else
select g.gym_name, count(ue.user_id) as number_of_users
from gym g join user_enroll ue
on g.gym_id = ue.gym_id
where g.gym_id = gym_id_p
group by g.gym_name;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `payment_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `payment_details`(user_id_p int)
begin
declare u_id int;
select user_id into u_id from user where user_id = user_id_p;
if u_id is null then
    SIGNAL SQLSTATE  '45000'  SET MESSAGE_TEXT = 'Please enter a valid user_id';
else
select u.user_id,u.user_name,g.gym_name,p.* 
from user u join user_enroll ue
on u.user_id=ue.user_id
join gym g 
on g.gym_id = ue.gym_id
join payment p
on p.payment_id = ue.payment_id
where u.user_id = user_id_p;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_group_session` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_group_session`(user_id_p int,group_id_p int, trainer_id_p int)
begin
insert into user_group(group_id, trainer_id, user_id) values(user_id_p,group_id_p,trainer_id_p);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `trainer_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `trainer_details`()
begin
select t.*, gym_name from trainer t
join gym g on t.gym_id = g.gym_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `trainer_group_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `trainer_group_details`(trainer_id_p int)
begin
declare t_id int;
select trainer_id into t_id from trainer where trainer_id = trainer_id_p;
if t_id is null then
SIGNAL SQLSTATE  '45000'  SET MESSAGE_TEXT = 'Please enter a valid trainer id';
else
select t.trainer_name, ug.group_id
from trainer t join user_group ug
on t.trainer_id = ug.trainer_id
where t.trainer_id = trainer_id_p
group by t.trainer_name, ug.group_id;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `trainer_personal_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `trainer_personal_details`(trainer_id_p int)
begin
declare t_id int;
select trainer_id into t_id from trainer where trainer_id = trainer_id_p;
if t_id is null then
SIGNAL SQLSTATE  '45000'  SET MESSAGE_TEXT = 'Please enter a valid trainer id';
else
select t.trainer_name, up.session_id
from trainer t join user_personal up
on t.trainer_id = up.trainer_id
where t.trainer_id = trainer_id_p;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user_bmi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user_bmi`(user_id_p int,height_p int,weight_p int,date_p date)
begin
update bmi
set height = height_p, 
weight = weight_p,
date = date_p
where user_id = user_id_p ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user_nutrition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user_nutrition`(user_id_p int,serving_size_p int, calories_p int, nutrition_p varchar(100), allergens_p varchar(100),date_p date)
begin
declare u_id int;
select user_id into u_id from user where user_id = user_id_p;
if u_id is null then
    SIGNAL SQLSTATE  '45000'  SET MESSAGE_TEXT = 'Please enter a valid user_id';
else
update nutrition
set serving_size = serving_size_p,
calories = calories_p,
nutrition = nutrition_p,
allergens = allergens_p
where user_id = user_id_p;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user_sleep` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user_sleep`(user_id_p int, start_time_p time, end_time_p time, duration_p time,date_p date)
begin
update sleep
set start_time = start_time_p,
end_time = end_time_p,
duration = duration_p,
date = date_p
where user_id = user_id_p;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_details`(user_id_p int)
begin
declare u_id int;
select user_id into u_id from user where user_id = user_id_p;
if u_id is null then
    SIGNAL SQLSTATE  '45000'  SET MESSAGE_TEXT = 'Please enter a valid user_id';
else
select u.*, g.gym_name,t.trainer_name,up.session_id,ug.group_id  
from user as u left join user_enroll as ue 
on u.user_id = ue.user_id 
join gym g on 
g.gym_id = ue.gym_id
join user_group ug on
u.user_id = ug.user_id
join user_personal up on
u.user_id = up.user_id
join trainer t on 
t.trainer_id = up.trainer_id
where u.user_id = user_id_p;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_gym_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_gym_details`(gym_id_p int)
begin
declare gy_id int;
select gym_id into gy_id from gym where gym_id = gym_id_p;
if gy_id is null then
SIGNAL SQLSTATE  '45000'  SET MESSAGE_TEXT = 'Please enter a valid gym id';
else
select g.gym_name,u.user_name
from gym g join user_enroll ue
on ue.gym_id = g.gym_id
join user u
on ue.user_id= u.user_id
where g.gym_id = gym_id_p;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_nutrition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_nutrition`(user_id_p int)
begin
declare u_id int;
select user_id into u_id from user where user_id = user_id_p;
if u_id is null then
    SIGNAL SQLSTATE  '45000'  SET MESSAGE_TEXT = 'Please enter a valid user_id';
else
select * from nutrition 
where user_id = user_id_p;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_trainer_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_trainer_details`(trainer_id_p int)
begin
declare t_id int;
select trainer_id into t_id from trainer where trainer_id = trainer_id_p;
if t_id is null then
SIGNAL SQLSTATE  '45000'  SET MESSAGE_TEXT = 'Please enter a valid trainer id';
else
select t.trainer_name, u.user_name
from trainer t join user_personal up
on t.trainer_id = up.trainer_id
join user_group ug
on t.trainer_id = ug.trainer_id
join user u
on ug.user_id= u.user_id or up.user_id = u.user_id
where t.trainer_id = trainer_id_p
GROUP BY t.trainer_name, u.user_name;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-21 23:49:07

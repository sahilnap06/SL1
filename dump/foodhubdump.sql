-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: foodhub
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(15) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'SNACKS'),(2,'STARTERS'),(3,'MAIN COURSE'),(4,'DESSERTS'),(5,'chinese');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `cust_order`
--

DROP TABLE IF EXISTS `cust_order`;
/*!50001 DROP VIEW IF EXISTS `cust_order`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `cust_order` AS SELECT 
 1 AS `Order ID`,
 1 AS `Name of the customer`,
 1 AS `Total Cost`,
 1 AS `Mobile number`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(30) NOT NULL,
  `mob_no` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Pavan','4567893120'),(2,'Yash','2267893120'),(3,'Komal','6786721948'),(4,'Pranav','8408888123');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_item`
--

DROP TABLE IF EXISTS `food_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_item` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(30) NOT NULL,
  `cost` int(11) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `food_item_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_item`
--

LOCK TABLES `food_item` WRITE;
/*!40000 ALTER TABLE `food_item` DISABLE KEYS */;
INSERT INTO `food_item` VALUES (1,'Masala papad',40,2),(2,'Maggi',50,1),(3,'Paneer sandwich',50,1),(4,'Burger',40,1),(5,'Veg lollipop',90,1),(6,'Veg 65',60,1),(7,'Paneer Chingara',150,3),(8,'Chicken masala',170,3),(9,'Chicken Biryani',150,3),(10,'manchurian',90,5),(11,'hakka noodles',110,5),(12,'chicken fried rice',130,5);
/*!40000 ALTER TABLE `food_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_summary`
--

DROP TABLE IF EXISTS `order_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_summary` (
  `order_id` int(11) NOT NULL,
  `total_cost` int(11) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_summary`
--

LOCK TABLES `order_summary` WRITE;
/*!40000 ALTER TABLE `order_summary` DISABLE KEYS */;
INSERT INTO `order_summary` VALUES (1,80),(2,450),(3,610),(4,570),(5,570),(6,620),(7,80);
/*!40000 ALTER TABLE `order_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `date_of_order` date DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `cost_per_item` int(11) DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `city` varchar(30) DEFAULT 'pune',
  PRIMARY KEY (`order_id`,`cust_id`,`item_id`),
  KEY `cust_id` (`cust_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `food_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,'2019-07-08',2,40,80,'pune'),(2,1,9,'2019-07-15',3,150,450,'pune'),(3,2,4,'2019-07-18',4,40,160,'pune'),(3,2,5,'2019-07-18',5,90,450,'pune'),(4,3,1,'2019-07-18',3,40,120,'pune'),(4,3,7,'2019-07-18',3,150,450,'pune'),(5,4,6,'2019-07-18',1,60,60,'pune'),(5,4,10,'2019-07-18',2,90,180,'pune'),(5,4,12,'2019-07-18',3,110,330,'pune'),(6,1,10,'2019-07-18',4,90,360,'pune'),(6,1,12,'2019-07-18',2,130,260,'pune'),(7,4,4,'2019-08-01',2,40,80,'pune'),(8,2,9,'2019-08-26',3,150,450,'pune');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tc before insert on orders
for each row
set new.total_cost = new.quantity * new.cost_per_item */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `cust_order`
--

/*!50001 DROP VIEW IF EXISTS `cust_order`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cust_order` AS select `o`.`order_id` AS `Order ID`,`c`.`cust_name` AS `Name of the customer`,sum(`o`.`total_cost`) AS `Total Cost`,`c`.`mob_no` AS `Mobile number` from (`customer` `c` join `orders` `o` on((`c`.`cust_id` = `o`.`cust_id`))) group by `o`.`order_id`,`c`.`cust_name`,`c`.`mob_no` order by `o`.`order_id` */;
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

-- Dump completed on 2019-09-21 10:24:58

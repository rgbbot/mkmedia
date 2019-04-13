-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: mkmedia
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'India'),(2,'Russia'),(3,'Ukraine'),(4,'Belarus'),(5,'Africa'),(7,'Bangladesh'),(8,'Latin America'),(9,'MENA'),(10,'Germany'),(11,'USA'),(12,'Canada'),(13,'CIS'),(14,'Nigeria'),(15,'Italy'),(16,'Spain'),(17,'UK'),(18,'Armenia'),(19,'Azerbaijan'),(20,'Kyrgyzstan'),(21,'Moldova'),(22,'China'),(23,'Taiwan'),(24,'Iraq'),(25,'Oman'),(26,'Denmark'),(27,'Israel'),(28,'Slovenia'),(29,'Serbia'),(30,'Macedonia'),(31,'Estonia'),(32,'Argentina'),(33,'Poland'),(34,'Bahrain'),(35,'Cyprus'),(36,'Egypt'),(37,'Sudan'),(38,'Palestine'),(39,'Saudi Arabia'),(40,'Algeria'),(41,'United Arab Emirates'),(42,'Yemen'),(43,'Tunis'),(44,'Malaysia'),(45,'Netherlands'),(46,'Philippines'),(47,'Portugal'),(48,'Australia'),(49,'Norway'),(50,'Kuwait'),(51,'Morocco'),(52,'Sweden'),(53,'France'),(54,'Cambodia'),(55,'Laos'),(56,'Singapore'),(57,'Thailand'),(58,'Czech'),(59,'Bosnia and Herzegovina'),(60,'Angola'),(61,'Mosambique'),(62,'Austria'),(63,'Switzerland'),(64,'Liechtenstein'),(65,'Peru'),(66,'Mexico'),(67,'Brazil'),(68,'North America'),(69,'Greece'),(70,'Asia'),(71,'Oceania'),(72,'South Europe'),(73,'North Europe'),(74,'Iran'),(75,'Kazakhstan'),(76,'Pakistan'),(77,'Lithuania');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audience`
--

DROP TABLE IF EXISTS `audience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `audience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audience_age` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audience`
--

LOCK TABLES `audience` WRITE;
/*!40000 ALTER TABLE `audience` DISABLE KEYS */;
INSERT INTO `audience` VALUES (1,'0'),(2,'4'),(3,'6'),(4,'12');
/*!40000 ALTER TABLE `audience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_name` varchar(100) NOT NULL,
  `episodes_count` int(11) DEFAULT NULL,
  `episodes_duration` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `audience_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `content_description` varchar(1000) NOT NULL,
  `format` enum('SD','HD','FULL_HD','ULTRA_HD') DEFAULT NULL,
  `is_deleted` int(11) DEFAULT '0',
  `video_link` varchar(500) DEFAULT NULL,
  `picture_link` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genres_id_fk_idx` (`genre_id`),
  KEY `audience_id_fk_idx` (`audience_id`),
  CONSTRAINT `audience_id_fk` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `genres_id_fk` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,'AnyDayHoliday',26,7,2015,1,7,'Magic New Year’s trip to the most exotic and picturesque corners of our planet; Shocking, unbelievable and amazing Christmas traditions from around the world; Stylish and colorful author animation painted entirely by hand with watercolors; interesting and cognitive information packaged in an accessible and humorous way; Five unique charismatic characters that will impress both adults and children;','HD',0,'https://vimeo.com/145246218','http://www.mkmediagroup.tv/wp-content/uploads/2017/02/Any-Day-Holyday-upd-uai-516x344.jpg'),(2,'Cult Collection',50,3,2017,4,1,'Сult Collections is educative program about cars and armored vehicles. Have you ever thought that a really good car is like a beautiful woman? For example, a Cabriolet somehow reminds of the majesty and pride of Marlene Dietrich? And the delicate lines of a Jaguar of the 1961 model, the so-called Jaguar_E, are in some way similar to the lightness and eccentricity of Audrey Hepburn? The project &quot;Cult Collections&quot; is a fusion of visual and technical pleasures. The project will tell about two directions, the first concerns well-known classic cars, and the second is devoted to military armored vehicles. We will show the elaborate works, where every detail of a real car is accurately recreated in a minute handmade model. It is worth emphasizing that each model exists only in a single copy. Due to macro-shooting, Cult Collections displays to the audience all the secrets and details of the models that have become cultic.','FULL_HD',0,'https://vimeo.com/211279406','http://www.mkmediagroup.tv/wp-content/uploads/2017/04/Cult_Collections-upd-1-uai-516x344.jpg'),(3,'Cool Look',345,12,2016,4,1,'Covering all the Health & Beauty routine - from hairstyles to workout sessions; Range of new hair ideas, everyday and evening makeup looks, easy-done manicure; 10-minute workout sessions to do at home; Must-watch for anybody who wants to take care of own health and beauty; Possibility of using as a rubric or as a full program; Dynamic shooting and nice music accompaniment','HD',0,NULL,NULL),(4,'DIY',100,3,2015,3,8,'Even the most complicated handmade products at first sight can be made in an easy and simple creative ideas for holiday and everyday gifts Creation of really bright and stylish products with the help of any means available Colorful, rich video footages combined with excellent music accompaniment Video with diversely beautiful hand-drawn graphics Possibility of using as a rubric or as a full program','SD',0,'https://vimeo.com/124603523','http://www.mkmediagroup.tv/wp-content/uploads/2017/10/Diy-upd-uai-516x344.jpg'),(5,'Driving Crashes',13,26,2015,4,3,'Driving crashes - this is an entertaining and educational program about various types of accidents and methods, as well as recommendations to avoid them. The program consists of frames inside car that capture collisions between vehicles as well collage animation. This program will be interesting for both beginners and motorists with experience','SD',0,NULL,NULL),(6,'Fun Food',100,3,2012,1,4,'Cooking is such an exciting process! In order to make it fun and entertaining we offer recipes that include everyday ideas and some for special occasions and holidays. A cheerful atmosphere in FunFood contributes to the feeling when you want to get to know the recipe and bring it into life. FunFood combines both simple recipes and made with gourmet foods, which, by the way, can be easily replaced by ingredients that are more accessible.','HD',0,'https://vimeo.com/144464472','http://www.mkmediagroup.tv/wp-content/uploads/2017/10/Fun-Food-upd.jpg'),(7,'Happy Sweets',100,3,2018,1,5,'Happy Sweets is a real gold mine for a person with a sweet tooth, as sweets improve the mood and make us a little happier. We propose to enjoy both the taste and the very process of cooking... say, a delicate lemon cake for tea or classic chocolate brownies. Delight your audience with simple and inspiring recipes for delicious desserts, pastries and sweets. All dishes are prepared with love and a smile in an atmosphere of family comfort.','FULL_HD',0,'https://vimeo.com/266644084','http://www.mkmediagroup.tv/wp-content/uploads/2018/04/Happy-Sweets-1-uai-516x344.jpg'),(8,'LunchBox',140,7,2018,1,4,'Simple and beautiful ideas about how to make your lunchbox so colorful and tasty.','HD',0,NULL,NULL),(10,'Materials for life',26,7,2017,4,2,'\"Materials for life\" entertainment and educational TV program, the main the idea of ​​which is to help viewers understand all the subtleties of modern coexistence human and various materials. The cycle \"Materials for life\" reopens the familiar things that we use every day - glass, rubber, plastic, paper and others.','FULL_HD',0,'https://vimeo.com/237046181','http://www.mkmediagroup.tv/wp-content/uploads/2017/03/Materials-upd-1-1-uai-516x344.jpg'),(11,'Mouse Science',13,11,2017,2,6,'«Mouse Science» will take young viewers to the fictional science lab where our main characters live and work. They are funny laboratory mouse puppets: cheerful and overly enthusiastic nerdy professor  Quiz and his reckless, a little crazy lab assistant Chasy. In all episodes the mouse puppets are helped by their loyal friend and ally – a real live dog and part-time engineer Hertz.','FULL_HD',0,'https://vimeo.com/200821525','http://www.mkmediagroup.tv/wp-content/uploads/2017/02/Mouse-science-upd-n-1-uai-516x344.jpg'),(12,'Science Crew',33,10,2015,4,3,'The new animated series for children about the fun adventures of mismatched and tireless team of scientists: the wise toad-professor LeGoosh, his faithful assistant, a white rat named Ratschtein and a small apprentice crow, the naughty Crowny, who is the main cause and initiator of many of their troubles...Constant «conflicts» of interests for our heroes mix a serious scientific process with a lot of funny and curious moments, providing all the features for a fascinating children’s game, and making the results unpredictable and touching.','HD',0,NULL,NULL),(13,'Simple and Delicious',101,3,2017,1,5,'“Simple and Delicious” is a cooking program high quality video episodes of the best recipes for easy cooking of delicious meals. Viewers will have access to a wide range of unique recipes of various world cuisines with clear visual instructions.','ULTRA_HD',0,NULL,NULL),(14,'TasTea',25,3,2018,1,5,'Tea is one of the few beverages which are here to stay in our lives. We drink tea in the morning to key up and in the evening – to relax. We get warm with a cup of hot tea in winter frost and quench the thirst with ice tea in summer heat. This divine brew has long been a part of our lives! TasTea is a course of short atmospheric video recipes of tea.','ULTRA_HD',0,NULL,NULL),(15,'Nutri Ventures',52,30,2012,2,1,'Nutri Ventures is the first animation series specially created to encourage healthy eating in kids and its success is based on its ability to engage children in the Nutri Ventures experience. Embark on this fantastic adventure and discover what makes the heroes and villains of Grand-Land so appealing.','FULL_HD',0,NULL,NULL),(16,'UnFortuity',50,3,2018,2,1,'If you have ever asked yourself «How it could be if…» you know what this documentary is about. Even our smallest decisions can affect our whole life considerably and turn the existing reality upside down. From some point of view important discoveries and inventions in the history of humanity are simple coincidences. UnFortuity propose you a chain of facts about discovery of penicillin from accidentally forgotten cup with bacteria in 1928 to great impact on well-being of humanity (for example, a 23% mortality decrease in British residents in 1944 since the mentioned date). With historic footages and drama scenes, the documentary tracks all steps that led to the important scientific breakthrough. Is it fortuity or UnFortuity? We suggest the audience to make their own conclusions.','HD',0,'https://vimeo.com/269598782','http://www.mkmediagroup.tv/wp-content/uploads/2017/02/UnFortuity-восстановлено_new_сайт111-1-uai-516x344.jpg'),(17,'Who’s There?',12,7,2018,4,1,'Who’s There consists of stories about different countries and bright, sometimes funny facts about their history. Your viewers will find out: which city is called «gateway to the Arctic»; the love story of whose king and queen is similar to the fairy tale «Cinderella»; where there is a lake, half salty, half fresh; in which country even ice cream can be with pepper; what city has a carpet that weighs 47 tons? With Who’s There You will be able to tell your audience these and much more amazing stories.','FULL_HD',0,'https://vimeo.com/226124466','http://www.mkmediagroup.tv/wp-content/uploads/2017/07/Whos_there-upd-1-uai-516x344.jpg');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_language`
--

DROP TABLE IF EXISTS `content_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `content_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `content_id_fk_idx` (`content_id`),
  KEY `languages_id_fk_idx` (`language_id`),
  CONSTRAINT `content_id_fk` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `languages_id_fk` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_language`
--

LOCK TABLES `content_language` WRITE;
/*!40000 ALTER TABLE `content_language` DISABLE KEYS */;
INSERT INTO `content_language` VALUES (1,1,2),(2,1,3),(3,2,2),(4,2,3),(5,3,3),(6,4,2),(7,4,3),(8,5,3),(9,6,3),(10,7,2),(11,7,3),(12,8,1),(13,8,2),(14,8,3),(15,10,2),(16,10,3),(17,11,3),(18,12,1),(19,12,2),(20,12,3),(21,13,1),(22,13,2),(23,13,3),(24,14,1),(25,14,2),(26,14,3),(27,15,2),(28,15,3),(29,16,3),(31,17,3);
/*!40000 ALTER TABLE `content_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_sales`
--

DROP TABLE IF EXISTS `content_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `content_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `rights` varchar(1000) NOT NULL,
  `is_exclusive` tinyint(1) NOT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `corporate_person_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `areas_id_fk_idx` (`area_id`),
  KEY `corporate_person_id_fk_idx` (`corporate_person_id`),
  CONSTRAINT `areas_id_fk` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `corporate_person_id_fk` FOREIGN KEY (`corporate_person_id`) REFERENCES `corporate_person` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_sales`
--

LOCK TABLES `content_sales` WRITE;
/*!40000 ALTER TABLE `content_sales` DISABLE KEYS */;
INSERT INTO `content_sales` VALUES (1,1,1,'Youtube',0,'2016-10-01','2017-09-30',1),(2,1,2,'PayTV, internet, OTT',0,'2016-11-15','2017-02-14',3),(3,1,3,'Placement on the site',0,'2016-09-01','2016-12-31',3),(4,1,4,'TV rights',0,'2017-01-01','2018-07-01',3),(5,1,5,'ALL (for Kurtiva)',0,'2017-06-02','2019-06-02',4),(6,1,1,'ALL (for Kurtiva)',0,'2017-06-02','2020-06-02',1),(7,1,7,'ALL (for Kurtiva)',0,'2017-06-02','2021-06-02',1),(8,1,32,'All',0,'2017-02-01','2018-01-31',2),(9,1,67,'All',0,'2017-02-01','2018-01-31',2),(10,1,11,'VOD**',0,'2018-06-25','2019-06-25',4),(11,1,12,'VOD**',0,'2018-06-25','2019-06-25',4),(12,2,10,'Cable TV',0,'2018-01-01','2019-01-01',4),(13,2,37,'Africa XP',0,'2018-02-01','2021-01-31',1),(14,2,14,'Africa XP',0,'2018-02-01','2021-01-31',1),(15,2,2,'FreeTV',0,'2018-09-15','2019-09-14',3),(16,3,9,'FreeTV',0,'2015-06-10','2018-09-25',1),(17,3,2,'PayTV',0,'2016-03-20','2017-03-19',3),(18,3,13,'PayTV',0,'2016-04-12','2017-04-13',3),(19,3,14,'Mobile',0,'2017-01-25','2018-01-25',4),(20,3,10,'Mobile',0,'2017-03-10','2018-03-09',4),(21,3,15,'Mobile',0,'2017-01-30','2018-01-30',4),(22,3,16,'Mobile',0,'2018-05-10','2019-05-10',2),(23,3,17,'Mobile',0,'2017-05-04','2018-05-05',4),(24,3,18,'AVOD, Paid VOD, Ambedd',0,'2017-01-01','2017-12-31',3),(25,3,19,'AVOD, Paid VOD, Ambedd',0,'2017-01-01','2017-12-31',3),(26,3,20,'AVOD, Paid VOD, Ambedd',0,'2017-01-01','2017-12-31',3),(27,3,21,'AVOD, Paid VOD, Ambedd',0,'2017-01-01','2017-12-31',3),(28,3,5,'ALL',0,'2017-06-02','2019-06-02',4),(29,3,1,'ALL',0,'2017-06-02','2019-06-02',1),(30,3,7,'ALL',0,'2017-06-02','2019-06-02',1),(31,3,22,'ALL',1,'2017-08-01','2020-10-31',1),(32,3,23,'ALL ',1,'2017-08-01','2020-10-31',1),(33,3,24,'Mobile (for MidSense)',0,'2017-10-01','2018-10-01',1),(34,3,25,'Mobile (for MidSense)',0,'2017-10-01','2018-10-01',1),(35,3,51,'Mobile (for MidSense)',0,'2017-10-01','2018-10-01',4),(36,4,26,'PayTV',0,'2017-01-01','2018-01-31',4),(37,4,9,'FreeTV',0,'2015-04-20','2018-04-20',4),(38,4,27,'PAYTV, VOD/SVOD, IPTV/OTT',0,'2015-06-17','2018-06-17',1),(39,4,28,'Free terrestrial TV, Basic cable, Satellite',0,'2016-01-15','2020-01-14',4),(40,4,29,'Free terrestrial TV, Basic cable, Satellite',0,'2016-01-15','2020-01-14',4),(41,4,30,'Free terrestrial TV, Basic cable, Satellite',0,'2016-01-15','2020-01-14',4),(42,4,59,'Free terrestrial TV, Basic cable, Satellite',0,'2016-01-15','2020-01-14',4),(43,4,3,'LMDS, MVDS, PPV, VOD, nVOD',0,'2015-10-07','2016-10-06',3),(44,4,2,'PayTV',0,'2015-12-01','2018-11-30',3),(45,4,13,'PayTV',0,'2015-12-01','2018-11-30',3),(46,4,31,'Free TV',0,'2016-09-01','2018-08-20',3),(47,4,14,'Mobile rights',0,'2016-06-01','2017-06-01',4),(48,4,32,'SVOD + translate/dub/subtitle',0,'2016-06-07','2017-06-07',2),(49,4,74,'IPTV, VOD, SVOD&TVOD, FREE TV',1,'2017-07-10','2022-07-10',1),(50,4,5,'ALL (for Kurtiva)',0,'2017-06-02','2019-06-02',4),(51,4,33,'Mobile rights',0,'2018-04-27','2019-04-27',4),(52,5,2,'ALL',1,'2017-09-14','2020-09-14',3),(53,5,3,'ALL',1,'2017-09-14','2020-09-14',3),(54,5,33,'ALL',1,'2017-09-14','2020-09-14',4),(55,6,24,'Free Terrestrial Television,  Basic Cable Television,\n  Pay Satellite Television, Internet digital, Pay Per View',1,'2014-01-10','2017-01-10',1),(56,6,25,'Free Terrestrial Television,  Basic Cable Television,\n  Pay Satellite Television, Internet digital, Pay Per View',1,'2014-01-10','2017-01-10',1),(57,6,35,'Free Terrestrial Television,  Basic Cable Television,\n  Pay Satellite Television, Internet digital, Pay Per View',1,'2014-01-10','2017-01-10',1),(58,6,36,'Free Terrestrial Television,  Basic Cable Television,\n  Pay Satellite Television, Internet digital, Pay Per View',1,'2014-01-10','2017-01-10',1),(59,6,37,'Free Terrestrial Television,  Basic Cable Television,\n  Pay Satellite Television, Internet digital, Pay Per View',1,'2014-01-10','2017-01-10',1),(60,6,38,'Free Terrestrial Television,  Basic Cable Television,\n  Pay Satellite Television, Internet digital, Pay Per View',1,'2014-01-10','2017-01-10',1),(61,6,39,'Free Terrestrial Television,  Basic Cable Television,\n  Pay Satellite Television, Internet digital, Pay Per View',1,'2014-01-10','2017-01-10',1),(62,6,41,'Free Terrestrial Television,  Basic Cable Television,\n  Pay Satellite Television, Internet digital, Pay Per View',1,'2014-01-10','2017-01-10',1),(63,6,42,'Free Terrestrial Television,  Basic Cable Television,\n  Pay Satellite Television, Internet digital, Pay Per View',1,'2014-01-10','2017-01-10',1),(64,6,51,'Free Terrestrial Television,  Basic Cable Television,\n  Pay Satellite Television, Internet digital, Pay Per View',1,'2014-01-10','2017-01-10',1),(65,6,44,'Per View, VOD, SVOD, NVOD',0,'2015-01-12','2017-01-12',1),(66,6,16,'Mobile, Web TV',0,'2017-05-22','2017-05-22',2),(67,6,63,'Mobile, Web TV',1,'2015-05-22','2016-05-22',4),(68,6,10,'Cable TV',0,'2015-07-01','2016-12-31',4),(69,6,62,'Mobile, Web TV',0,'2015-05-22','2016-05-22',4),(70,6,33,'Mobile, Web TV',0,'2015-06-17','2016-06-17',4),(71,6,20,'FreeTV and web on site',1,'2014-08-15','2018-08-14',3),(72,6,46,'Pay-TV, VOD,mobile,linear',0,'2015-05-01','2018-05-01',1),(73,6,47,'Mobile, Web TV',0,'2016-09-22','2017-09-22',4),(74,6,48,'Mobile, Web TV',0,'2016-11-29','2017-11-29',4),(75,6,15,'Mobile, Web TV',0,'2016-12-22','2017-12-22',4),(76,6,26,'SVOD + translate/dub/subtitle ',0,'2017-01-31','2018-01-31',4),(77,6,3,'SVOD + translate/dub/subtitle',0,'2016-06-07','2017-06-07',2),(78,6,49,'In-Flight',0,'2017-01-01','2017-04-30',4),(79,6,7,'ALL (for Kurtiva)',1,'2017-06-02','2017-06-02',1),(80,7,29,'The Free Terrestrial TV, Basic Cable, Satellite TV',0,'2019-09-01','2023-09-01',4),(81,7,63,'Mobile',0,'2018-12-01','2019-12-01',4),(82,8,9,'Free Terrestrial Television',0,'2017-08-01','2020-08-01',1),(83,8,24,'Mobile (for MidSense)',1,'2017-10-01','2018-10-01',1),(84,8,39,'Mobile (for MidSense)',0,'2017-10-01','2018-10-01',1),(85,8,25,'Mobile (for MidSense)',1,'2017-10-01','2018-10-01',1),(86,6,51,'Mobile (for MidSense)',0,'2017-10-01','2018-10-01',1),(87,8,76,'Mobile, OTT',0,'2017-12-04','2019-12-03',1),(88,8,29,'The Free Terrestrial TV, Basic Cable, Satellite TV ',1,'2019-09-01','2023-09-01',4),(89,10,52,'Non-Theatrical',1,'2017-11-01','2022-10-31',4),(90,10,2,'PayTV',0,'2018-03-01','2020-02-28',3),(91,10,3,'Free TV',0,'2018-05-01','2019-04-30',3),(92,10,29,'The Free Terrestrial TV, Basic Cable, Satellite TV',0,'2019-09-01','2023-09-01',4),(93,10,52,'Non-Theatrical',1,'2018-09-01','2023-09-01',4),(94,10,53,'All rights for distribution',1,'2018-09-01','2018-12-31',2),(95,11,77,'VOD, Internet',0,'2017-04-25','2017-07-31',3),(96,11,11,'VOD all',1,'2017-07-01','2020-12-31',4),(97,11,12,'VOD all',1,'2017-07-01','2020-12-31',4),(98,11,54,'Non-Standard Television',1,'2017-12-01','2018-11-30',1),(99,11,22,'Non-Standard Television',1,'2017-12-01','2018-11-30',1),(100,11,23,'Non-Standard Television',1,'2017-12-01','2018-11-30',1),(101,11,44,'Non-Standard Television',1,'2017-12-01','2018-11-30',1),(102,11,47,'S-VOD',0,'2018-03-12','2019-03-11',2),(103,11,16,'S-VOD',0,'2018-03-12','2019-03-11',2),(104,11,58,'Free TV',1,'2018-03-01','2021-02-28',4),(105,11,9,'ALL TV and Digital',1,'2018-09-01','2023-08-31',1),(106,11,2,'PayTV',0,'2018-09-01','2020-08-31',3),(107,11,21,'PayTV',0,'2018-09-01','2020-08-31',3),(108,11,13,'FreeTV',0,'2018-08-10','2019-08-09',4),(109,12,59,'Free cable TV, Terrestrial free TV, IPTV',0,'2015-02-01','2015-11-01',4),(110,12,39,'Mobile(Wap push)',1,'2014-12-01','2015-12-01',1),(111,12,76,'Mobile(Wap push)',1,'2014-12-01','2015-12-01',1),(112,12,14,'Mobile',1,'2015-04-27','2017-04-27',1),(113,12,9,'Free Terrestrial Television, Pay Satellite Television,\n   Video On Demand, Internet digital',0,'2015-05-11','2019-05-11',1),(114,13,62,'VOD, Internet',0,'2017-08-01','2019-08-31',4),(115,13,10,'VOD, Internet',0,'2017-08-01','2019-08-31',4),(116,13,63,'VOD, Internet',0,'2017-08-01','2019-08-31',4),(117,13,64,'VOD, Internet',0,'2017-08-01','2019-08-31',4),(118,13,9,'Free Terrestrial Television',0,'2018-07-18','2021-07-18',1),(119,14,2,'PayTV',0,'2017-06-01','2019-05-31',3),(120,14,9,'Free Terrestrial Television',0,'2017-06-01','2020-06-01',1),(121,14,4,'Free TV',0,'2017-12-04','2018-12-03',4),(122,14,3,'PayTV',0,'2018-07-17','2019-07-16',3),(123,14,29,'The Free Terrestrial TV, Basic Cable, Satellite TV ',0,'2019-09-01','2023-09-01',4),(124,14,2,'PayTV',0,'2017-06-01','2019-05-31',3),(125,14,9,'Free Terrestrial Television',0,'2017-06-01','2020-06-01',1),(126,14,4,'Free TV',0,'2017-12-04','2018-12-03',4),(127,14,3,'PayTV',0,'2018-07-17','2019-07-16',3),(128,14,29,'The Free Terrestrial TV, Basic Cable, Satellite TV ',0,'2019-09-01','2023-09-01',4),(129,14,30,'Free cable, IPTV',0,'2018-12-01','2001-11-20',4),(130,14,28,'Free cable, IPTV',0,'2018-12-01','2001-11-20',4),(131,15,45,'Mobile, Web TV',0,'2015-09-07','2016-09-07',4),(132,15,45,'Mobile, Web TV',0,'2017-03-06','2018-01-06',4),(133,15,15,'Mobile, Web TV',0,'2015-09-07','2016-09-07',4),(134,15,15,'Mobile, Web TV',0,'2017-03-06','2018-01-06',4),(135,16,11,'All',0,'2017-11-06','2018-11-06',4),(136,16,12,'All',0,'2017-11-06','2018-11-06',4),(137,16,32,'All',0,'2017-02-01','2018-01-31',2),(138,16,67,'All',0,'2017-02-01','2018-01-31',2),(139,16,66,'All',0,'2017-02-01','2018-01-31',2),(140,16,29,'The Free Terrestrial TV, Basic Cable, Satellite TV',0,'2019-09-01','2023-09-01',4),(141,16,53,'All rights for distribution (representation)',1,'2018-09-01','2018-12-31',2),(142,17,9,'FreeTV',0,'2014-12-01','2017-12-01',1),(143,17,44,'Free Television, VOD,SVOD, NVOD, FVOD, AVOD, TVOD, Mobile Devices, Airplanes',0,'2015-01-12','2012-01-17',1),(144,17,76,'Free satellite TV, WEB, mobile',1,'2015-06-15','2016-06-14',2),(145,17,16,'Mobile, Web TV',0,'2015-05-22','2016-05-22',4),(146,17,63,'Mobile, Web TV',0,'2015-05-22','2016-05-22',4),(147,17,10,'Mobile, Web TV',0,'2015-05-22','2016-05-22',4),(148,17,62,'Mobile, Web TV',0,'2015-05-22','2016-05-22',4),(149,17,28,'Free terrestrial TV, Basic cable, Satellite',0,'2016-01-15','2020-01-14',4),(150,17,29,'Free terrestrial TV, Basic cable, Satellite',0,'2016-01-15','2020-01-14',4),(151,17,30,'Free terrestrial TV, Basic cable, Satellite',0,'2016-01-15','2020-01-14',4),(152,17,59,'Free terrestrial TV, Basic cable, Satellite',0,'2016-01-15','2020-01-14',4),(153,17,9,' Free Terrestrial Television, Pay Cable Television, Internet digital',0,'2015-05-11','2019-05-11',1);
/*!40000 ALTER TABLE `content_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corporate_person`
--

DROP TABLE IF EXISTS `corporate_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `corporate_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `second_name` varchar(100) NOT NULL,
  `departament_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `phone_number` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `picture_link` varchar(1000) DEFAULT NULL,
  `hierarchy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departments_id_fk_idx` (`departament_id`),
  KEY `positions_id_fk_idx` (`position_id`),
  CONSTRAINT `departments_id_fk` FOREIGN KEY (`departament_id`) REFERENCES `departments` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `positions_id_fk` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corporate_person`
--

LOCK TABLES `corporate_person` WRITE;
/*!40000 ALTER TABLE `corporate_person` DISABLE KEYS */;
INSERT INTO `corporate_person` VALUES (1,'ARTEM','ZAPOLSKYI',1,1,'+38 (066) 993-87-77','artem@mk-distribution.com','http://www.mkmediagroup.tv/wp-content/uploads/2017/02/Zapolskij_P-1.jpg',2),(2,'ANNA','VERBOVSKA',1,2,'+38 (093) 832-61-76','anna@mk-distribution.com','http://www.mkmediagroup.tv/wp-content/uploads/2017/02/Verbovskaya_P.jpg',2),(3,'TATYANA','GNAP',1,3,'+38 (095) 577-64-64','tatyana@mk-distribution.com','http://www.mkmediagroup.tv/wp-content/uploads/2017/02/Gnap_P.jpg',2),(4,'MARIIA','KUZNIETSOVA',1,3,'+38 (063) 268-50-66','maria@mk-distribution.com','http://www.mkmediagroup.tv/wp-content/uploads/2018/07/Masha-uai-258x250.jpg',2),(5,'DMITRIY','MARTYNIUK',2,4,'	+38 (091) 952-74-01','dmitriy@mk-distribution.com','http://www.mkmediagroup.tv/wp-content/uploads/2017/02/Martyniuk_P.jpg',3),(7,'OLGA','POPRAVKA',3,6,'+38 (063) 641-49-05','olga@mk-distribution.com','http://www.mkmediagroup.tv/wp-content/uploads/2017/02/PopravkaO_M.jpg',3),(9,'DENIS','DAVIDENKO',4,8,'	+38 (096) 955-28-16','footagestore@ukr.net','http://www.mkmediagroup.tv/wp-content/uploads/2017/02/Dynchik_P.jpg',3),(10,'ANNA','SIRKO',3,5,'+38 (063) 816-62-76','sirko_anna@ukr.net','http://www.mkmediagroup.tv/wp-content/uploads/2017/02/Sirko_P.jpg',3),(12,'DENIS','MIKHEEV',5,30,NULL,NULL,'http://www.mkmediagroup.tv/wp-content/uploads/2017/02/Miheev_P-1.jpg',1);
/*!40000 ALTER TABLE `corporate_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'SALES & ACQUISITIONS'),(2,'MEETMINDS STUDIO'),(3,'SUPPORT DEPARTMENT'),(4,'FOOTAGESTORE.NET'),(5,'CREATORS');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Edutainment'),(2,'Educational'),(3,'Documentary'),(4,'Cuisine'),(5,'Shorts'),(6,'Kids'),(7,'Animation'),(8,'Diy'),(9,'Entertainment'),(10,'Documentary');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'UA'),(2,'RUS'),(3,'ENG');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_area`
--

DROP TABLE IF EXISTS `person_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `person_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `corporate_person_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `corporate_person_FK_idx` (`corporate_person_id`),
  KEY `areas_FK_idx` (`area_id`),
  CONSTRAINT `areas_FK` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `corporate_person_FK` FOREIGN KEY (`corporate_person_id`) REFERENCES `corporate_person` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_area`
--

LOCK TABLES `person_area` WRITE;
/*!40000 ALTER TABLE `person_area` DISABLE KEYS */;
INSERT INTO `person_area` VALUES (1,1,9),(2,1,48),(3,1,70),(4,2,8),(5,2,53),(6,2,16),(7,2,47),(8,3,2),(9,3,3),(10,3,13),(11,1,71),(12,4,72),(13,4,73),(14,4,69),(15,4,35),(16,4,15),(17,4,17),(18,4,68),(19,4,5);
/*!40000 ALTER TABLE `person_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'HEAD OF S&A DEPARTMENT'),(2,'HEAD OF MARKETING'),(3,'MANAGER'),(4,'HEAD OF PRODUCTION STUDIO AND EXECUTIVE DIRECTOR'),(5,'FINANCE MANAGER'),(6,'OFFICE MANAGER'),(7,'GRAPHIC DESIGNER'),(8,'HEAD OF FOOTAGESTORE.NET'),(30,'FOUNDER');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-08 22:38:15

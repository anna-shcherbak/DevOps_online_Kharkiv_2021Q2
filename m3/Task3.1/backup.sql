-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: book_store
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_author` varchar(45) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Стивен Хокинг'),(2,'Дэн Браун'),(3,'Юваль Ной Харари'),(4,'Ричард Филлипс Фейнман'),(5,'Эшли Венс'),(6,'Чарлз Дахигг'),(7,'Лев Толстой');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors_books`
--

DROP TABLE IF EXISTS `authors_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors_books` (
  `Books_book_ID` int(10) unsigned NOT NULL,
  `Authors_author_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Authors_author_id`,`Books_book_ID`),
  KEY `fk_Authors_Books_Books1_idx` (`Books_book_ID`) /*!80000 INVISIBLE */,
  KEY `fk_Authors_Books_Authors1_idx` (`Authors_author_id`),
  CONSTRAINT `fk_Authors_Books_Authors1` FOREIGN KEY (`Authors_author_id`) REFERENCES `authors` (`author_id`),
  CONSTRAINT `fk_Authors_Books_Books1` FOREIGN KEY (`Books_book_ID`) REFERENCES `books` (`book_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors_books`
--

LOCK TABLES `authors_books` WRITE;
/*!40000 ALTER TABLE `authors_books` DISABLE KEYS */;
INSERT INTO `authors_books` VALUES (1,1),(2,2),(10,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,7),(9,7);
/*!40000 ALTER TABLE `authors_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_publishing_houses`
--

DROP TABLE IF EXISTS `book_publishing_houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_publishing_houses` (
  `publishing_houses_publish_id` int(10) unsigned NOT NULL,
  `Books_book_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`publishing_houses_publish_id`,`Books_book_ID`),
  KEY `fk_Book_Publihing houses_Publishing houses1_idx` (`publishing_houses_publish_id`),
  KEY `fk_Book_Publihing houses_Books1_idx` (`Books_book_ID`),
  CONSTRAINT `fk_Book_Publihing houses_Books1` FOREIGN KEY (`Books_book_ID`) REFERENCES `books` (`book_ID`),
  CONSTRAINT `fk_Book_Publihing houses_Publishing houses1` FOREIGN KEY (`publishing_houses_publish_id`) REFERENCES `publishing_houses` (`publish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_publishing_houses`
--

LOCK TABLES `book_publishing_houses` WRITE;
/*!40000 ALTER TABLE `book_publishing_houses` DISABLE KEYS */;
INSERT INTO `book_publishing_houses` VALUES (1,5),(1,10),(2,1),(2,6),(3,2),(3,7),(4,3),(4,8),(5,4),(5,9);
/*!40000 ALTER TABLE `book_publishing_houses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `price` decimal(10,2) unsigned NOT NULL,
  `ISBN` varchar(100) DEFAULT NULL,
  `quant` tinyint(4) unsigned DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `volume` tinyint(3) unsigned DEFAULT NULL,
  `format` set('FB2','EPUB','iOS.EPUB','TXT','RTF','PDF A4','PDF A6','HTML',' MOBI') DEFAULT NULL,
  `cover` set('Hardcover','Paperback','Mass Market Paperback') DEFAULT NULL,
  `published` int(10) unsigned NOT NULL,
  `age_limit` tinyint(3) unsigned DEFAULT NULL,
  `descr` mediumtext,
  PRIMARY KEY (`book_ID`),
  UNIQUE KEY `book_ID_UNIQUE` (`book_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Теория всего. От сингулярности до бесконечности: происхождение и судьба Вселенной',120.56,'978-5-17-102340-9',10,'https://cv8.litres.ru/pub/c/elektronnaya-kniga/cover_415/10434283-stiven-hoking-teoriya-vsego-ot-singulyarnosti-do-beskonechnosti-proishozhd.jpg',150,'FB2,EPUB,iOS.EPUB,TXT,RTF','Hardcover,Paperback',2006,12,'Стивен Хокинг - поистине великий гений современности. Хокинг исследовал сложнейшие вещи, такие как квантовая механика, черные дыры, теория струн, да и вообще строение нашего мира в целом. Более того, он писал об этом книги, где объяснял эти вещи доступным и интересным языком.'),(2,'Инферно',85.94,'978-5-17-098858-7',17,'https://cv3.litres.ru/pub/c/elektronnaya-kniga/cover_415/6113338-den-braun-inferno.jpg',5,'FB2,EPUB,iOS.EPUB,TXT,RTF','Hardcover,Paperback',2013,16,'Профессор Лэнгдон очнулся в больнице. Последние два дня пропали из его памяти, что дало старт странным событиям? За Лэнгдоном ведется охота. Но почему? Теперь ему предстоит перемещаться из города в город, чтобы спасти свою жизнь, узнать, что же произошло за эти два дня, и разгадать загадку, зашифрованную в ?Божественной комедии? Данте, чтобы спасти человечество от надвигающейся беды по имени ?Инферно?.'),(3,'Sapiens. Краткая история человечества',103.29,'978-5-905891-64-9',27,'https://cv1.litres.ru/pub/c/elektronnaya-kniga/cover_415/22150614-uval-noy-harari-sapiens-kratkaya-istoriya-chelovechestva.jpg',1,'FB2,EPUB,iOS.EPUB,TXT,RTF','Hardcover,Paperback',2011,16,'https://www.litres.ru/uval-noy-harari/sapiens-kratkaya-istoriya-chelovecheСто тысяч лет назад Homo sapiens был одним из как минимум шести видов человека, живших на этой планете, – ничем не примечательным животным, которое играло в экосистеме роль не большую, чем гориллы, светлячки или медузы. Но около семидесяти тысяч лет назад загадочное изменение когнитивных способностей Homo sapiens превратило его в хозяина планеты и кошмар экосистемы. Как человек разумный сумел покорить мир? Что стало с другими видами человека? Когда и почему появились деньги, государства и религия? Как возникали и рушились империи? Почему почти все общества ставили женщин ниже мужчин? Как наука и капитализм стали господствующими вероучениями современной эры? Становились ли люди с течением времени счастливее? Какое будущее нас ожидает? Юваль Харари показывает, как ход истории формировал человеческое общество и действительность вокруг него. Его книга прослеживает связь между событиями прошлого и проблемами современности и заставляет читателя пересмотреть все устоявшиеся представления об окружающем мире.tva/'),(4,'Вы, конечно, шутите, мистер Фейнман!',240.50,'978517092293',15,'https://cv9.litres.ru/pub/c/elektronnaya-kniga/cover_415/9447797-frensis-skott-ficdzherald-velikiy-getsbi.jpg',5,'FB2,EPUB,iOS.EPUB,TXT,RTF','Hardcover,Paperback',2015,12,'Cборник автобиографических историй из жизни американского физика и нобелевского лауреата, Ричарда Фейнмана.'),(5,'Elon Musk: Tesla, SpaceX, and the Quest for a Fantastic Future',430.50,'978-517092-293',100,NULL,1,'FB2,EPUB','Hardcover',2009,NULL,NULL),(6,'The Power of Habit: Why We Do What We Do in Life and Business',350.00,'41541515-5822',50,'https://images-na.ssl-images-amazon.com/images/I/51UKFWWvqHL._SX322_BO1,204,203,200_.jpg',1,'FB2,EPUB,TXT','Hardcover',2005,0,'In The Power of Habit, award-winning New York Times business reporter Charles Duhigg takes us to the thrilling edge of scientific discoveries that explain why habits exist and how they can be changed. '),(7,'War and Peace ',122.07,'441-1651-8851',78,NULL,2,'TXT,RTF','Paperback',1867,12,NULL),(8,'Анна Каренина',250.00,'184-1651-151',100,NULL,1,'FB2,iOS.EPUB,TXT','Paperback',1877,12,NULL),(9,'Смерть Ивана Ильича',320.00,'185',15,NULL,2,'FB2,EPUB,TXT','Hardcover',1886,12,NULL),(10,'Код да Винчи',410.00,'181-168516-4158',140,NULL,1,'TXT,RTF','Hardcover,Paperback',2003,12,NULL);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_genres`
--

DROP TABLE IF EXISTS `books_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_genres` (
  `Books_book_ID` int(10) unsigned NOT NULL,
  `Genres_genre_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Books_book_ID`,`Genres_genre_id`),
  KEY `fk_Books_Genres_Books1_idx` (`Books_book_ID`),
  KEY `fk_Books_Genres_Genres1_idx` (`Genres_genre_id`),
  CONSTRAINT `fk_Books_Genres_Books1` FOREIGN KEY (`Books_book_ID`) REFERENCES `books` (`book_ID`),
  CONSTRAINT `fk_Books_Genres_Genres1` FOREIGN KEY (`Genres_genre_id`) REFERENCES `genres` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_genres`
--

LOCK TABLES `books_genres` WRITE;
/*!40000 ALTER TABLE `books_genres` DISABLE KEYS */;
INSERT INTO `books_genres` VALUES (1,1),(2,4),(3,3),(4,3),(5,1),(6,5),(7,2),(8,5),(9,2),(10,1);
/*!40000 ALTER TABLE `books_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `custom_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(45) NOT NULL,
  `passw` varchar(46) NOT NULL,
  `login` varchar(45) NOT NULL,
  `custo_addr` varchar(60) NOT NULL,
  `e_mail` varchar(30) DEFAULT NULL,
  `ip_addr` varchar(32) NOT NULL,
  PRIMARY KEY (`custom_id`),
  UNIQUE KEY `custom_id_UNIQUE` (`custom_id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveries` (
  `deliv_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deliv_date` datetime DEFAULT NULL,
  `Providers_provider_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`deliv_id`),
  UNIQUE KEY `deliv_id_UNIQUE` (`deliv_id`),
  KEY `fk_Deliveries_Providers1_idx` (`Providers_provider_id`),
  CONSTRAINT `fk_Deliveries_Providers1` FOREIGN KEY (`Providers_provider_id`) REFERENCES `providers` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_logs`
--

DROP TABLE IF EXISTS `delivery_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_logs` (
  `num_book_deliv` tinyint(4) NOT NULL,
  `Deliveries_deliv_id` int(10) unsigned NOT NULL,
  `Books_book_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Deliveries_deliv_id`,`Books_book_ID`),
  KEY `fk_Delivery logs_Deliveries1_idx` (`Deliveries_deliv_id`),
  KEY `fk_Delivery logs_Books1_idx` (`Books_book_ID`),
  CONSTRAINT `fk_Delivery logs_Books1` FOREIGN KEY (`Books_book_ID`) REFERENCES `books` (`book_ID`),
  CONSTRAINT `fk_Delivery logs_Deliveries1` FOREIGN KEY (`Deliveries_deliv_id`) REFERENCES `deliveries` (`deliv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_logs`
--

LOCK TABLES `delivery_logs` WRITE;
/*!40000 ALTER TABLE `delivery_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` int(10) unsigned NOT NULL,
  `genre_name` varchar(15) NOT NULL,
  PRIMARY KEY (`genre_id`),
  UNIQUE KEY `genre_id_UNIQUE` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'self-help'),(2,'economy'),(3,'detective'),(4,'physics'),(5,'managment');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_date` datetime NOT NULL,
  `Customers_custom_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`order_ID`),
  UNIQUE KEY `order_ID_UNIQUE` (`order_ID`),
  KEY `fk_Orders_Customers1_idx` (`Customers_custom_id`),
  CONSTRAINT `fk_Orders_Customers1` FOREIGN KEY (`Customers_custom_id`) REFERENCES `customers` (`custom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `providers` (
  `provider_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provid_name` varchar(30) NOT NULL,
  `provid_addr` varchar(60) NOT NULL,
  `provid_phone` tinyint(15) NOT NULL,
  PRIMARY KEY (`provider_id`),
  UNIQUE KEY `provider_id_UNIQUE` (`provider_id`),
  UNIQUE KEY `provid_name_UNIQUE` (`provid_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishing_houses`
--

DROP TABLE IF EXISTS `publishing_houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishing_houses` (
  `publish_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `publish_name` varchar(50) NOT NULL,
  PRIMARY KEY (`publish_id`),
  UNIQUE KEY `publish_id_UNIQUE` (`publish_id`),
  UNIQUE KEY `publish_name_UNIQUE` (`publish_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishing_houses`
--

LOCK TABLES `publishing_houses` WRITE;
/*!40000 ALTER TABLE `publishing_houses` DISABLE KEYS */;
INSERT INTO `publishing_houses` VALUES (1,'Bantam Books'),(2,'Doubley'),(3,'Phoneix Books and Audio'),(4,'АСТ'),(5,'Эксмо');
/*!40000 ALTER TABLE `publishing_houses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoping_list`
--

DROP TABLE IF EXISTS `shoping_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoping_list` (
  `num_books_ord` tinyint(4) NOT NULL,
  `Books_book_ID` int(10) unsigned NOT NULL,
  `Orders_order_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Books_book_ID`,`Orders_order_ID`),
  KEY `fk_table1_Books_idx` (`Books_book_ID`),
  KEY `fk_Shoping_list_Orders1_idx` (`Orders_order_ID`),
  CONSTRAINT `fk_Shoping_list_Orders1` FOREIGN KEY (`Orders_order_ID`) REFERENCES `orders` (`order_ID`),
  CONSTRAINT `fk_table1_Books` FOREIGN KEY (`Books_book_ID`) REFERENCES `books` (`book_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoping_list`
--

LOCK TABLES `shoping_list` WRITE;
/*!40000 ALTER TABLE `shoping_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoping_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-27 22:46:00

-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: book_store
-- ------------------------------------------------------
-- Server version	8.0.17
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'book_store'
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp866 */ ;
/*!50003 SET character_set_results = cp866 */ ;
/*!50003 SET collation_connection  = cp866_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `availability`()
BEGIN
DECLARE num INT; 
DECLARE bol INT; 
DECLARE num_book INT; 
DECLARE name_book varchar(100);
DECLARE id_book int;
DROP TABLE IF EXISTS absent_books;
select COUNT(*) into @id_bookk from books;
set id_book=@id_bookk;
CREATE TABLE absent_books(
title varchar(100), quantity int UNSIGNED NULL );
SET num=1;
SET bol =0;
INSERT INTO absent_books (title) VALUES ("Need to buy new books:");
WHILE num<=id_book DO
SELECT quant INTO num_book from books where book_id=num;
SELECT title INTO name_book from books where book_id=num;
if num_book<50 then 
begin
SET num= num+1;
INSERT INTO absent_books (title, quantity) VALUES (name_book, num_book);
SET bol = bol+1;
END;
ELSE
BEGIN
SET bol=bol+0;
SET num= num+1;
END;
END IF;
END WHILE;
if bol =0 THEN 
select 'Sufficient quantity of books' AS '';
else
SELECT * FROM absent_books;
END IF;
DROP TABLE absent_books;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-27 17:55:27

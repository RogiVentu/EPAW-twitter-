-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: localhost    Database: ts1
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follows` (
  `followed` varchar(255) NOT NULL,
  `byUser` varchar(255) NOT NULL,
  PRIMARY KEY (`followed`,`byUser`),
  KEY `byUser` (`byUser`),
  CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`followed`) REFERENCES `users` (`username`),
  CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`byUser`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES ('Hancock','laieee');
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweets`
--

DROP TABLE IF EXISTS `tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweets` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `picture` longblob,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `tweets_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweets`
--

LOCK TABLES `tweets` WRITE;
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
INSERT INTO `tweets` VALUES (1,'Visitando el museo de ciencia','AIII SI QUE BIEN ME LO PASE EN EL MUSEO DE CIENCIA HAY MUCHAS COSAS INTERESANTES COMO POR EJEMPLO COSAS HECHAS CON CIENCIA Y COSAS QUE SIN LA CIENCIA NO SE PODRIAN HABER HECHO','Hancock','2017-06-08 23:32:00',NULL),(2,'In the Lil Uzi Vert Performance','Amazing festival, that lil uzi vert is a boss i will repeat next year... it was an awesome experience!','Hancock','2017-06-10 14:23:65',NULL);
/*!40000 ALTER TABLE `tweets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surnames` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `datebirth` varchar(255) DEFAULT NULL,
  `isAdmin` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','admin','admin@admin','Admin','Admin Supremo','Male','15/11/1996',1),('AlexisBro59','qaqaqa','alexis@gmail.com','Alexis ','jAUME Alcala','Female','01/01/2017',0),('AVERSUFYBSUIB','okokok','okw@wekk','okokawd','aisdakd','Other','05/08/2017',0),('butanerosd','qaqaqa','buta@fkfkfdfg','asdasd','asdasdasdk','Other','06/11/2017',0),('efsdfsdf','sdfsdfsdf','sdsdfsdf@dsf','Roger','VENEGWEI','Female','wefwefwef',0),('Hancocdf','tadpole','asddee@dldldl','pepe','sikoasdfsf','Female','05/08/2017',0),('Hancock','1q2w3e4r','sksdk@sdsdf','Roger','Ventura Castelló','Male','05/01/2017',0),('Hancock343','123456','okok@dxdx','Alp','Oktem','Male','05/10/2017',0),('Hancockl','qaqaqa','okasd@2qwe','qaqaik','kijok','Female','06/06/2017',0),('ii  j jh jh jh j ','mkl mkl','oo@koko.o.o.o.o.o.o','na','okpppp','Other','02/08/2018',0),('keloopwwr','qoqoqo','okada@weewj','qowek','okoiikj','Male','06/13/2017',0),('keloruuush','shurma','epepe@dddad','peodp','dfspfqo','Male','06/07/2017',0),('laieee','okokok','laiee@asdkmsdf','Laiaaa','Castany','Female','06/05/2017',0),('PAPIITO','asdgoko','sdfs@sdf','kekleoke','dasdadad','Male','05/01/2017',0),('Purchass','purchass','dfps@sdfsf','mememakw','ldaldadad','Male','05/10/2017',0),('sdfsd','sdfsesf','fsef@sdf','sdfsf','sdfsdf','Male','05/15/2017',0),('sdsadfsdf','sdfsdf','sdf@sdf','sdf','dfsdf','Male','05/17/2017',0);
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

-- Dump completed on 2017-06-14 13:34:01

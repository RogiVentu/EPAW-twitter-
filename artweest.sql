#DROP DATABASE ts1;

USE ts1;

DROP TABLE IF EXISTS `tweets`;
DROP TABLE IF EXISTS `users`;
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


LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES ('admin','admin','admin@admin','Admin','Admin Supremo','Male','15/11/1996',1),('AlexisBro59','qaqaqa','alexis@gmail.com','Alexis ','jAUME Alcala','Female','01/01/2017',NULL),('AVERSUFYBSUIB','okokok','okw@wekk','okokawd','aisdakd','Other','05/08/2017',0),('butanerosd','qaqaqa','buta@fkfkfdfg','asdasd','asdasdasdk','Other','06/11/2017',NULL),('efsdfsdf','sdfsdfsdf','sdsdfsdf@dsf','Roger','VENEGWEI','Female','wefwefwef',NULL),('Hancocdf','tadpole','asddee@dldldl','pepe','sikoasdfsf','Female','05/08/2017',NULL),('Hancock','1q2w3e4r','sksdk@sdsdf','Roger','Ventura Castelló','Male','05/01/2017',NULL),('Hancock343','123456','okok@dxdx','Alp','Oktem','Male','05/10/2017',NULL),('Hancockl','qaqaqa','okasd@2qwe','qaqaik','kijok','Female','06/06/2017',NULL),('ii  j jh jh jh j ','mkl mkl','oo@koko.o.o.o.o.o.o','na','okpppp','Other','02/08/2018',NULL),('keloopwwr','qoqoqo','okada@weewj','qowek','okoiikj','Male','06/13/2017',NULL),('keloruuush','shurma','epepe@dddad','peodp','dfspfqo','Male','06/07/2017',NULL),('PAPIITO','asdgoko','sdfs@sdf','kekleoke','dasdadad','Male','05/01/2017',NULL),('Purchass','purchass','dfps@sdfsf','mememakw','ldaldadad','Male','05/10/2017',NULL),('sdfsd','sdfsesf','fsef@sdf','sdfsf','sdfsdf','Male','05/15/2017',NULL),('sdsadfsdf','sdfsdf','sdf@sdf','sdf','dfsdf','Male','05/17/2017',NULL);
UNLOCK TABLES;


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


LOCK TABLES `tweets` WRITE;
INSERT INTO `tweets` (`title`, `text`, `user`, `time`, `picture`) VALUES ('Visitando el museo de ciencia','AIII SI QUE BIEN ME LO PASE EN EL MUSEO DE CIENCIA HAY MUCHAS COSAS INTERESANTES COMO POR EJEMPLO COSAS HECHAS CON CIENCIA Y COSAS QUE SIN LA CIENCIA NO SE PODRIAN HABER HECHO','Hancock','2017-06-08 23:32:00',NULL),('In the Lil Uzi Vert Performance','Amazing festival, that lil uzi vert is a boss i will repeat next year... it was an awesome experience!','Hancock','2017-06-10 14:23:65',NULL);
UNLOCK TABLES;

#SELECT * FROM users;
#SELECT * FROM tweets;
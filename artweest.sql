USE ts1;

DROP TABLE IF EXISTS `follows`;
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
INSERT INTO `users` VALUES ('admin','admin','admin@admin','Admin','Admin Supremo','Male','15/11/1996',1),('Danielle','okokok','cach@me','Cach ','Me Outside','Female','06/05/2017',0),('Durant','okokok','lentreno@bcn','Durant','Shaquile Iguain','Male','05/08/2017',0),('Hancock','1q2w3e4r','sksdk@sdsdf','Roger','Ventura Castelló','Male','05/01/2017',0),('laieee','okokok','laiee@asdkmsdf','Laiaaa','Castany','Female','06/05/2017',0);
UNLOCK TABLES;

CREATE TABLE `follows` (
  `followed` varchar(255) NOT NULL,
  `byUser` varchar(255) NOT NULL,
  PRIMARY KEY (`followed`,`byUser`),
  KEY `byUser` (`byUser`),
  CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`followed`) REFERENCES `users` (`username`),
  CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`byUser`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



LOCK TABLES `follows` WRITE;
INSERT INTO `follows` VALUES ('Hancock','Danielle'),('Danielle','Durant'),('laieee','Durant'),('Danielle','laieee'),('Hancock','laieee'),('Durant','Hancock');
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
INSERT INTO `tweets` (`title`,`text`,`user`,`time`,`picture`) VALUES ('Cach Me Outside','Just come outside and catch me man u know u cant','Danielle','14-06-2017 17:34:00',NULL),('I hate mondays','OH.. Today is monday... Please kill me mates','Danielle','13-06-2017 18:52:34',NULL),('Restaurant Gourmet','El restaurant de la Garriga anomenat Jamelexirogi està molt bo, fan uns plats molt gourmets','laieee','14-06-2017 02:23:14',NULL),('Comença l\'estiu, per fí!','Per fi he acabat els examens ara cap a la platja!','laieee','12-06-2017 11:23:14',NULL),('I am the best','We deserve that win, and i deserve the mpv title in finals because i did it all, my team did zero work.','Durant','13-06-2017 09:23:14',NULL),('I love you Lebron','Just right now i found Lebron James in one party, he is a good boy at all, i think i feel in love with him','Durant','15-06-2017 00:33:51',NULL),('I can\'t resist this','Oh guys, im sorry i cant resist go to bed with Lebron, he is an amazing bro','Durant','15-06-2017 03:53:12',NULL),('Funsiona?','Si lo ase es increible bro','Durant','18-06-3024 04:53:12',NULL);
UNLOCK TABLES;

SELECT * FROM users;
#SELECT * FROM tweets;
SELECT * FROM follows;
#SELECT title, text , user, time FROM tweets T, follows F WHERE F.byUser = 'Hancock' AND T.user = F.followed;
#SELECT username FROM users WHERE username like'd%'ORDER BY username;
#SELECT name, surnames, gender, datebirth, username, email FROM users WHERE username = 'Hancock';
#SELECT id, title, text , user, time FROM tweets T WHERE T.user = 'Durant';
#SELECT COUNT(*) AS countf FROM follows WHERE followed='Danielle' AND byuser='Hancock';
#DELETE FROM follows WHERE followed= 'Danielle' AND byuser='Hancock';
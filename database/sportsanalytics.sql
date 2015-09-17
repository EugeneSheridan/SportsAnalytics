CREATE DATABASE  IF NOT EXISTS SPORTSANALYTICS;
USE SPORTSANALYTICS;

DROP TABLE IF EXISTS BASEBALL_BATTINGORDER;
DROP TABLE IF EXISTS GAMESTATS;
DROP TABLE IF EXISTS BASEBALL_PLAYEVENT;
DROP TABLE IF EXISTS BASEBALL_PLAY;
DROP TABLE IF EXISTS BASEBALL_GAME;
DROP TABLE IF EXISTS PLAYERSTATS;
DROP TABLE IF EXISTS TEAMSTATS;
DROP TABLE IF EXISTS TEAMMEMBERS;
DROP TABLE IF EXISTS BASEBALL_PLAYCODE;
DROP TABLE IF EXISTS BASEBALL_PLAYER;
DROP TABLE IF EXISTS TEAM;
DROP TABLE IF EXISTS GAME;
DROP TABLE IF EXISTS SEASON;
DROP TABLE IF EXISTS STAT;
DROP TABLE IF EXISTS PLAYER_POSITION;
DROP TABLE IF EXISTS PLAYER;
DROP TABLE IF EXISTS SPORT;


CREATE TABLE SPORT (
  ID int(11) NOT NULL AUTO_INCREMENT,
  NAME varchar(100) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES SPORT WRITE;
/*!40000 ALTER TABLE SPORT DISABLE KEYS */;
INSERT INTO SPORT VALUES (1,'Baseball');
/*!40000 ALTER TABLE SPORT ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE PLAYER (
  ID int(11) NOT NULL AUTO_INCREMENT,
  NAME varchar(100) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES PLAYER WRITE;
/*!40000 ALTER TABLE PLAYER DISABLE KEYS */;
INSERT INTO PLAYER VALUES (1,'Bryson Dickey');
/*!40000 ALTER TABLE PLAYER ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE TEAM (
  ID int(11) NOT NULL AUTO_INCREMENT,
  NAME varchar(100) DEFAULT NULL,
  SPORT_ID int(11) NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (SPORT_ID) REFERENCES SPORT(ID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES TEAM WRITE;
/*!40000 ALTER TABLE TEAM DISABLE KEYS */;
INSERT INTO TEAM VALUES (1,'SHARKS',1);
/*!40000 ALTER TABLE TEAM ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE TEAMMEMBERS (
  ID int(11) NOT NULL AUTO_INCREMENT,
  TEAM_ID int(11) NOT NULL,
  PLAYER_ID int(11) NOT NULL,
  DATE_JOINED DATE,
  DATE_LEFT DATE,
  PRIMARY KEY (ID),
  FOREIGN KEY (TEAM_ID) REFERENCES TEAM(ID),
  FOREIGN KEY (PLAYER_ID) REFERENCES PLAYER(ID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES TEAMMEMBERS WRITE;
/*!40000 ALTER TABLE TEAMMEMBERS DISABLE KEYS */;
INSERT INTO TEAMMEMBERS VALUES (1,1,1, NOW(),NULL);
/*!40000 ALTER TABLE TEAMMEMBERS ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE SEASON (
  ID int(11) NOT NULL AUTO_INCREMENT,
  NAME varchar(100) DEFAULT NULL,
  SEASON_START DATE,
  SEASON_END DATE,
  PRIMARY KEY (ID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES SEASON WRITE;
/*!40000 ALTER TABLE SEASON DISABLE KEYS */;
INSERT INTO SEASON VALUES (1,'SUMMER BASEBALL 2015', '2015-03-01', '2015-06-30');
INSERT INTO SEASON VALUES (2,'FALL BASEBALL 2015', '2015-07-01', '2015-010-01');
/*!40000 ALTER TABLE SEASON ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE GAME (
  ID int(11) NOT NULL AUTO_INCREMENT,
  GAME_DATETIME DATETIME,
  SEASON_ID int(11) NOT NULL,
  LOCATION VARCHAR(255),
  PRIMARY KEY (ID),
  FOREIGN KEY (SEASON_ID) REFERENCES SEASON(ID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES GAME WRITE;
/*!40000 ALTER TABLE GAME DISABLE KEYS */;
INSERT INTO GAME VALUES (1,'2015-09-09 17:30:00',2, '3AND2: FIELD 10');
INSERT INTO GAME VALUES (2,'2015-09-09 19:30:00',2, '3AND2: FIELD 23');
/*!40000 ALTER TABLE GAME ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE STAT (
  ID int(11) NOT NULL AUTO_INCREMENT,
  SPORT_ID int(11) NOT NULL,
  NAME VARCHAR(255),
  CALCULATION VARCHAR(65535),
  PRIMARY KEY (ID),
  FOREIGN KEY (SPORT_ID) REFERENCES SPORT(ID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES STAT WRITE;
/*!40000 ALTER TABLE STAT DISABLE KEYS */;
INSERT INTO STAT VALUES (1,1,'CAREER RBI','TBD');
INSERT INTO STAT VALUES (2,1,'GAME RBI','TBD');
INSERT INTO STAT VALUES (3,1,'TOTAL RBI','TBD');
/*!40000 ALTER TABLE STAT ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE PLAYER_POSITION (
  ID int(11) NOT NULL AUTO_INCREMENT,
  NAME VARCHAR(255),
  PRIMARY KEY (ID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES PLAYER_POSITION WRITE;
/*!40000 ALTER TABLE PLAYER_POSITION DISABLE KEYS */;
INSERT INTO PLAYER_POSITION VALUES (1,'CATCHER');
/*!40000 ALTER TABLE PLAYER_POSITION ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE PLAYERSTATS (
  ID int(11) NOT NULL AUTO_INCREMENT,
  PLAYER_ID int(11) NOT NULL,
  STAT_ID int(11) NOT NULL,
  VALUE FLOAT,
  PRIMARY KEY (ID),
  FOREIGN KEY (PLAYER_ID) REFERENCES PLAYER(ID),
  FOREIGN KEY (STAT_ID) REFERENCES STAT(ID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES PLAYERSTATS WRITE;
/*!40000 ALTER TABLE PLAYERSTATS DISABLE KEYS */;
INSERT INTO PLAYERSTATS VALUES (1,1,1,100.99);
/*!40000 ALTER TABLE PLAYERSTATS ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE GAMESTATS (
  ID int(11) NOT NULL AUTO_INCREMENT,
  GAME_ID int(11) NOT NULL,
  STAT_ID int(11) NOT NULL,
  VALUE FLOAT,
  PRIMARY KEY (ID),
  FOREIGN KEY (GAME_ID) REFERENCES GAME(ID),
  FOREIGN KEY (STAT_ID) REFERENCES STAT(ID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES GAMESTATS WRITE;
/*!40000 ALTER TABLE GAMESTATS DISABLE KEYS */;
INSERT INTO GAMESTATS VALUES (1,1,2,100.99);
/*!40000 ALTER TABLE GAMESTATS ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE TEAMSTATS (
  ID int(11) NOT NULL AUTO_INCREMENT,
  TEAM_ID int(11) NOT NULL,
  STAT_ID int(11) NOT NULL,
  VALUE FLOAT,
  PRIMARY KEY (ID),
  FOREIGN KEY (TEAM_ID) REFERENCES TEAM(ID),
  FOREIGN KEY (STAT_ID) REFERENCES STAT(ID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES TEAMSTATS WRITE;
/*!40000 ALTER TABLE TEAMSTATS DISABLE KEYS */;
INSERT INTO TEAMSTATS VALUES (1,1,3,100.99);
/*!40000 ALTER TABLE TEAMSTATS ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE BASEBALL_GAME (
  ID int(11) NOT NULL AUTO_INCREMENT,
  HOMETEAM_ID int(11) NOT NULL,
  AWAYTEAM_ID int(11) NOT NULL,
  WINNINGTEAM_ID int(11),
  HOMETEAM_RUNS FLOAT,
  HOMETEAM_HITS FLOAT,
  HOMETEAM_ERRORS FLOAT,
  AWAYTEAM_RUNS FLOAT,
  AWAYTEAM_HITS FLOAT,
  AWAYTEAM_ERRORS FLOAT,
  CURRENT_INNING VARCHAR(50),
  PRIMARY KEY (ID),
  FOREIGN KEY (HOMETEAM_ID) REFERENCES TEAM(ID),
  FOREIGN KEY (AWAYTEAM_ID) REFERENCES TEAM(ID),
  FOREIGN KEY (WINNINGTEAM_ID) REFERENCES TEAM(ID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES BASEBALL_GAME WRITE;
/*!40000 ALTER TABLE BASEBALL_GAME DISABLE KEYS */;
INSERT INTO BASEBALL_GAME VALUES (1,1,1,NULL,1,2,3,9,8,7,'T9');
/*!40000 ALTER TABLE BASEBALL_GAME ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE BASEBALL_PLAYER (
  ID int(11) NOT NULL AUTO_INCREMENT,
  PLAYER_ID int(11) NOT NULL,
  NUMBER INTEGER,
  PRIMARY KEY (ID),
  FOREIGN KEY (PLAYER_ID) REFERENCES PLAYER(ID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES BASEBALL_PLAYER WRITE;
/*!40000 ALTER TABLE BASEBALL_PLAYER DISABLE KEYS */;
INSERT INTO BASEBALL_PLAYER VALUES (1,1,35);
/*!40000 ALTER TABLE BASEBALL_PLAYER ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE BASEBALL_PLAYCODE (
  ID int(11) NOT NULL AUTO_INCREMENT,
  PLAYCODE VARCHAR(50),
  PLAYCODE_DESC VARCHAR(256),
  PRIMARY KEY (ID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES BASEBALL_PLAYCODE WRITE;
/*!40000 ALTER TABLE BASEBALL_PLAYCODE DISABLE KEYS */;
INSERT INTO BASEBALL_PLAYCODE VALUES (1,'SO','STRIKE OUT');
/*!40000 ALTER TABLE BASEBALL_PLAYCODE ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE BASEBALL_PLAY (
  ID int(11) NOT NULL AUTO_INCREMENT,
  BASEBALLGAME_ID int(11) NOT NULL,
  INNING VARCHAR(50),
  PRIMARY KEY (ID),
  FOREIGN KEY (BASEBALLGAME_ID) REFERENCES BASEBALL_GAME(ID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES BASEBALL_PLAY WRITE;
/*!40000 ALTER TABLE BASEBALL_PLAY DISABLE KEYS */;
INSERT INTO BASEBALL_PLAY VALUES (1,1,'');
/*!40000 ALTER TABLE BASEBALL_PLAY ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE BASEBALL_PLAYEVENT (
  ID int(11) NOT NULL AUTO_INCREMENT,
  BASEBALLPLAY_ID int(11) NOT NULL,
  BASEBALLPLAYER_ID int(11) NOT NULL,
  PLAYERPOSITION_ID int(11) NOT NULL,
  BASEBALLPLAYCODE_ID int(11) NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (BASEBALLPLAY_ID) REFERENCES BASEBALL_PLAY(ID),
  FOREIGN KEY (BASEBALLPLAYER_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (PLAYERPOSITION_ID) REFERENCES PLAYER_POSITION(ID),
  FOREIGN KEY (BASEBALLPLAYCODE_ID) REFERENCES BASEBALL_PLAYCODE(ID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES BASEBALL_PLAYEVENT WRITE;
/*!40000 ALTER TABLE BASEBALL_PLAYEVENT DISABLE KEYS */;
INSERT INTO BASEBALL_PLAYEVENT VALUES (1,1,1,1,1);
/*!40000 ALTER TABLE BASEBALL_PLAYEVENT ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE BASEBALL_BATTINGORDER (
  ID int(11) NOT NULL AUTO_INCREMENT,
  BASEBALLGAME_ID int(11) NOT NULL,
  BATTER_01_ID int(11),
  BATTER_02_ID int(11),
  BATTER_03_ID int(11),
  BATTER_04_ID int(11),
  BATTER_05_ID int(11),
  BATTER_06_ID int(11),
  BATTER_07_ID int(11),
  BATTER_08_ID int(11),
  BATTER_09_ID int(11),
  BATTER_10_ID int(11),
  BATTER_11_ID int(11),
  BATTER_12_ID int(11),
  BATTER_13_ID int(11),
  BATTER_14_ID int(11),
  BATTER_15_ID int(11),
  BATTER_16_ID int(11),
  BATTER_17_ID int(11),
  BATTER_18_ID int(11),
  BATTER_19_ID int(11),
  BATTER_20_ID int(11),
  PRIMARY KEY (ID),
  FOREIGN KEY (BASEBALLGAME_ID) REFERENCES BASEBALL_GAME(ID),
  FOREIGN KEY (BATTER_01_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (BATTER_02_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (BATTER_03_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (BATTER_04_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (BATTER_05_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (BATTER_06_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (BATTER_07_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (BATTER_08_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (BATTER_09_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (BATTER_10_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (BATTER_11_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (BATTER_12_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (BATTER_13_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (BATTER_14_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (BATTER_15_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (BATTER_16_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (BATTER_17_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (BATTER_18_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (BATTER_19_ID) REFERENCES BASEBALL_PLAYER(ID),
  FOREIGN KEY (BATTER_20_ID) REFERENCES BASEBALL_PLAYER(ID)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES BASEBALL_BATTINGORDER WRITE;
/*!40000 ALTER TABLE BASEBALL_BATTINGORDER DISABLE KEYS */;
INSERT INTO BASEBALL_BATTINGORDER VALUES (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);
/*!40000 ALTER TABLE BASEBALL_BATTINGORDER ENABLE KEYS */;
UNLOCK TABLES;


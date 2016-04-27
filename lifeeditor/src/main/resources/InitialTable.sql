CREATE DATABASE LE01 
ON
( NAME = LifeEditor,
  FILENAME = 'D:\LifeEditorDB\LifeEditor.MDF',
  SIZE = 10MB,
  MAXSIZE = 100MB,
  FILEGROWTH = 5)

LOG ON 
( NAME = LifeEditorLog,
  FILENAME = 'D:\LifeEditorDB\LifeEditorLog.LDF',
  SIZE = 5MB,
  MAXSIZE = 20MB,
  FILEGROWTH = 2);

USE LE01;

DROP TABLE friend;
DROP TABLE invite_list;
DROP TABLE message;
DROP TABLE ach_list;
DROP TABLE target_list;
DROP TABLE target_spec;
DROP TABLE misbehave;
DROP TABLE user_spec;
DROP TABLE target;
DROP TABLE achievement;
DROP TABLE event;
DROP TABLE sec_list;
DROP TABLE type_list;

 CREATE TABLE user_spec(
    userID int  identity PRIMARY KEY,
	account varchar(30)  NOT NULL,
	pswd varchar(30)  NOT NULL,
	lastName nvarchar(30)  NOT NULL,
	firstName nvarchar(30)  NOT NULL,
	gender char(1)  NOT NULL,
	birthdate date,
	email varchar(50)  NOT NULL,
	address nvarchar(100),
	phone varchar(20),
	genkiBarTol int,
	level int,
	picture varbinary(max),
	regTime datetime2  NOT NULL,
	hotMan bit,
	suspendType int
);

CREATE TABLE friend(
	userID int FOREIGN KEY REFERENCES user_spec(userID),
	friendID int FOREIGN KEY REFERENCES user_spec(userID),
	frdSince datetime2 NOT NULL,
	PRIMARY KEY(userID,friendID)
);

CREATE TABLE invite_list(
	inviter int FOREIGN KEY REFERENCES user_spec(userID),
	receiver int FOREIGN KEY REFERENCES user_spec(userID),
	accepted bit NOT NULL,
	PRIMARY KEY(inviter,receiver)
);

CREATE TABLE message(
	messageID int IDENTITY PRIMARY KEY,
	msgSender int NOT NULL FOREIGN KEY REFERENCES user_spec(userID),
	msgReceiver int NOT NULL FOREIGN KEY REFERENCES user_spec(userID),
	msgTime datetime2 NOT NULL,
	content nvarchar(200)
);

CREATE TABLE type_list(
	typeID int IDENTITY PRIMARY KEY,
	typeName nvarchar(50),
	typePic varbinary(max)
);

CREATE TABLE sec_list(
	secID int IDENTITY PRIMARY KEY,
	typeID int FOREIGN KEY REFERENCES type_list(typeID) NOT NULL,
	secName nvarchar(50),
	secPic varbinary(max)
);

CREATE TABLE event(
	eventID int IDENTITY PRIMARY KEY,
	typeID int FOREIGN KEY REFERENCES type_list(typeID) NOT NULL,
	secID int FOREIGN KEY REFERENCES sec_list(secID) NOT NULL,
	eventName nvarchar(50) NOT NULL,
	eventPic varbinary(max),
	orgName nvarchar(30),
	orgAddr nvarchar(100),
	eventTime datetime2 NOT NULL,
	eventDesc nvarchar(200)
);

CREATE TABLE achievement(
	achID int IDENTITY PRIMARY KEY,
	achName nvarchar(50) NOT NULL,
	achDesc nvarchar(500),
	rewardPic varbinary(max)
);

CREATE TABLE ach_list(
	userID int FOREIGN KEY REFERENCES user_spec(userID) NOT NULL,
	achID int FOREIGN KEY REFERENCES achievement(achID) NOT NULL,
	PRIMARY KEY (userID,achID)
);

CREATE TABLE target(
	targetID int IDENTITY PRIMARY KEY,
	trgName nvarchar(50) NOT NULL,
	typeID int FOREIGN KEY REFERENCES type_list(typeID) NOT NULL,
	sectionID int FOREIGN KEY REFERENCES sec_list(secID) NOT NULL,
	difficulty int,
	intention nvarchar(500) NOT NULL,
	privacy int,
	genkiBar int,
	achID int FOREIGN KEY REFERENCES achievement(achID),
	priority int,
	remindTimes int,
	challenge bit,
	punishment int,
	status int,
	timeStart datetime2 NOT NULL,
	timeFinish datetime2 NOT NULL,
	doneTime datetime2
);


CREATE TABLE misbehave(
	behaveID int IDENTITY PRIMARY KEY,
	reporter int FOREIGN KEY REFERENCES user_spec(userID) NOT NULL,
	defendant int  FOREIGN KEY REFERENCES user_spec(userID) NOT NULL,
	targetID int FOREIGN KEY REFERENCES target(targetID) NOT NULL,
	reason nvarchar(200) NOT NULL,
	reportTime datetime2 NOT NULL,
	result int
);

CREATE TABLE target_list(
	userID int FOREIGN KEY REFERENCES user_spec(userID),
	targetID int FOREIGN KEY REFERENCES target(targetID),
	PRIMARY KEY (userID,targetID)
);

CREATE TABLE target_spec(
	trgSpecID int IDENTITY PRIMARY KEY,
	userID int FOREIGN KEY REFERENCES user_spec(userID),
	targetID int FOREIGN KEY REFERENCES target(targetID),
	trgNote nvarchar(max),
	trgPic varbinary(max),
);

INSERT INTO user_spec values ('b0001' , '12345' , '王' , '小明' , 'M' , '1999-09-09' , 'b0001@yahoo.com.tw' , '台北市' , '0919255444' , 0 , 0 , null , SYSDATETIME() , 'false' , null);
INSERT INTO user_spec values ('batman' , '54321' , '蝙' , '蝠俠' , 'F' , '1922-07-09' , 'batman@gmail.com' , '南極洲' , '0919247944' , 0 , 0 , null , SYSDATETIME() , 'false' , null);
INSERT INTO user_spec values ('superman' , '123faefe5' , '超' , '人' , 'M' , '1966-06-06' , 'superman@gmail.com' , '電話亭' , '+886944255888' , 0 , 0 , null , SYSDATETIME() , 'false' , null);
INSERT INTO user_spec values ('curry' , '3333333' , 'Curry' , 'Stephen' , 'M' , '1988-3-14' , 'curry@gmail.com.tw' , '美國' , '347-555-5555' , 0 , 0 , null , '2015-6-12' , 'true' , null);
INSERT INTO user_spec values ('kevin' , '543f1321' , '陳' , '肥宅' , 'F' , '1992-08-09' , 'otaku@gmail.com' , '家' , '(02)2744-0876' , 0 , 0 , null , SYSDATETIME() , 'false' , null);
INSERT INTO user_spec values ('kai' , 'efnlla' , 'カシワ' , 'カイ' , 'M' , '1991-09-11' , 'justdoyouwant@gmail.com' , '北海道文京台' , null, 0 , 0 , null , SYSDATETIME() , 'false' , null);
INSERT INTO user_spec values ('longbi' , '123f45' , '吴' , '小陆' , 'M' , '1999-09-09' , 'b0001@yahoo.com.tw' , '台北市' , '+8613711122233' , 0 , 0 , null , SYSDATETIME() , 'false' , null);
insert into user_spec values ('akyo01','123456','Apple','Yang','F','1992-04-14','akyo01@gmail.com','台北市大安區復興南路120號','0988032290',0,0,NULL,getdate(),0,0)
insert into user_spec values ('akyo02','123456','Banana','Yang','F','1992-04-14','akyo02@gmail.com','台北市大安區復興南路121號','0988032291',0,0,NULL,getdate(),0,0)
insert into user_spec values ('akyo03','123456','Cat','Yang','F','1992-04-14','akyo03@gmail.com','台北市大安區復興南路122號','0988032292',0,0,NULL,getdate(),0,0)
insert into user_spec values ('akyo04','123456','Dog','Yang','M','1992-04-14','akyo04@gmail.com','台北市大安區復興南路123號','0988032293',0,0,NULL,getdate(),0,0)
insert into user_spec values ('akyo05','123456','Ezreal','Yang','M','1992-04-14','akyo05@gmail.com','台北市大安區復興南路124號','0988032294',0,0,NULL,getdate(),0,0)
insert into user_spec values ('akyo06','123456','Fox','Yang','M','1992-04-14','akyo06@gmail.com','台北市大安區復興南路125號','0988032295',0,0,NULL,getdate(),0,0)
insert into user_spec values ('akyo07','123456','Green','Yang','M','1992-04-14','akyo07@gmail.com','台北市大安區復興南路126號','0988032296',0,0,NULL,getdate(),0,0)
insert into user_spec values ('akyo08','123456','Handsome','Yang','M','1992-04-14','akyo08@gmail.com','台北市大安區復興南路127號','0988032297',0,0,NULL,getdate(),0,0)
insert into user_spec values ('akyo09','123456','Image','Yang','F','1992-04-14','akyo09@gmail.com','台北市大安區復興南路128號','0988032298',0,0,NULL,getdate(),0,0)
insert into user_spec values ('akyo10','123456','Joker','Yang','M','1992-04-14','akyo10@gmail.com','台北市大安區復興南路129號','0988032299',0,0,NULL,getdate(),0,0)




select * from user_spec;

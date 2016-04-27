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
insert into user_spec(account,pswd,lastName,firstName,gender,birthday,email)
values('le01','123456','劉','德華','S','1990-05-15','yu20111@yahoo.com.tw')
insert into user_spec(account,pswd,lastName,firstName,gender,birthday,email)
values('le02','222222','張','學友','S','1990-05-15','yu20111@yahoo.com.tw')
insert into user_spec(account,pswd,lastName,firstName,gender,birthday,email)
values('le03','333333','郭','負成','S','1990-05-15','yu20111@yahoo.com.tw')
insert into user_spec(account,pswd,lastName,firstName,gender,birthday,email)
values('le04','4444444','馬','英九','S','1990-05-15','yu20111@yahoo.com.tw')
insert into user_spec(account,pswd,lastName,firstName,gender,birthday,email)
values('le05','555555','陳','德華','S','1990-05-15','yu20111@yahoo.com.tw')
insert into user_spec(account,pswd,lastName,firstName,gender,birthday,email)
values('le06','6666666','林','大大','S','1990-05-15','yu20111@yahoo.com.tw')
insert into user_spec(account,pswd,lastName,firstName,gender,birthday,email)
values('le07','777777','吳','宗憲','S','1990-05-15','yu20111@yahoo.com.tw')
insert into user_spec(account,pswd,lastName,firstName,gender,birthday,email)
values('le08','888888','王','安安','S','1990-05-15','yu20111@yahoo.com.tw')
insert into user_spec(account,pswd,lastName,firstName,gender,birthday,email)
values('le09','999999','業','華','S','1990-05-15','yu20111@yahoo.com.tw')
insert into user_spec(account,pswd,lastName,firstName,gender,birthday,email)
values('le10','101010','劉','華華','S','1990-05-15','yu20111@yahoo.com.tw')




select * from user_spec;

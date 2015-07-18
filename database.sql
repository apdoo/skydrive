--创建数据库
create database skydrive;
use skydrive;
--插入管理员用户
insert into user(username,password,opassword,signupTime,email,type,temp) values('admin','admin123','admin123','2015','11@qq.com','1','0');
--用户表     添加用户表id主键自增           //temp 用来存sessionid
CREATE TABLE user(
  id int NOT NULL AUTO_INCREMENT primary key,
	username varchar(20),
  password varchar(20),
  opassword varchar(20),
	email varchar(30),
	signupTime varchar(30),
  initCapacity int,
  usedCapacity int,
  points int,
	income int,
	type int,
	loginIp varchar(20),
	loginTime  varchar(30),
	temp   varchar(100)
)default charset=utf8;
--网盘文件基本信息表
 CREATE TABLE filebaseinfo(
  id int NOT NULL AUTO_INCREMENT primary key,
  userId int,
  username varchar(20),
  uploadTime varchar(30),
  fileName  varchar(500),
  fileSize  varchar(10),
  fileType  varchar(10),
  fileFlag  varchar(2),
  downloads int
)default charset=utf8;
--下载记录ip表
  CREATE TABLE downloadlogs(
  id int NOT NULL AUTO_INCREMENT primary key,
  userId int,
  fileId int,
  fileName  varchar(100),
  ip varchar(20),
  downloadTime varchar(30)
)default charset=utf8;

--公告记录表
  CREATE TABLE announce(
  id int NOT NULL AUTO_INCREMENT primary key,
  userId int,
  userName varchar(20),
  title varchar(100),
  content  varchar(3000),
  type varchar(20),
  updatetime varchar(30)
)default charset=utf8;

--工单记录 2015-03-18 create
 create table TicketInfo(
   id int NOT NULL AUTO_INCREMENT primary key,
   ticketId int,
   userId int,
   userName varchar(20),
   title varchar(100),
   content  varchar(3000),
   status varchar(2),
   createTime  varchar(30)
)default charset=utf8;
--工单回复记录
  create table TicketReplay(
   id int NOT NULL AUTO_INCREMENT primary key,
   ticketId int,
   userId  int,
   userName varchar(20),
   relayUserId int,
   replayUserName  varchar(20),
   title varchar(100),
   content  varchar(3000),
   replayTime  varchar(30)
)default charset=utf8;

--消息记录表    2015-03-18 create
create table messagepri(
   id int NOT NULL AUTO_INCREMENT primary key,
   userId int,
   userName varchar(20),
   fromId int,
   fromName  varchar(20),
   messageTitle varchar(100),
   messageContent varchar(3000),
   sendTime   varchar(30),
   flag varchar(2)
)default charset=utf8;

--部署在skydrive数据库中的采集表
CREATE TABLE collectlogs(
  id int NOT NULL AUTO_INCREMENT primary key,
  resourceSite varchar(30),
  type varchar(10),
  name varchar(300),
  content  varchar(65535),
  resourceUrl  varchar(100),
  origDownloadUrl  varchar(100),
  downloadUrl  varchar(100),
  imgUrls varchar(200) ,
  updatetime varchar(30),
  section  varchar(30)
)default charset=utf8;

--2015-05-25 修改字段长度
alter table  collectlogs modify  column imgUrls varchar(2000) ;
--2015-06-01 新增字段section 用来储存采集的种子的板块
alter table collectlogs add section varchar(30);

--2015-06-05 发布日志表
 CREATE TABLE postlogs(
  id int NOT NULL AUTO_INCREMENT primary key,
  collectLogsId int,
  postSite varchar(30),
  postUrl varchar(100),
  postTime  varchar(30)
)default charset=utf8;



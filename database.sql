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
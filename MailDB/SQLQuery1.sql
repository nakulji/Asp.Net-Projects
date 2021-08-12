create database MailDB
Use MailDB

create table Account
(
Account_id numeric(8) identity(100,1) primary key,
Name nvarchar(30),
User_Name nvarchar(25) unique,
Password nvarchar(25),
Phone nvarchar(15),
)

drop table Account
select * from Account

insert into Account values('raj','mukesh@mail.com','mukesh','12345567')

create table Massage
(
Massage_id numeric(10) identity(1,1) primary key,
Compose_from nvarchar(25),
Compose_to nvarchar(25),
Sender_name nvarchar(25),
Receiver_name nvarchar(25),
Subject nvarchar(max),
Massage nvarchar(max),
Date nvarchar(20)
)

select * from Massage

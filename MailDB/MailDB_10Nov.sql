
use MailDB

select * from Massage
select *from Account

drop table Massage

create table Massage
(
Massage_id numeric(10) identity(1,1) primary key,
Compose_from nvarchar(25),
Compose_to nvarchar(25),
Sender_name nvarchar(25),
Receiver_name nvarchar(25),
Subject nvarchar(max),
Massage nvarchar(max),
_Date nvarchar(20),
_Time nvarchar(10)
)

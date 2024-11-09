﻿CREATE DATABASE QLY_BAN_CAFE
GO
USE QLY_BAN_CAFE
GO
CREATE TABLE TABLEFOOD(
 ID INT IDENTITY PRIMARY KEY,
 TEN NVARCHAR(100) not null DEFAULT N'Bàn chưa có tên' ,
 STATUS NVARCHAR(100) not null default N'Trống',
 )
 GO
 CREATE TABLE ACCOUNT(
  USERNAME NVARCHAR(100) PRIMARY KEY,
 DISPLAYNAME NVARCHAR(100) NOT NULL DEFAULT N'NHOMHAI',

 PASSWORD NVARCHAR(1000) NOT NULL DEFAULT 0,
 TYPE INT NOT NULL DEFAULT 0,
 )
 GO
 CREATE TABLE FOODCATEGORY(
 ID INT IDENTITY PRIMARY KEY,
 TEN NVARCHAR(100) NOT NULL DEFAULT N'CHƯA ĐẶT TÊN',

 )
 GO
 CREATE TABLE FOOD(
 ID INT IDENTITY PRIMARY KEY,
 TEN NVARCHAR(100)NOT NULL DEFAULT N'CHƯA ĐẶT TÊN',
 IDCATEGORY INT NOT NULL,
 PRICE FLOAT NOT NULL DEFAULT 0,

 foreign key (IDCATEGORY) REFERENCES FOODCATEGORY(ID)

 )
 GO
 CREATE TABLE BILL(
 ID INT IDENTITY PRIMARY KEY,
 DATECHECKIN DATE NOT NULL DEFAULT GETDATE(),
 DATECHECKOUT DATE,
 IDTABLE INT NOT NULL,
 STATUS INT NOT NULL DEFAULT 0, 
 foreign key (IDTABLE) REFERENCES TABLEFOOD(ID)
 )
 GO
 CREATE TABLE BILLINFO(
 ID INT IDENTITY PRIMARY KEY
 ,IDBILL INT NOT NULL,
 IDFOOD INT NOT NULL,
 COUNT INT NOT NULL DEFAULT 0,
  foreign key (IDBILL) REFERENCES BILL(ID),
   foreign key (IDFOOD) REFERENCES FOOD(ID)

 )
 GO

 INSERT INTO ACCOUNT
 (
 DISPLAYNAME ,
 USERNAME ,
 PASSWORD ,
 TYPE 
 )
 VALUES
 (
 N'VINH123',
 N'QUANG VINH',
 N'0123',
 1
 )
  INSERT INTO ACCOUNT
 (
 DISPLAYNAME ,
 USERNAME ,
 PASSWORD ,
 TYPE 
 )
 VALUES
 (
 N'TOAN123',
 N'QUOC TOAN',
 N'2345',
 0
 

 )
 go
 select*from ACCOUNT
 go

 create proc USP_GetAccountByUserName
 @userName nvarchar(100)
 as
 begin
 select*from ACCOUNT WHERE USERNAME=@userName
 END
 GO
 EXEC USP_GetAccountByUserName @userName=N'QUANG VINH'
 select*from ACCOUNT
 go

 CREATE OR ALTER PROC  USP_Login
 @userName nvarchar(100), @passWord nvarchar(1000)
 as 
 begin 
	SELECT * FROM ACCOUNT WHERE USERNAME=@userName AND PASSWORD=@passWord
	END
	GO
	EXEC USP_Login @userName = N'QUOC TOAN',@passWord=N'2345'

DECLARE @i int = 1
while @i <10
begin
insert into TABLEFOOD (TEN) values (N'Bàn' + cast(@i as nvarchar(100)))
set @i =@i +1
end

select *from TABLEFOOD
GO
 CREATE PROC USP_TABLELIST
 AS
 BEGIN
 SELECT*FROM TABLEFOOD
 END
 GO
 EXEC USP_TABLELIST








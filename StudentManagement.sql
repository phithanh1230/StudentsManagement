CREATE DATABASE StudentManagement
USE StudentManagement
GO

--drop table student
--drop table class
--drop table StudentClass

CREATE TABLE Student(
	S_Id int identity(1,1) primary key,
	S_Name nvarchar(50) not null,
	S_Birthday datetime2 not null,
	S_Address nvarchar(70),
)

CREATE TABLE Class(
	C_Id int identity(1,1) primary key,
	C_Name nvarchar(30) not null
)
CREATE TABLE StudentClass(
	S_ID int not null,
	C_ID int not null,
	primary key (S_ID,C_ID),
	foreign key(S_ID) references Student(S_ID) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key(C_ID) references Class(C_ID) ON DELETE CASCADE ON UPDATE CASCADE
)

INSERT INTO Student(S_Name,S_Birthday,S_Address)
VALUES (N'Phạm Trung Phi Thành','11-27-1996',N'Ninh Thuận'),
(N'Huỳnh Ngô Minh Nghị','07-13-1996',N'Ninh Thuận'),(N'Tăng Thị Hoa','11-28-1996',N'Ninh Thuận'),
(N'Nguyễn Thành Đạt','03-07-1996',N'Phú Yên'),(N'Hoàng Tấn Trung','11-07-1993',N'Hà Nội'),
(N'Võ Thị Kim Viên','12-13-1996',N'Hồ Chí Minh'),(N'Hồ Nhã Hoàng Yến','01-04-1992',N'Bình Thuận'),
(N'Lại Xuân Thời','10-16-1996',N'Bến Tre'),(N'Lại Thành Công','06-03-1987',N'Bến Tre'),
(N'Võ Phú Minh Nhân','05-10-1995',N'Gia Lai')

INSERT INTO Class(C_Name)
VALUES ('C_135'),('C_136'),('C_137'),('C_138')

INSERT INTO StudentClass(S_ID,C_ID)
VALUES (1,1),(2,1),(3,1),(4,2),(5,2),(6,2),
(7,3),(8,3),(9,4),(10,4),(3,2),(3,3),(4,4),(5,4)
GO

CREATE PROC FindStudents
	@Name nvarchar(30)
As
	Select * from Student
	where S_Name like N'%'+@Name+'%'
GO

CREATE PROC FindClasses
	@Name nvarchar(30)
As
	Select * from Class
	where C_Name like N'%'+@Name+'%'
GO

CREATE PROC FindClassByStudentName
	@Name nvarchar(30)
AS
	SELECT C.C_Name
	from Student S
	left join StudentClass SC on S.S_Id = SC.S_ID
	left join Class C on SC.C_ID= C.C_Id
	where S_Name like N'%'+@Name+'%'
GO

CREATE PROC FindStudentsInClass
	@Name nvarchar(30)
AS
	SELECT S_Name,S_Address
	from Student S
	left join StudentClass SC on S.S_Id = SC.S_ID
	left join Class C on SC.C_ID= C.C_Id
	where C_Name like N'%'+@Name+'%'
GO


SELECT S_Name,S_Address,C_Name
	from Student S
	left join StudentClass SC on S.S_Id = SC.S_ID
	left join Class C on SC.C_ID= C.C_Id
	where C_Name like 'N%C_135%'
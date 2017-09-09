CREATE DATABASE SHOES
GO
USE SHOES
GO
CREATE TABLE Customer
(
	id int IDENTITY(1,1) constraint pk_customerid Primary key,
	name varchar(50),
	[address] [varchar](50),
	phone varchar(12),
	email varchar(30),
)
CREATE TABLE Employee
(
	id int identity(1,1) constraint pk_empid Primary key,
	name nvarchar(50),
	[address] nvarchar(50),
	phone varchar(12),
	email varchar(30),
	department_id int
)
GO

CREATE TABLE Category
(
	id int identity(1,1) constraint pk_categoryid Primary key,
	name nvarchar(50),
	[image] varchar(255),
	parent_id int,
	sort_id int,
	[Status] nvarchar(50)
)
GO

CREATE TABLE Product
(
	id int identity(1,1) constraint pk_productid Primary key,
	[description] nvarchar(50),
	price float,
	discount float,
	category_id int constraint fk_categoryid Foreign Key References Category(id) not null,
	[image] varchar(255),
	sort_id int,
	[date] datetime default getdate(),
	[Status] nvarchar(50)
)
GO
CREATE TABLE ImageProduct
(
	id int identity(1,1) constraint pk_imageProduct Primary key,
	product_id int constraint fk_imageProduct Foreign Key References Product(id) not null,
	[image] varchar(255),
)
GO

CREATE TABLE [Order]
(
	id [int] identity(1,1) constraint pk_orderid Primary key,
	[date] datetime,
	[status] varchar(30),
	customer_id int constraint fk_customerid Foreign Key References Customer(id),
	employee_id int constraint fk_employeeid Foreign Key References Employee(id)
)
GO

CREATE TABLE [OrderDetail]
(
	id [int] identity(1,1) constraint pk_orderdetailid Primary key,
	order_id int constraint fk_orderid Foreign Key References [Order](id),
	product_id int constraint fk_productid Foreign Key References Product(id),
	quantity int,
	price float,
	discount float
)


-----------------Insert roles-------------------

Insert into [dbo].[AspNetRoles] Values(newid(),'admin')
Insert into [dbo].[AspNetRoles] Values(newid(),'employee')
Insert into [dbo].[AspNetRoles] Values(newid(),'customer')


Insert into [dbo].[AspNetUserRoles]  select u.Id,r.Id from [dbo].[AspNetUsers] u, [dbo].[AspNetRoles] r
where u.Email='khanh.ngoba@gmail.com' and r.Name='admin'
-----------------Insert category-----------------

INSERT [dbo].[Category] ([name], [image], [parent_id], [sort_id], [Status]) VALUES ( N'Giày Thể Thao Nam', N'1.jpg', 0, 0, N'Enable')
INSERT [dbo].[Category] ([name], [image], [parent_id], [sort_id], [Status]) VALUES ( N'Giày Boot Nam', N'giaybootnam.jpg', 0, 0, N'Enable')
INSERT [dbo].[Category] ([name], [image], [parent_id], [sort_id], [Status]) VALUES (N'Giày Mọi Nam', N'giaymoinam.jpg', 0, 0, N'Enable')
INSERT [dbo].[Category] ([name], [image], [parent_id], [sort_id], [Status]) VALUES (N'Giày Boot Nữ Hàn Quốc', N'giaybootnuhanquoc.jpg', 0, 0, N'Enable')
INSERT [dbo].[Category] ([name], [image], [parent_id], [sort_id], [Status]) VALUES (N'Giày Thể Thao Nữ', N'giaythethaonu.jpg', 0, 0, N'Enable')
INSERT [dbo].[Category] ([name], [image], [parent_id], [sort_id], [Status]) VALUES (N'Giày Sandal Nữ', N'sandalnu.jpg', 0, 0, N'Enable')
INSERT [dbo].[Category] ([name], [image], [parent_id], [sort_id], [Status]) VALUES (N'Giày Oxford Nữ', N'giayoxfordnu.jpg', 0, 0, N'Enable')
INSERT [dbo].[Category] ([name], [image], [parent_id], [sort_id], [Status]) VALUES (N'Giày Cặp Đôi', N'giaycapdoi.jpg', 0, 0, N'Enable')

------------------------------------------------

-----------------Insert product-----------------

INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày Vans', 300000, 2, 1, N'2.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nam NA 830', 395000, 5, 1, N'1.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nam NA 863', 350000, 2, 1, N'3.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nam NA 860', 400000, 6, 1, N'7.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nam NK cao cổ', 250000, 5, 1, N'4.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày chuck II da nam NA 846', 350000, 8, 1, N'10.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nam NA 843', 320000, 7, 1, N'11.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nam NA 842', 400000, 0, 1, N'20.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nam NA 843', 430000, 3, 1, N'14.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nam NA 829', 300000, 5, 1, N'51.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao HI nam NA 828', 520000, 7, 1, N'22.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nam NA 825', 435000, 15, 1, N'45.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nam NA 777', 450000, 5, 1, N'31.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao ADI NA 787', 465000, 12, 1, N'34.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao ADI - NA 722', 375000, 15, 1, N'35.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày AIR MAX nam NA 665', 465000, 15, 1, N'59.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày oxford nam NA 600', 395000, 10, 1, N'60.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao con gà NA 800', 375000, 9, 1, N'57.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nạm NA 799', 345000, 3, 1, N'43.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao ADI nam NA 793', 465000, 9, 1, N'41.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nam NA 775', 415000, 2, 1, N'50.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nam NA 773', 400000, 10, 1, N'29.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao RUNNING NA 687', 370000, 3, 1, N'51.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nam NA 741', 395000, 0, 1, N'52.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao con gà NA 764', 345000, 6, 1, N'20.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày chuck 2 cổ cao NU 918', 370000, 4, 1, N'19.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày chuck 2 lính NA 841', 370000, 2, 1, N'18.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nam NA 854', 300000, 1, 1, N'6.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nam NA 829', 360000, 3, 1, N'22.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao ADI nam NA 755', 415000, 10, 1, N'58.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao ADI NA 787', 465000, 8, 1, N'34.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao ADI nam NA 796', 365000, 0, 1, N'54.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nam NA 819', 475000, 3, 1, N'40.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nam NA 785', 360000, 4, 1, N'28.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nam NA 785', 385000, 3, 1, N'27.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nam NA 785', 395000, 15, 1, N'55.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày Boot cực cá tính NA 285', 395000, 15, 2, N'bn1.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot Carty Paolo cực phong cách NA 111', 400000, 10, 2, N'bn3.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày Boot cực chất dành cho boys- NA 310', 445000, 15, 2, N'bn5.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao ADI - NA 723', 385000, 10, 1, N'49.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày Adidas nam phong cách NA 221', 350000, 5, 1, N'14.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot nam cá tính, mạnh mẽ NA 111', 495000, 16, 2, N'bn3.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày Boot cực chất dành cho boys- NA 310', 485000, 10, 2, N'bn4.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot Monkey nam NA 593', 445000, 15, 5, N'bn7.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày DR cổ lửng NA 815', 495000, 10, 2, N'bn6.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot DR da lộn NA 719', 1200000, 10, 2, N'bn7.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot DR da lộn NA 690', 585000, 10, 2, N'bn8.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot nam cá tính NA 753', 685000, 10, 2, N'bn9.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot nam cá tính NA 753', 385000, 10, 2, N'bn10.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot cổ cao NA 672', 495000, 10, 2, N'bn11.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày Boot nam mẫu mới NA 549', 475000, 10, 2, N'bn12.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot oxford nam NA 770', 455000, 10, 2, N'bn13.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot oxford nam NA 770', 435000, 10, 2, N'bn14.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày nam sành điệu NA 626', 480000, 10, 2, N'bn15.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày nam sành điệu NA 626', 496000, 10, 2, N'bn16.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot nam đẹp NA 754', 985000, 10, 2, N'bn17.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot nam đẹp NA 750', 885000, 10, 2, N'bn18.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot nam cá tính NA 574', 785000, 10, 2, N'bn19.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot nam cá tính NA 578', 385000, 10, 2, N'bn20.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày Boot nam mẫu mới NA 549', 555000, 10, 2, N'bn21.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot sang trọng NA 718', 675000, 10, 2, N'bn22.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot DR da lộn NA 719', 500000, 10, 2, N'bn23.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot DR da lộn NA 719', 450000, 10, 2, N'bn24.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày DR cổ ngắn NA 721', 470000, 10, 2, N'bn25.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot DR nam NA 695', 595000, 10, 2, N'bn26.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot DR da thật NA 618', 785000, 10, 2, N'bn27.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot dr da lộn NA 697', 585000, 10, 2, N'bn28.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày Boot Oxford cao cấp NA 300', 285000, 10, 2, N'bn29.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày nam sành điệu NA 626', 475000, 10, 2, N'bn30.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot nam cực chất NA 765', 465000, 10, 2, N'bn31.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot nam cực chất cổ ngắn NA 789', 425000, 10, 2, N'bn32.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày Timberland da thật usa NA 404', 435000, 10, 2, N'bn33.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày Boot cá tính cực chất dành cho boys- NA 310', 415000, 10, 2, N'bn34.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày Boot cực chất dành cho boys- HA 512', 615000, 10, 2, N'bn35.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày Boot cực chất VA 698', 545000, 10, 2, N'bn36.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 868', 345000, 10, 3, N'm1.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 858', 282000, 10, 3, N'm2.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 848', 45000, 10, 3, N'm3.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 838', 295000, 10, 3, N'm4.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 828', 258000, 10, 3, N'm5.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 818', 300000, 10, 3, N'm6.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 808', 315000, 10, 3, N'm7.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 789', 325000, 10, 3, N'm8.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 500', 345000, 10, 3, N'm9.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 245', 355000, 10, 3, N'm10.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 457', 360000, 10, 3, N'm11.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 785', 320000, 10, 3, N'm12.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 124', 350000, 10, 3, N'm13.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 147', 330000, 10, 3, N'm14.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 963', 310000, 10, 3, N'm15.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 457', 275000, 10, 3, N'm16.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 235', 285000, 10, 3, N'm17.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 147', 235000, 10, 3, N'm18.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 256', 2585000, 10, 3, N'm19.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 123', 425000, 10, 3, N'm20.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 459', 435000, 10, 3, N'm21.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 245', 415000, 10, 3, N'm22.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 757', 365000, 10, 3, N'm23.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày lười nam NA 148', 395000, 10, 3, N'm24.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày Boot cao gót cá tínhcho girls NU 271', 550000, 15, 4, N'b1.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot dr cực chất NU 566', 450000, 20, 4, N'b2.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot da cá tính NU 549', 580000, 15, 4, N'b3.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot nữ đế gỗ NU 518', 470000, 8, 4, N'b4.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày Boot nữ cực chất NU 350', 600000, 15, 4, N'b5.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot cao gót NU 559', 473000, 15, 4, N'b6.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot dây kéo nữ NU 519', 250000, 0, 4, N'b7.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot cá tính nữ NU 508', 508000, 15, 4, N'b8.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot cá tính nữ NU 509', 550000, 7, 4, N'b9.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot cá tính nữ NU 145', 560000, 15, 4, N'b10.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot đế gỗ NU 522', 300000, 15, 4, N'b11.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày boot dr cực chất NU 566', 400000, 9, 4, N'b12.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày Boot nữ cực chất- NU 350', 520000, 10, 4, N'b13.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày Boot cực phong cách cho girls NU 360', 500000, 15, 4, N'b14.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nữ NU 941', 500000, 15, 5, N't1.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nữ NU 940', 550000, 8, 5, N't2.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nữ NU 800', 400000, 6, 5, N't3.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nữ NU 957', 300000, 15, 5, N't4.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nữ NU 655', 350000, 7, 5, N't5.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nữ NU 257', 450000, 4, 5, N't6.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nữ NU 227', 280000, 4, 5, N't7.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nữ NU 968', 270000, 10, 5, N't8.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nữ NU 987', 290000, 20, 5, N't9.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nữ NU 988', 260000, 10, 5, N't10.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nữ NU 989', 350000, 9, 5, N't11.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nữ NU 999', 360000, 7, 5, N't12.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nữ NU 654', 450000, 8, 5, N't13.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nữ NU 653', 470000, 7, 5, N't14.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nữ NU 652', 490000, 4, 5, N't15.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nữ NU 651', 570000, 9, 5, N't16.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao nữ NU 650', 240000, 10, 5, N't17.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày oxford nữ NU 957', 300000, 15, 6, N'o1.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày oxford nữ NU 655', 350000, 7, 6, N'o1.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày oxford nữ NU 257', 450000, 4, 6, N'o3.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày oxford nữ NU 227', 280000, 4, 6, N'o4.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày oxford nữ NU 968', 270000, 10, 6, N'o4.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày oxford nữ NU 987', 290000, 20, 6, N'o6.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày oxford nữ NU 988', 260000, 10, 6, N'o7.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày oxford nữ NU 989', 350000, 9, 6, N'o8.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày oxford nữ NU 999', 360000, 7, 6, N'o9.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày oxford nữ NU 654', 450000, 8, 6, N'o10.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày oxford nữ NU 653', 470000, 7, 6, N'o11.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày oxford nữ NU 568', 490000, 4, 6, N'o12.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày oxford nữ NU 651', 570000, 9, 6, N'o13.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày oxford nữ NU 650', 240000, 10, 6, N'o14.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Mẫu Chiến Binh mới nhất NU 429', 300000, 15, 7, N's1.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày cao gót vuông nơ NU 902', 350000, 7, 7, N's1.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày sandal nữ đẹp NU 822', 450000, 4, 7, N's3.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày sandal quai chéo NU 900', 280000, 4, 7, N's4.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Dép ba quai nữ NU 817', 270000, 10, 7, N's5.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày sandal nữ đẹp NU 987', 290000, 20, 7, N's6.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày sandal nữ đẹp NU NU 988', 260000, 10, 7, N's7.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày sandal nữ đẹp NU 989', 350000, 9, 7, N's8.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày sandal nữ đẹp NU 999', 360000, 7, 7, N's9.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày sandal nữ đẹp NU 654', 450000, 8, 7, N's10.jpg', 0, N'Enable')


INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao đôi NN 113', 570000, 9, 8, N'c1.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao cặp NN 123', 240000, 10, 8, N'c2.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày ADI phun sơn NN 122', 300000, 15, 8, N'c3.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao force NN 121', 350000, 7, 8, N'c4.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao đế ráp NN 120', 450000, 4, 8, N'c5.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày slip on da NN 119', 280000, 4, 8, N'c6.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao đế ráp NN 120', 270000, 10, 8, N'c7.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày thể thao cặp NN 125', 290000, 20, 8, N'c8.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày cặp đôi NA 234', 260000, 10, 8, N'c9.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày ADD cặp đẹp NU 989', 350000, 8, 8, N'c10.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày chuck II nữ đẹp NU 999', 360000, 7, 8, N'c11.jpg', 0, N'Enable')
INSERT [dbo].[Product] ([description], [price], [discount], [category_id], [image], [sort_id], [Status]) VALUES (N'Giày Ván cặp đẹp NU 654', 450000, 8, 8, N'c12.jpg', 0, N'Enable')
------------------------------------------------


--------------Insert ImageProdcut---------------

INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (1, N'2.jpg,3.jpg,4.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (2, N'3.jpg,4.jpg,5.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (3, N'4.jpg,5.jpg,6.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (4, N'5.jpg,6.jpg,7.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (5, N'8.jpg,9.jpg,10.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (6, N'11.jpg,12.jpg,13.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (7, N'8.jpg,9.jpg,10.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (8, N'9.jpg,10.jpg,11.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (9, N'10.jpg,11.jpg,12.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (10, N'11.jpg,12.jpg,13.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (11, N'10.jpg,13.jpg,12.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (12, N'10.jpg,11.jpg,13.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (13, N'10.jpg,11.jpg,12.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (14, N'3.jpg,4.jpg,5.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (15, N'18.jpg,37.jpg,20.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (16, N'30.jpg,18.jpg,40.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (17, N'33.jpg,40.jpg,9.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (18, N'34.jpg,9.jpg,19.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (19, N'11.jpg,12.jpg,13.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (20, N'45.jpg,50.jpg,38.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (21, N'14.jpg,36.jpg,19.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (22, N'35.jpg,27.jpg,18.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (23, N'20.jpg,21.jpg,22.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (24, N'26.jpg,21.jpg,22.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (25, N'26.jpg,27.jpg,28.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (26, N'27.jpg,28.jpg,29.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (27, N'50.jpg,32.jpg,29.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (28, N'54.jpg,30.jpg,31.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (29, N'30.jpg,31.jpg,21.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (30, N'31.jpg,38.jpg,33.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (31, N'32.jpg,50.jpg,34.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (32, N'33.jpg,34.jpg,35.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (33, N'34.jpg,35.jpg,36.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (34, N'35.jpg,36.jpg,37.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (35, N'36.jpg,37.jpg,38.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (36, N'37.jpg,38.jpg,39.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (37, N'bn2.jpg,bn1.jpg,bn2.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (38, N'bn4.jpg,bn3.jpg,bn4.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (39, N'bn6.jpg,bn5.jpg,bn6.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (40, N'49.jpg,33.jpg,37.jpg,3.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (41, N'14.jpg,14_1.jpg,14_2.jpg,14_3.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (42, N'bn4.jpg,bn3.jpg,bn4.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (43, N'bn5.jpg,bn6.jpg,bn5.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (44, N'bn7.jpg,bn6.jpg,bn5.jpg,bn7.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (45, N'bn5.jpg,bn6.jpg,bn5.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (46, N'bn8.jpg,bn7.jpg,bn8.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (47, N'bn9.jpg,bn8.jpg,bn9.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (48, N'bn10.jpg,bn9.jpg,bn10.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (49, N'bn11.jpg,bn10.jpg,bn11.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (50, N'bn12.jpg,bn11.jpg,bn12.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (51, N'bn13.jpg,bn12.jpg,bn13.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (52, N'bn14.jpg,bn13.jpg,bn14.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (53, N'bn15.jpg,bn14.jpg,bn15.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (54, N'bn16.jpg,bn15.jpg,bn16.jpg,bn7.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (55, N'bn17.jpg,bn16.jpg,bn17.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (56, N'bn18.jpg,bn17.jpg,bn18.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (57, N'bn19.jpg,bn18.jpg,bn19.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (58, N'bn20.jpg,bn19.jpg,bn20.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (59, N'bn21.jpg,bn20.jpg,bn21.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (60, N'bn22.jpg,bn21.jpg,bn22.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (61, N'bn23.jpg,bn22.jpg,bn23.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (62, N'bn24.jpg,bn23.jpg,bn24.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (63, N'bn25.jpg,bn24.jpg,bn25.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (64, N'bn26.jpg,bn25.jpg,bn26.jpg,bn7.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (65, N'bn27.jpg,bn26.jpg,bn27.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (66, N'bn28.jpg,bn27.jpg,bn28.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (67, N'bn29.jpg,bn28.jpg,bn29.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (68, N'bn30.jpg,bn29.jpg,bn30.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (69, N'bn31.jpg,bn30.jpg,bn31.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (70, N'bn32.jpg,bn31.jpg,bn32.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (71, N'bn33.jpg,bn32.jpg,bn33.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (72, N'bn34.jpg,bn33.jpg,bn34.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (73, N'bn35.jpg,bn34.jpg,bn35.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (74, N'bn36.jpg,bn35.jpg,bn36.jpg,bn7.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (75, N'bn37.jpg,bn36.jpg,bn37.jpg,bn7.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (76, N'm1.jpg,m2.jpg,m1.jpg,m2.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (77, N'm2.jpg,m3.jpg,m2.jpg,m3.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (78, N'm3.jpg,m4.jpg,m3.jpg,m4.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (79, N'm4.jpg,m5.jpg,m4.jpg,m5.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (80, N'm5.jpg,m6.jpg,m5.jpg,m6.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (81, N'm6.jpg,m7.jpg,m6.jpg,m7.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (82, N'm7.jpg,m8.jpg,m7.jpg,m8.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (83, N'm8.jpg,m9.jpg,m8.jpg,m9.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (84, N'm9.jpg,m10.jpg,m9.jpg,m10.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (85, N'm10.jpg,m11.jpg,m10.jpg,m11.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (86, N'm11.jpg,m12.jpg,m11.jpg,m12.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (87, N'm12.jpg,m13.jpg,m12.jpg,m13.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (88, N'm13.jpg,m14.jpg,m13.jpg,m14.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (89, N'm14.jpg,m15.jpg,m14.jpg,m15.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (90, N'm15.jpg,m16.jpg,m15.jpg,m16.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (91, N'm16.jpg,m17.jpg,m16.jpg,m17.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (92, N'm17.jpg,m18.jpg,m17.jpg,m18.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (93, N'm18.jpg,m19.jpg,m18.jpg,m19.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (94, N'm19.jpg,m20.jpg,m19.jpg,m20.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (95, N'm20.jpg,m21.jpg,m20.jpg,m21.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (96, N'm21.jpg,m22.jpg,m21.jpg,m22.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (97, N'm22.jpg,m23.jpg,m22.jpg,m23.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (98, N'm23.jpg,m24.jpg,m23.jpg,m24.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (99, N'm24.jpg,m1.jpg,m24.jpg,m1.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (101, N'b3.jpg,b2.jpg,b3.jpg,b2.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (102, N'b4.jpg,b3.jpg,b4.jpg,b3.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (103, N'b5.jpg,b4.jpg,b5.jpg,b4.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (104, N'b6.jpg,b5.jpg,b6.jpg,b5.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (105, N'b7.jpg,b6.jpg,b7.jpg,b6.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (106, N'b8.jpg,b7.jpg,b8.jpg,b7.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (107, N'b9.jpg,b8.jpg,b9.jpg,b8.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (108, N'b10.jpg,b9.jpg,b10.jpg,b9.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (109, N'b11.jpg,b10.jpg,b11.jpg,b10.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (110, N'b12.jpg,b11.jpg,b12.jpg,b11.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (111, N'b13.jpg,b12.jpg,b13.jpg,b12.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (112, N'b14.jpg,b13.jpg,b14.jpg,b13.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (113, N'b13.jpg,b14.jpg,b13.jpg,b14.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (114, N'b13.jpg,b14.jpg,b13.jpg,b14.jpg')

INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (115, N't1.jpg,t2.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (116, N't2.jpg,t3.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (117, N't3.jpg,t4.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (118, N't4.jpg,t5.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (119, N't5.jpg,t6.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (120, N't6.jpg,t7.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (121, N't7.jpg,t8.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (122, N't8.jpg,t9.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (123, N't9.jpg,t10.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (124, N't10.jpg,t11.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (125, N't11.jpg,t12.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (126, N't12.jpg,t13.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (127, N't13.jpg,t14.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (128, N't14.jpg,t15.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (129, N't15.jpg,t16.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (130, N't16.jpg,t17.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (131, N't1.jpg,t2.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (132, N'o1.jpg,o2.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (133, N'o2.jpg,o3.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (134, N'o3.jpg,o4.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (135, N'o4.jpg,o5.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (136, N'o5.jpg,o6.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (137, N'o6.jpg,o7.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (138, N'o7.jpg,o8.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (139, N'o8.jpg,o9.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (140, N'o9.jpg,o10.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (141, N'o10.jpg,o11.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (142, N'o11.jpg,o12.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (143, N'o12.jpg,o13.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (144, N'o13.jpg,o14.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (145, N'o14.jpg,o1.jpg')

INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (146, N's1.jpg,s2.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (147, N's2.jpg,s3.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (148, N's3.jpg,s4.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (149, N's4.jpg,s5.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (150, N's5.jpg,s6.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (151, N's6.jpg,s7.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (152, N's7.jpg,s8.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (153, N's8.jpg,s9.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (154, N's9.jpg,s10.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (155, N's10.jpg,s11.jpg')

INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (156, N'c1.jpg,c2.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (157, N'c2.jpg,c3.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (158, N'c3.jpg,c4.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (159, N'c4.jpg,c5.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (160, N'c5.jpg,c6.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (161, N'c6.jpg,c7.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (162, N'c7.jpg,c8.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (163, N'c8.jpg,c9.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (164, N'c9.jpg,c10.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (165, N'c10.jpg,c11.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (166, N'c7.jpg,c8.jpg')
INSERT [dbo].[ImageProduct] ([product_id], [image]) VALUES (167, N'c11.jpg,c12.jpg')

------------------------------------------------
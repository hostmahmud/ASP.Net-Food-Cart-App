USE [master]
GO

/****** 
#Object:  Database [foodDB]    Script Date: 01-Jul-21 10:27:13 AM 
#Created by Mahmud Sabuj
#IsDB BISEW Round-45
#Phone 01629613653
******/

CREATE DATABASE [foodDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'foodDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\foodDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'foodDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\foodDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [foodDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [foodDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [foodDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [foodDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [foodDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [foodDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [foodDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [foodDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [foodDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [foodDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [foodDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [foodDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [foodDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [foodDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [foodDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [foodDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [foodDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [foodDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [foodDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [foodDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [foodDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [foodDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [foodDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [foodDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [foodDB] SET RECOVERY FULL 
GO
ALTER DATABASE [foodDB] SET  MULTI_USER 
GO
ALTER DATABASE [foodDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [foodDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [foodDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [foodDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [foodDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [foodDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'foodDB', N'ON'
GO
ALTER DATABASE [foodDB] SET QUERY_STORE = OFF
GO
USE [foodDB]
GO
/****** Object:  Table [dbo].[tbl_forgetPassword]    Script Date: 01-Jul-21 10:27:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_forgetPassword](
	[Id] [varchar](100) NOT NULL,
	[Uid] [int] NOT NULL,
	[RequestDateTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_location]    Script Date: 01-Jul-21 10:27:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_location](
	[l_id] [int] IDENTITY(1,1) NOT NULL,
	[r_id] [int] NOT NULL,
	[l_state] [varchar](20) NULL,
	[l_city] [varchar](20) NOT NULL,
	[l_address] [varchar](100) NOT NULL,
	[l_zip] [varchar](10) NOT NULL,
 CONSTRAINT [PK__tbl_loca__A7C7B6F842496243] PRIMARY KEY CLUSTERED 
(
	[l_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_orders]    Script Date: 01-Jul-21 10:27:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_orders](
	[Id] [varchar](15) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Items] [varchar](300) NOT NULL,
	[Subtotal] [varchar](50) NULL,
	[Charge] [varchar](50) NULL,
	[Total] [varchar](50) NULL,
	[PMethod] [varchar](15) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Street] [varchar](50) NOT NULL,
	[City] [varchar](15) NOT NULL,
	[Zip] [varchar](10) NOT NULL,
	[Status] [varchar](15) NULL,
 CONSTRAINT [PK_tbl_orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_orders_cardDetails]    Script Date: 01-Jul-21 10:27:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_orders_cardDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [varchar](15) NOT NULL,
	[CardNumber] [varchar](20) NOT NULL,
	[CardExpiry] [varchar](10) NOT NULL,
	[CardCVV] [varchar](3) NOT NULL,
	[CardholderName] [varchar](50) NOT NULL,
 CONSTRAINT [PK__tbl_orde__3214EC07F7BDE993] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_restaurant]    Script Date: 01-Jul-21 10:27:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_restaurant](
	[r_id] [int] IDENTITY(1,1) NOT NULL,
	[r_name] [varchar](50) NOT NULL,
	[r_category] [varchar](30) NOT NULL,
	[r_desc] [varchar](200) NOT NULL,
	[r_banner_img] [varchar](100) NOT NULL,
	[r_logo] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[r_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_RestaurantMenu]    Script Date: 01-Jul-21 10:27:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_RestaurantMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RestaurantId] [int] NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Price] [money] NOT NULL,
	[ShortDesc] [varchar](200) NOT NULL,
	[Image] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_RestaurantMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_users]    Script Date: 01-Jul-21 10:27:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_users](
	[uId] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](20) NOT NULL,
	[lastName] [varchar](20) NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[role] [varchar](20) NULL,
	[dob] [datetime] NULL,
 CONSTRAINT [PK_tbl_users] PRIMARY KEY CLUSTERED 
(
	[uId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_forgetPassword] ([Id], [Uid], [RequestDateTime]) VALUES (N'a8dea756-37b9-4da3-a1ab-e638910c93c4', 2, CAST(N'2021-06-22T03:01:22.667' AS DateTime))
INSERT [dbo].[tbl_forgetPassword] ([Id], [Uid], [RequestDateTime]) VALUES (N'37386efe-d800-4ac0-a8b4-cfefb525f666', 2, CAST(N'2021-06-22T10:42:38.837' AS DateTime))
INSERT [dbo].[tbl_forgetPassword] ([Id], [Uid], [RequestDateTime]) VALUES (N'67c8eba3-0e0c-4b1c-bd52-f07e2012a24c', 2, CAST(N'2021-06-22T10:56:55.087' AS DateTime))
INSERT [dbo].[tbl_forgetPassword] ([Id], [Uid], [RequestDateTime]) VALUES (N'1e61a270-4a8b-4ef2-beec-0fb4421019ee', 2, CAST(N'2021-06-22T11:10:53.520' AS DateTime))
INSERT [dbo].[tbl_forgetPassword] ([Id], [Uid], [RequestDateTime]) VALUES (N'cabb3817-71e8-43c8-a988-6a56b7e2dc97', 2, CAST(N'2021-06-22T11:25:35.350' AS DateTime))
INSERT [dbo].[tbl_forgetPassword] ([Id], [Uid], [RequestDateTime]) VALUES (N'79908111-0512-4faf-b20e-a211fe8ed094', 1, CAST(N'2021-06-22T11:52:29.893' AS DateTime))
INSERT [dbo].[tbl_forgetPassword] ([Id], [Uid], [RequestDateTime]) VALUES (N'ef3c5fce-79f9-4784-9c03-8450aa233872', 1, CAST(N'2021-06-22T11:55:18.340' AS DateTime))
INSERT [dbo].[tbl_forgetPassword] ([Id], [Uid], [RequestDateTime]) VALUES (N'9ac54b91-f63f-4273-b362-6e6d84631ba4', 1, CAST(N'2021-06-22T11:58:45.583' AS DateTime))
INSERT [dbo].[tbl_forgetPassword] ([Id], [Uid], [RequestDateTime]) VALUES (N'1f3fba68-9b9b-4092-a2c4-74dc5359f25f', 1, CAST(N'2021-06-22T12:01:18.027' AS DateTime))
INSERT [dbo].[tbl_forgetPassword] ([Id], [Uid], [RequestDateTime]) VALUES (N'8721fa1f-813f-47a3-b9a8-0f57f5c4fc48', 1, CAST(N'2021-06-25T12:17:52.847' AS DateTime))
INSERT [dbo].[tbl_forgetPassword] ([Id], [Uid], [RequestDateTime]) VALUES (N'4c840a70-b500-4f45-9d03-c98b2e997fbd', 1, CAST(N'2021-06-26T14:38:04.637' AS DateTime))
INSERT [dbo].[tbl_forgetPassword] ([Id], [Uid], [RequestDateTime]) VALUES (N'e589e857-7b95-451f-b0d2-bfccf9c09cd7', 2, CAST(N'2021-06-22T11:10:55.997' AS DateTime))
INSERT [dbo].[tbl_forgetPassword] ([Id], [Uid], [RequestDateTime]) VALUES (N'ee5ee96e-c275-451f-8d57-e6add9b2e262', 2, CAST(N'2021-06-22T11:10:56.693' AS DateTime))
INSERT [dbo].[tbl_forgetPassword] ([Id], [Uid], [RequestDateTime]) VALUES (N'3d1ad616-07d6-4e99-b3e1-bfe443cd61bd', 2, CAST(N'2021-06-22T11:10:57.177' AS DateTime))
INSERT [dbo].[tbl_forgetPassword] ([Id], [Uid], [RequestDateTime]) VALUES (N'9d87bf7f-d123-4d55-8221-4c2c929cee00', 2, CAST(N'2021-06-22T11:11:27.497' AS DateTime))
INSERT [dbo].[tbl_forgetPassword] ([Id], [Uid], [RequestDateTime]) VALUES (N'd62767ca-39c3-438e-b479-43182b7b6da2', 1, CAST(N'2021-06-22T15:24:38.570' AS DateTime))
INSERT [dbo].[tbl_forgetPassword] ([Id], [Uid], [RequestDateTime]) VALUES (N'838066cf-7db0-473b-966a-f42f9fa295c1', 2, CAST(N'2021-06-22T11:20:14.590' AS DateTime))
INSERT [dbo].[tbl_forgetPassword] ([Id], [Uid], [RequestDateTime]) VALUES (N'6360a06e-17d9-4f91-9cd4-e0992baef311', 2, CAST(N'2021-06-22T11:20:47.900' AS DateTime))
INSERT [dbo].[tbl_forgetPassword] ([Id], [Uid], [RequestDateTime]) VALUES (N'9332d5fa-8f90-4cc4-b9a7-d6314fabb789', 2, CAST(N'2021-06-22T11:21:53.137' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbl_location] ON 

INSERT [dbo].[tbl_location] ([l_id], [r_id], [l_state], [l_city], [l_address], [l_zip]) VALUES (65, 77, N'Montana(MT)', N'Dhaka', N'3659 Oak Ridge Drive', N'1207')
INSERT [dbo].[tbl_location] ([l_id], [r_id], [l_state], [l_city], [l_address], [l_zip]) VALUES (66, 79, N'CTG', N'Chittagong', N'Sunny Building', N'4100')
INSERT [dbo].[tbl_location] ([l_id], [r_id], [l_state], [l_city], [l_address], [l_zip]) VALUES (67, 80, N'Bangladesh — Chittag', N'Comilla', N'Agrabad, choumohoni, agrabad', N'4100')
INSERT [dbo].[tbl_location] ([l_id], [r_id], [l_state], [l_city], [l_address], [l_zip]) VALUES (68, 81, N'Maine', N'Dhaka', N'428 Hinkle Lake Road', N'02109')
SET IDENTITY_INSERT [dbo].[tbl_location] OFF
GO
INSERT [dbo].[tbl_orders] ([Id], [CustomerId], [Items], [Subtotal], [Charge], [Total], [PMethod], [OrderDate], [Street], [City], [Zip], [Status]) VALUES (N'PM6282021013410', 1, N'sdfsdf x 2 = 464<br/>idb bisew x 1 = 100<br/>', N'564', N'50', N'614', N'cod', CAST(N'2021-06-28T13:34:10.000' AS DateTime), N'Agrabad, choumohoni, agrabad', N'Chittagong', N'4100', N'Cancelled')
INSERT [dbo].[tbl_orders] ([Id], [CustomerId], [Items], [Subtotal], [Charge], [Total], [PMethod], [OrderDate], [Street], [City], [Zip], [Status]) VALUES (N'PM6282021122450', 1, N'Ice Cream x 2 = 240<br/>Beguni x 2 = 60<br/>Singara x 1 = 10<br/>', N'310', N'50', N'360', N'cod', CAST(N'2021-06-28T12:24:50.903' AS DateTime), N'Agrabad, choumohoni, agrabad', N'Chittagong', N'4100', N'Pending')
GO
SET IDENTITY_INSERT [dbo].[tbl_orders_cardDetails] ON 

INSERT [dbo].[tbl_orders_cardDetails] ([Id], [OrderId], [CardNumber], [CardExpiry], [CardCVV], [CardholderName]) VALUES (3, N'AM6252021115520', N'4343 4343 4343 3434', N'12/21', N'123', N'Mahmud sabuj')
INSERT [dbo].[tbl_orders_cardDetails] ([Id], [OrderId], [CardNumber], [CardExpiry], [CardCVV], [CardholderName]) VALUES (7, N'PM6252021120414', N'4343 3343 4343 4343', N'12/21', N'123', N'Mahmud sabuj')
INSERT [dbo].[tbl_orders_cardDetails] ([Id], [OrderId], [CardNumber], [CardExpiry], [CardCVV], [CardholderName]) VALUES (8, N'PM6252021120535', N'4343 4334 3434 3434', N'12/21', N'123', N'Mahmud sabuj')
INSERT [dbo].[tbl_orders_cardDetails] ([Id], [OrderId], [CardNumber], [CardExpiry], [CardCVV], [CardholderName]) VALUES (9, N'PM6252021121139', N'4545 4545 4545 4545', N'12/11', N'123', N'Mahmud sabuj')
INSERT [dbo].[tbl_orders_cardDetails] ([Id], [OrderId], [CardNumber], [CardExpiry], [CardCVV], [CardholderName]) VALUES (10, N'AM6262021110134', N'4444 4444 4444 4444', N'12/21', N'123', N'Mahmud sabuj')
INSERT [dbo].[tbl_orders_cardDetails] ([Id], [OrderId], [CardNumber], [CardExpiry], [CardCVV], [CardholderName]) VALUES (11, N'AM6262021110432', N'4444 4444 4444 4444', N'56/56', N'234', N'Mahmud sabuj')
INSERT [dbo].[tbl_orders_cardDetails] ([Id], [OrderId], [CardNumber], [CardExpiry], [CardCVV], [CardholderName]) VALUES (12, N'PM6262021023632', N'4444 4444 4444 4444', N'12/21', N'123', N'Mahmud sabuj')
SET IDENTITY_INSERT [dbo].[tbl_orders_cardDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_restaurant] ON 

INSERT [dbo].[tbl_restaurant] ([r_id], [r_name], [r_category], [r_desc], [r_banner_img], [r_logo]) VALUES (77, N'Star Kabab Dhanmondi', N'Japanese', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s', N'restaurant-banner-77.jpg', N'restaurant-logo-77.jpg')
INSERT [dbo].[tbl_restaurant] ([r_id], [r_name], [r_category], [r_desc], [r_banner_img], [r_logo]) VALUES (79, N'Bir bangali restaurant', N'Italian', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s', N'restaurant-banner-79.png', N'restaurant-logo-79.png')
INSERT [dbo].[tbl_restaurant] ([r_id], [r_name], [r_category], [r_desc], [r_banner_img], [r_logo]) VALUES (80, N'Kacchi Bhai', N'Japanese', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s', N'restaurant-banner-80.jpg', N'restaurant-logo-80.jpg')
INSERT [dbo].[tbl_restaurant] ([r_id], [r_name], [r_category], [r_desc], [r_banner_img], [r_logo]) VALUES (81, N'Bikrompur Mistanno Vandar', N'Italian', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s', N'restaurant-banner-81.png', N'restaurant-logo-81.jpg')
SET IDENTITY_INSERT [dbo].[tbl_restaurant] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_RestaurantMenu] ON 

INSERT [dbo].[tbl_RestaurantMenu] ([Id], [RestaurantId], [Title], [Price], [ShortDesc], [Image]) VALUES (41, 77, N'Chicken Khichuri', 150.0000, N'Chicken khichuri is awesome', N'rest-menu-77-102149.jpg')
SET IDENTITY_INSERT [dbo].[tbl_RestaurantMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_users] ON 

INSERT [dbo].[tbl_users] ([uId], [firstName], [lastName], [email], [password], [role], [dob]) VALUES (1, N'Mahmud', N'Sabuj', N'yootunesbd@gmail.com', N'1234', NULL, NULL)
INSERT [dbo].[tbl_users] ([uId], [firstName], [lastName], [email], [password], [role], [dob]) VALUES (2, N'mahmud', N'Sabuj', N'admin@admin.com', N'1234', N'admin', NULL)
INSERT [dbo].[tbl_users] ([uId], [firstName], [lastName], [email], [password], [role], [dob]) VALUES (3, N'arif', N'khan', N'arif@gmail.com', N'1234', N'customer', CAST(N'2010-10-10T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_forg__3214EC0658651C8C]    Script Date: 01-Jul-21 10:27:13 AM ******/
ALTER TABLE [dbo].[tbl_forgetPassword] ADD  CONSTRAINT [UQ__tbl_forg__3214EC0658651C8C] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_forgetPassword]  WITH CHECK ADD  CONSTRAINT [fk_ForgotPass_UserTable] FOREIGN KEY([Uid])
REFERENCES [dbo].[tbl_users] ([uId])
GO
ALTER TABLE [dbo].[tbl_forgetPassword] CHECK CONSTRAINT [fk_ForgotPass_UserTable]
GO
ALTER TABLE [dbo].[tbl_location]  WITH CHECK ADD  CONSTRAINT [FK__tbl_locati__r_id__286302EC] FOREIGN KEY([r_id])
REFERENCES [dbo].[tbl_restaurant] ([r_id])
GO
ALTER TABLE [dbo].[tbl_location] CHECK CONSTRAINT [FK__tbl_locati__r_id__286302EC]
GO
ALTER TABLE [dbo].[tbl_orders]  WITH CHECK ADD  CONSTRAINT [FK__tbl_order__Custo__29221CFB] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[tbl_users] ([uId])
GO
ALTER TABLE [dbo].[tbl_orders] CHECK CONSTRAINT [FK__tbl_order__Custo__29221CFB]
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_tbl_RestaurantMenu]    Script Date: 01-Jul-21 10:27:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mahmud sabuj
-- Create date: 06 june, 2021
-- Description:	class asp project
-- =============================================
CREATE PROCEDURE [dbo].[sp_insert_tbl_RestaurantMenu]
	@RestaurantId int,
	@title varchar(100),
	@price money,
	@desc varchar(200),
	@img varchar(50)
AS
BEGIN
	INSERT INTO tbl_RestaurantMenu VALUES(@RestaurantId,@title,@price,@desc,@img)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_tblOrders_tblCardDetails]    Script Date: 01-Jul-21 10:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Insert_tblOrders_tblCardDetails] 
				 @OrderId varchar(15),
				 @customerId int,
				 @Items varchar(300),
				 @subtotal varchar(50),
				 @charge varchar(50),
				 @total varchar(50),
				 @ODate datetime,
				 @street varchar(50),
				 @city varchar(15),
				 @zip varchar(10),
				 @pMethod varchar(15),
				 @status varchar(15),
				 
				 @CardNumber varchar(20),
				 @CardExpiry varchar(10),
				 @CardCVV varchar(3),
				 @CardholderName varchar(50)
AS
BEGIN
	insert into tbl_orders values(@OrderId,@customerId,@Items,@subtotal,@charge,@total,@pMethod,@ODate,@street,@city,@zip,@status)
	insert into tbl_orders_cardDetails values(@OrderId,@CardNumber,@CardExpiry,@CardCVV,@CardholderName)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insertRestaurantAndLocation]    Script Date: 01-Jul-21 10:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_insertRestaurantAndLocation] 
	@rid int,
	@state varchar(20),
	@city varchar(20),
	@address varchar(100),
	@zip varchar(10),
	/*RESTAURANT*/
	@r_name varchar(50),
	@r_cat varchar(30),
	@r_desc varchar(200),
	@r_banner varchar(100),
	@r_logo varchar(100)

AS
BEGIN
	INSERT INTO tbl_restaurant VALUES(@r_name,@r_cat,@r_desc,@r_banner,@r_logo)
	INSERT INTO tbl_location VALUES(@rid,@state,@city,@address,@zip)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Update_tblRestaurant_tblAddress]    Script Date: 01-Jul-21 10:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Update_tblRestaurant_tblAddress]
				 @rid int,
				 @rname varchar(50),
				 @cat varchar(30),
				 @desc varchar(200),
				 @banner varchar(100),
				 @logo varchar(100),
				 
				 @lid int,
				 @city varchar(20),
				 @state varchar(20),
				 @adress varchar(100),
				 @zip varchar(10)
AS
BEGIN
	update tbl_restaurant set r_name=@rname,r_category=@cat,r_desc=@desc,r_banner_img=@banner,r_logo=@logo where r_id=@rid
	update tbl_location set l_state=@state,l_city=@city,l_address=@adress,l_zip=@zip where l_id=@lid
END
GO
USE [master]
GO
ALTER DATABASE [foodDB] SET  READ_WRITE 
GO

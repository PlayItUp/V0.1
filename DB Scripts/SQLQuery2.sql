USE [master]
GO
/****** Object:  Database [PlayItUp]    Script Date: 4/9/2019 5:16:36 PM ******/
CREATE DATABASE [PlayItUp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PlayItUp', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PlayItUp.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PlayItUp_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PlayItUp_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PlayItUp] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PlayItUp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PlayItUp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PlayItUp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PlayItUp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PlayItUp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PlayItUp] SET ARITHABORT OFF 
GO
ALTER DATABASE [PlayItUp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PlayItUp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PlayItUp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PlayItUp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PlayItUp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PlayItUp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PlayItUp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PlayItUp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PlayItUp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PlayItUp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PlayItUp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PlayItUp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PlayItUp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PlayItUp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PlayItUp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PlayItUp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PlayItUp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PlayItUp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PlayItUp] SET  MULTI_USER 
GO
ALTER DATABASE [PlayItUp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PlayItUp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PlayItUp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PlayItUp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PlayItUp] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PlayItUp]
GO
/****** Object:  Table [dbo].[table_address]    Script Date: 4/9/2019 5:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[table_address](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[lane_name] [varchar](1) NULL,
	[locality_id] [int] NOT NULL,
	[pin] [int] NULL,
	[city] [varchar](1) NULL,
	[state_name] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[table_coupons]    Script Date: 4/9/2019 5:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[table_coupons](
	[coupon_id] [int] IDENTITY(1,1) NOT NULL,
	[coupon_name] [varchar](1) NULL,
	[discount_percentage] [int] NULL,
	[expiry_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[coupon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[table_ground_bookings]    Script Date: 4/9/2019 5:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table_ground_bookings](
	[booking_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[location_id] [int] NOT NULL,
	[transaction_id] [int] NOT NULL,
	[slot_id] [int] NOT NULL,
	[user_coupon_id] [int] NOT NULL,
	[time_of_booking] [timestamp] NOT NULL,
	[booking_date] [date] NULL,
	[billing_amount] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[table_locality]    Script Date: 4/9/2019 5:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[table_locality](
	[locality_id] [int] IDENTITY(1,1) NOT NULL,
	[locality_name] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[locality_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[table_payment_methods]    Script Date: 4/9/2019 5:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[table_payment_methods](
	[payment_method_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_method] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_method_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[table_ratings]    Script Date: 4/9/2019 5:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[table_ratings](
	[rating_id] [int] IDENTITY(1,1) NOT NULL,
	[booking_id] [int] NOT NULL,
	[ratings] [int] NULL,
	[review] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[rating_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[table_slot]    Script Date: 4/9/2019 5:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table_slot](
	[slot_id] [int] IDENTITY(1,1) NOT NULL,
	[slot_start_time] [time](7) NULL,
	[slot_duration] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[slot_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[table_sports]    Script Date: 4/9/2019 5:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[table_sports](
	[sports_id] [int] IDENTITY(1,1) NOT NULL,
	[sports_name] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[sports_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[table_sports_location]    Script Date: 4/9/2019 5:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[table_sports_location](
	[sports_location_id] [int] IDENTITY(1,1) NOT NULL,
	[sports_id] [int] NOT NULL,
	[address_id] [int] NOT NULL,
	[ground_name] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[sports_location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[table_tournament_address]    Script Date: 4/9/2019 5:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table_tournament_address](
	[tournament_address_id] [int] IDENTITY(1,1) NOT NULL,
	[tournament_id] [int] NOT NULL,
	[address_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tournament_address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[table_tournament_bookings]    Script Date: 4/9/2019 5:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table_tournament_bookings](
	[tournament_booking_id] [int] IDENTITY(1,1) NOT NULL,
	[tournament_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[transaction_id] [int] NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[tournament_booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[table_tournaments]    Script Date: 4/9/2019 5:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[table_tournaments](
	[tournament_id] [int] IDENTITY(1,1) NOT NULL,
	[sports_id] [int] NOT NULL,
	[tournament_name] [varchar](1) NULL,
	[tournament_date] [date] NULL,
	[tournament_time] [time](7) NULL,
	[prize_amount] [bigint] NULL,
	[joining_fee] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[tournament_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[table_transactions]    Script Date: 4/9/2019 5:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table_transactions](
	[transaction_id] [int] IDENTITY(1,1) NOT NULL,
	[transaction_time] [timestamp] NOT NULL,
	[transaction_amount] [bigint] NULL,
	[payment_method_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[table_user]    Script Date: 4/9/2019 5:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[table_user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](1) NULL,
	[user_mail] [varchar](1) NULL,
	[Phone_no] [bigint] NULL,
	[sex] [varchar](1) NULL,
	[user_password] [varchar](1) NULL,
	[type_id] [int] NOT NULL,
	[emergency_contact] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[table_user_coupons]    Script Date: 4/9/2019 5:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table_user_coupons](
	[user_coupon_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[coupon_id] [int] NOT NULL,
	[coupon_amount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_coupon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[table_user_type]    Script Date: 4/9/2019 5:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[table_user_type](
	[type_id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[table_user_wallet]    Script Date: 4/9/2019 5:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table_user_wallet](
	[wallet_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[wallet_balance] [bigint] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[wallet_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[table_address]  WITH CHECK ADD FOREIGN KEY([locality_id])
REFERENCES [dbo].[table_locality] ([locality_id])
GO
ALTER TABLE [dbo].[table_ground_bookings]  WITH CHECK ADD FOREIGN KEY([location_id])
REFERENCES [dbo].[table_sports_location] ([sports_location_id])
GO
ALTER TABLE [dbo].[table_ground_bookings]  WITH CHECK ADD FOREIGN KEY([slot_id])
REFERENCES [dbo].[table_slot] ([slot_id])
GO
ALTER TABLE [dbo].[table_ground_bookings]  WITH CHECK ADD FOREIGN KEY([transaction_id])
REFERENCES [dbo].[table_transactions] ([transaction_id])
GO
ALTER TABLE [dbo].[table_ground_bookings]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[table_user] ([user_id])
GO
ALTER TABLE [dbo].[table_ground_bookings]  WITH CHECK ADD FOREIGN KEY([user_coupon_id])
REFERENCES [dbo].[table_user_coupons] ([user_coupon_id])
GO
ALTER TABLE [dbo].[table_ratings]  WITH CHECK ADD FOREIGN KEY([booking_id])
REFERENCES [dbo].[table_ground_bookings] ([booking_id])
GO
ALTER TABLE [dbo].[table_sports_location]  WITH CHECK ADD FOREIGN KEY([address_id])
REFERENCES [dbo].[table_address] ([address_id])
GO
ALTER TABLE [dbo].[table_sports_location]  WITH CHECK ADD FOREIGN KEY([sports_id])
REFERENCES [dbo].[table_sports] ([sports_id])
GO
ALTER TABLE [dbo].[table_tournament_address]  WITH CHECK ADD FOREIGN KEY([address_id])
REFERENCES [dbo].[table_address] ([address_id])
GO
ALTER TABLE [dbo].[table_tournament_address]  WITH CHECK ADD FOREIGN KEY([tournament_id])
REFERENCES [dbo].[table_tournaments] ([tournament_id])
GO
ALTER TABLE [dbo].[table_tournament_bookings]  WITH CHECK ADD FOREIGN KEY([tournament_id])
REFERENCES [dbo].[table_tournaments] ([tournament_id])
GO
ALTER TABLE [dbo].[table_tournament_bookings]  WITH CHECK ADD FOREIGN KEY([transaction_id])
REFERENCES [dbo].[table_transactions] ([transaction_id])
GO
ALTER TABLE [dbo].[table_tournament_bookings]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[table_user] ([user_id])
GO
ALTER TABLE [dbo].[table_tournaments]  WITH CHECK ADD FOREIGN KEY([sports_id])
REFERENCES [dbo].[table_sports] ([sports_id])
GO
ALTER TABLE [dbo].[table_transactions]  WITH CHECK ADD FOREIGN KEY([payment_method_id])
REFERENCES [dbo].[table_payment_methods] ([payment_method_id])
GO
ALTER TABLE [dbo].[table_user]  WITH CHECK ADD FOREIGN KEY([type_id])
REFERENCES [dbo].[table_user_type] ([type_id])
GO
ALTER TABLE [dbo].[table_user_coupons]  WITH CHECK ADD FOREIGN KEY([coupon_id])
REFERENCES [dbo].[table_coupons] ([coupon_id])
GO
ALTER TABLE [dbo].[table_user_coupons]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[table_user] ([user_id])
GO
ALTER TABLE [dbo].[table_user_wallet]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[table_user] ([user_id])
GO
USE [master]
GO
ALTER DATABASE [PlayItUp] SET  READ_WRITE 
GO
